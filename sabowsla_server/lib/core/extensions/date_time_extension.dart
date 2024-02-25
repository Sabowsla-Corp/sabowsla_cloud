extension DateTimeExtension on DateTime {
  /// Retorna el numero de dias que tiene un mes
  int daysCount() => DateTime(year, month + 1, 0).day;

  DateTime get startOfMonth {
    return DateTime(year, month);
  }

  DateTime get endOfMonth {
    return DateTime(year, month, daysCount());
  }

  DateTime get startOfDay {
    return DateTime(year, month, day);
  }

  DateTime get endOfDay {
    return DateTime(year, month, day, 23, 59, 59);
  }

  DateTime substractMonth() {
    DateTime prevMont = DateTime(year, month).subtract(
      const Duration(days: 1),
    );
    return DateTime(prevMont.year, prevMont.month, day);
  }

  DateTime addMonth() {
    DateTime prevMont = DateTime(year, month, daysCount()).add(
      const Duration(days: 1),
    );
    return DateTime(prevMont.year, prevMont.month, day);
  }
}

String timeFormated(double? seconds) {
  if (seconds == null) {
    return "00:00";
  }
  Duration duration = Duration(seconds: seconds.toInt());
  int hours = duration.inHours;
  int minutes = duration.inMinutes.remainder(60);
  int secondsRemain = duration.inSeconds.remainder(60);

  String hoursStr = hours > 0 ? hours.toString().padLeft(2, '0') : '';
  String minutesStr = minutes.toString().padLeft(2, '0');
  String secondsStr = secondsRemain.toString().padLeft(2, '0');

  return '${hoursStr.isNotEmpty ? '$hoursStr:' : ''}$minutesStr:$secondsStr';
}

List<String> monthsEnglish = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
];

List<String> monthsSpanish = [
  "Enero",
  "Febrero",
  "Marzo",
  "Abril",
  "Mayo",
  "Junio",
  "Julio",
  "Agosto",
  "Septiembre",
  "Octobre",
  "Noviembre",
  "Diciembre",
];
