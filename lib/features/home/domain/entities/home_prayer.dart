/// Prayer entry shown in the home prayer timeline.
class HomePrayer {
  const HomePrayer({
    required this.name,
    required this.arabicName,
    required this.time,
  });

  final String name;
  final String arabicName;
  final String time;
}
