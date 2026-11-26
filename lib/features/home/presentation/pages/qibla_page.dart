import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:islamy/core/theme/app_theme.dart';

/// Displays an interactive Qibla compass screen calculated from device GPS.
class QiblaPage extends StatefulWidget {
  const QiblaPage({super.key, this.initialQiblaDegrees = 136});

  final int initialQiblaDegrees;

  @override
  State<QiblaPage> createState() => _QiblaPageState();
}

class _QiblaPageState extends State<QiblaPage> {
  static const double _kaabaLat = 21.422487;
  static const double _kaabaLng = 39.826206;

  late double _qiblaBearing;
  double _heading = 0;
  double _distanceKm = 1285;
  String _locationName = 'القاهرة، مصر';
  bool _locating = false;

  @override
  void initState() {
    super.initState();
    _qiblaBearing = widget.initialQiblaDegrees.toDouble();
    _heading = _qiblaBearing;
    _detectLocationAndQibla();
  }

  Future<void> _detectLocationAndQibla() async {
    setState(() => _locating = true);
    try {
      if (!await Geolocator.isLocationServiceEnabled()) {
        setState(() => _locating = false);
        return;
      }
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        setState(() => _locating = false);
        return;
      }
      final pos = await Geolocator.getCurrentPosition();
      final bearing = _calculateQiblaBearing(pos.latitude, pos.longitude);
      final distanceMeters = Geolocator.distanceBetween(
        pos.latitude,
        pos.longitude,
        _kaabaLat,
        _kaabaLng,
      );

      var cityLabel = 'موقعك الحالي';
      try {
        final placemarks = await Geocoding().placemarkFromCoordinates(
          pos.latitude,
          pos.longitude,
        );
        if (placemarks.isNotEmpty) {
          final p = placemarks.first;
          final city = p.locality ?? p.subAdministrativeArea;
          final country = p.country;
          if (city != null && city.trim().isNotEmpty) {
            cityLabel = country != null && country.trim().isNotEmpty
                ? '${city.trim()}، ${country.trim()}'
                : city.trim();
          }
        }
      } catch (_) {}

      if (!mounted) return;
      setState(() {
        _qiblaBearing = bearing;
        _heading = bearing;
        _distanceKm = distanceMeters / 1000;
        _locationName = cityLabel;
        _locating = false;
      });
    } catch (_) {
      if (mounted) setState(() => _locating = false);
    }
  }

  static double _calculateQiblaBearing(double lat, double lng) {
    final phi1 = lat * math.pi / 180.0;
    final phi2 = _kaabaLat * math.pi / 180.0;
    final deltaLng = (_kaabaLng - lng) * math.pi / 180.0;

    final y = math.sin(deltaLng);
    final x =
        math.cos(phi1) * math.tan(phi2) - math.sin(phi1) * math.cos(deltaLng);
    final theta = math.atan2(y, x) * 180.0 / math.pi;
    return (theta + 360.0) % 360.0;
  }

  static String _cardinalArabic(double deg) {
    final normalized = (deg % 360 + 360) % 360;
    if (normalized >= 337.5 || normalized < 22.5) return 'شمال';
    if (normalized < 67.5) return 'شمال شرق';
    if (normalized < 112.5) return 'شرق';
    if (normalized < 157.5) return 'جنوب شرق';
    if (normalized < 202.5) return 'جنوب';
    if (normalized < 247.5) return 'جنوب غرب';
    if (normalized < 292.5) return 'غرب';
    return 'شمال غرب';
  }

  bool get _isAligned {
    final diff = ((_qiblaBearing - _heading + 540) % 360) - 180;
    return diff.abs() <= 4;
  }

  @override
  Widget build(BuildContext context) {
    final qiblaInt = _qiblaBearing.round();
    final headingInt = _heading.round();
    final aligned = _isAligned;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top header
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.primary,
                      Color(0xFF0D5C3A),
                      AppColors.primaryContainer,
                    ],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1F004328),
                      blurRadius: 16,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Material(
                          color: Colors.white.withValues(alpha: 0.14),
                          shape: const CircleBorder(),
                          child: InkWell(
                            customBorder: const CircleBorder(),
                            onTap: () => context.pop(),
                            child: const SizedBox(
                              width: 38,
                              height: 38,
                              child: Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'اتجاه القبلة',
                                style: AppTheme.arabic(
                                  size: 22,
                                  weight: FontWeight.w700,
                                  color: Colors.white,
                                  height: 28,
                                ),
                              ),
                              Text(
                                'بوصلة مكة المكرمة والكعبة المشرفة',
                                style: AppTheme.text(
                                  size: 12,
                                  color: AppColors.mintSoft,
                                  height: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          tooltip: 'تحديث الموقع',
                          onPressed: _locating ? null : _detectLocationAndQibla,
                          icon: _locating
                              ? const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: AppColors.goldAccent,
                                  ),
                                )
                              : const Icon(
                                  Icons.my_location_rounded,
                                  color: AppColors.goldAccent,
                                ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.location_on_rounded,
                                size: 16,
                                color: AppColors.goldAccent,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                _locationName,
                                style: AppTheme.text(
                                  size: 12,
                                  weight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'المسافة إلى مكة: ${_distanceKm.round()} كم',
                            style: AppTheme.text(
                              size: 12,
                              weight: FontWeight.w600,
                              color: AppColors.goldContainer,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Alignment status pill
              Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: aligned
                        ? AppColors.mint
                        : AppColors.goldContainer.withValues(alpha: 0.45),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(
                      color: aligned ? AppColors.primary : AppColors.goldLight,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        aligned
                            ? Icons.check_circle_rounded
                            : Icons.explore_rounded,
                        size: 18,
                        color: aligned ? AppColors.primary : AppColors.gold,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        aligned
                            ? 'أنت الآن في اتجاه القبلة الصحيح'
                            : 'وجّه السهم الذهبي نحو رمز الكعبة بالأعلى',
                        style: AppTheme.text(
                          size: 12,
                          weight: FontWeight.w700,
                          color: aligned ? AppColors.primary : AppColors.gold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Interactive Compass Dial
              Center(
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Outer decorative ring
                      Container(
                        width: 288,
                        height: 288,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: aligned
                                ? AppColors.primary
                                : AppColors.goldLight.withValues(alpha: 0.6),
                            width: aligned ? 3 : 1.8,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.08),
                              blurRadius: 24,
                              offset: const Offset(0, 12),
                            ),
                          ],
                        ),
                      ),
                      // Rotating compass rose
                      Transform.rotate(
                        angle: -_heading * math.pi / 180,
                        child: CustomPaint(
                          size: const Size(268, 268),
                          painter: _CompassDialPainter(
                            qiblaDegrees: _qiblaBearing,
                          ),
                        ),
                      ),
                      // Qibla pointer relative to current device heading
                      Transform.rotate(
                        angle: (_qiblaBearing - _heading) * math.pi / 180,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.goldAccent,
                                  width: 2,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x26000000),
                                    blurRadius: 6,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.mosque_rounded,
                                size: 18,
                                color: AppColors.goldAccent,
                              ),
                            ),
                            Container(
                              width: 4,
                              height: 76,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    AppColors.goldAccent,
                                    AppColors.primary,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            const SizedBox(height: 86),
                          ],
                        ),
                      ),
                      // Center hub showing degree
                      Container(
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary,
                          border: Border.all(
                            color: AppColors.goldAccent,
                            width: 2.5,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x22000000),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '$qiblaInt°',
                              style: AppTheme.text(
                                size: 20,
                                weight: FontWeight.w700,
                                color: AppColors.goldAccent,
                                height: 22,
                              ),
                            ),
                            Text(
                              _cardinalArabic(_qiblaBearing),
                              style: AppTheme.text(
                                size: 10,
                                weight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Metrics row
              Row(
                children: [
                  Expanded(
                    child: _MetricCard(
                      label: 'زاوية القبلة',
                      value: '$qiblaInt° ${_cardinalArabic(_qiblaBearing)}',
                      icon: Icons.mosque_rounded,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _MetricCard(
                      label: 'اتجاه البوصلة',
                      value: '$headingInt° ${_cardinalArabic(_heading)}',
                      icon: Icons.compass_calibration_rounded,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Manual rotation slider for testing / calibration on devices without magnetometer
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.surfaceContainer),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'محاكاة دوران البوصلة والمعايرة',
                          style: AppTheme.text(
                            size: 13,
                            weight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                        TextButton(
                          onPressed: () =>
                              setState(() => _heading = _qiblaBearing),
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'محاذاة للقبلة',
                            style: AppTheme.text(
                              size: 12,
                              weight: FontWeight.w700,
                              color: AppColors.gold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: _heading.clamp(0.0, 360.0),
                      max: 360,
                      activeColor: AppColors.primary,
                      inactiveColor: AppColors.surfaceContainer,
                      onChanged: (v) => setState(() => _heading = v),
                    ),
                    Text(
                      'ضع الهاتف على سطح مستوٍ بعيدًا عن المعادن أو حرك المؤشر لمعايرة الاتجاه.',
                      style: AppTheme.text(
                        size: 11,
                        color: AppColors.onSurfaceVariant,
                        height: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.surfaceContainer),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.mint.withValues(alpha: 0.45),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Icon(icon, size: 18, color: AppColors.primary),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTheme.text(
                    size: 11,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.text(
                    size: 13,
                    weight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CompassDialPainter extends CustomPainter {
  const _CompassDialPainter({required this.qiblaDegrees});

  final double qiblaDegrees;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final majorTick = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final minorTick = Paint()
      ..color = AppColors.outline
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    for (var i = 0; i < 360; i += 6) {
      final isMajor = i % 30 == 0;
      final angle = (i - 90) * math.pi / 180;
      final outer = Offset(
        center.dx + (radius - 6) * math.cos(angle),
        center.dy + (radius - 6) * math.sin(angle),
      );
      final inner = Offset(
        center.dx + (radius - (isMajor ? 18 : 12)) * math.cos(angle),
        center.dy + (radius - (isMajor ? 18 : 12)) * math.sin(angle),
      );
      canvas.drawLine(inner, outer, isMajor ? majorTick : minorTick);
    }

    const cardinals = [
      (0, 'ش', AppColors.gold),
      (90, 'شر', AppColors.primary),
      (180, 'ج', AppColors.primary),
      (270, 'غ', AppColors.primary),
    ];

    for (final c in cardinals) {
      final angle = (c.$1 - 90) * math.pi / 180;
      final pos = Offset(
        center.dx + (radius - 34) * math.cos(angle),
        center.dy + (radius - 34) * math.sin(angle),
      );
      final tp = TextPainter(
        text: TextSpan(
          text: c.$2,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: c.$3,
          ),
        ),
        textDirection: TextDirection.rtl,
      )..layout();
      tp.paint(canvas, pos - Offset(tp.width / 2, tp.height / 2));
    }
  }

  @override
  bool shouldRepaint(covariant _CompassDialPainter oldDelegate) =>
      oldDelegate.qiblaDegrees != qiblaDegrees;
}
