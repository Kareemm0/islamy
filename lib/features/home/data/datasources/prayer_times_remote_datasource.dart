import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../../../../core/network/api_endpoints.dart';
import '../../domain/entities/home_prayer.dart';

class PrayerTimesResult {
  const PrayerTimesResult({
    required this.prayers,
    required this.city,
    required this.hijriDate,
    required this.gregorianDate,
  });

  final List<HomePrayer> prayers;
  final String city;
  final String hijriDate;
  final String gregorianDate;
}

/// Loads today's prayer times for the device city, restricted to Egypt.
class PrayerTimesRemoteDataSource {
  PrayerTimesRemoteDataSource({http.Client? client})
    : _client = client ?? http.Client();

  final http.Client _client;
  final Geocoding _geocoding = Geocoding();

  Future<PrayerTimesResult> getToday() async {
    final city = await _deviceCity();
    final response = await _client.get(
      Uri.parse(
        ApiEndpoints.prayerTimesByCity(date: DateTime.now(), city: city),
      ),
      headers: const {'Accept': 'application/json'},
    );
    if (response.statusCode != 200) {
      throw Exception('Prayer times request failed (${response.statusCode})');
    }

    final root = jsonDecode(utf8.decode(response.bodyBytes));
    if (root is! Map<String, dynamic> ||
        root['data'] is! Map<String, dynamic>) {
      throw const FormatException('Unexpected prayer times response');
    }
    final data = root['data'] as Map<String, dynamic>;
    final timings = data['timings'] as Map<String, dynamic>;
    final date = data['date'] as Map<String, dynamic>;
    final hijri = date['hijri'] as Map<String, dynamic>;
    final hijriMonth = hijri['month'] as Map<String, dynamic>;
    final gregorian = date['gregorian'] as Map<String, dynamic>;

    String time(String key) => (timings[key] as String).split(' ').first;

    return PrayerTimesResult(
      city: city == 'Cairo' ? 'القاهرة' : city,
      prayers: [
        HomePrayer(name: 'الفجر', arabicName: 'الفجر', time: time('Fajr')),
        HomePrayer(name: 'الظهر', arabicName: 'الظهر', time: time('Dhuhr')),
        HomePrayer(name: 'العصر', arabicName: 'العصر', time: time('Asr')),
        HomePrayer(
          name: 'المغرب',
          arabicName: 'المغرب',
          time: time('Maghrib'),
        ),
        HomePrayer(name: 'العشاء', arabicName: 'العشاء', time: time('Isha')),
      ],
      hijriDate:
          '${hijri['day']} ${hijriMonth['ar'] ?? hijriMonth['en']} ${hijri['year']} هـ',
      gregorianDate: gregorian['date'] as String,
    );
  }

  Future<String> _deviceCity() async {
    try {
      if (!await Geolocator.isLocationServiceEnabled()) return 'Cairo';
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return 'Cairo';
      }
      final position = await Geolocator.getCurrentPosition();
      final placemarks = await _geocoding.placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      final place = placemarks.isEmpty ? null : placemarks.first;
      final city = place?.locality ?? place?.subAdministrativeArea;
      return city == null || city.trim().isEmpty ? 'Cairo' : city.trim();
    } catch (_) {
      return 'Cairo';
    }
  }
}
