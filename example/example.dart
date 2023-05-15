import 'package:daylight/daylight.dart';
import 'package:intl/intl.dart';

void main() {
  const berlin = const DaylightLocation(52.518611, 13.408056);
  final october = DateTime(2020, 10, 15);

  // Create berlin calculator
  const berlinSunCalculator = const DaylightCalculator(berlin);

  // calculate for sunrise on civil twilight
  final civilSunrise = berlinSunCalculator.calculateEvent(
    october,
    Zenith.civil,
    EventType.sunrise,
  );
  if (civilSunrise != null) {
    print(DateFormat("HH:mm:ss").format(civilSunrise)); // utc: 04:58:18
  }

  // calculate for sunrise and sunset on astronomical twilight
  final astronomicalEvents = berlinSunCalculator.calculateForDay(
    october,
    Zenith.astronomical,
  );
  final sunset = astronomicalEvents.sunset;
  if (sunset != null) {
    print(
      DateFormat("HH:mm:ss").format(sunset),
    ); // utc: 18:03:55
  }
  final sunrise = astronomicalEvents.sunrise;
  if (sunrise != null) {
    print(
      DateFormat("HH:mm:ss").format(sunrise),
    ); // utc: 03:39:09
    print(astronomicalEvents.type); // DayType.sunriseAndSunset
  }
}
