String formateDateTime(DateTime dateTime) {
  return '${dateTime.day} de ${formateDateTimeMonthsInText(dateTime)} de ${dateTime.year}';
}

String formateDateTimeMonthsInText(DateTime dateTime) {
  String month = dateTime.month.toString();
  switch (month) {
    case '1':
      return 'Ene';
    case '2':
      return 'Feb';
    case '3':
      return 'Mar';
    case '4':
      return 'Abr';
    case '5':
      return 'Mayo';
    case '6':
      return 'Jun';
    case '7':
      return 'Jul';
    case '8':
      return 'Ago';
    case '9':
      return 'Sep';
    case '10':
      return 'Oct';
    case '11':
      return 'Nov';
    case '12':
      return 'Dic';
    default:
      return 'Error';
  }
}
