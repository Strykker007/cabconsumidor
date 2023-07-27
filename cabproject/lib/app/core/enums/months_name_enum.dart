enum MonthsNameEnum {
  january,
  february,
  march,
  april,
  may,
  june,
  july,
  august,
  september,
  october,
  november,
  december
}

extension MonthsNameEnumExtension on MonthsNameEnum {
  String? get label {
    switch (this) {
      case MonthsNameEnum.january:
        return 'Janeiro';
      case MonthsNameEnum.february:
        return 'Fevereiro';
      case MonthsNameEnum.march:
        return 'Março';
      case MonthsNameEnum.april:
        return 'Abril';
      case MonthsNameEnum.may:
        return 'Maio';
      case MonthsNameEnum.june:
        return 'Junho';
      case MonthsNameEnum.july:
        return 'Julho';
      case MonthsNameEnum.august:
        return 'Agosto';
      case MonthsNameEnum.september:
        return 'Setembro';
      case MonthsNameEnum.october:
        return 'Outubro';
      case MonthsNameEnum.november:
        return 'Novembro';
      case MonthsNameEnum.december:
        return 'Dezembro';
    }
  }

  String? get toJson {
    switch (this) {
      case MonthsNameEnum.january:
        return 'janeiro';
      case MonthsNameEnum.february:
        return 'fevereiro';
      case MonthsNameEnum.march:
        return 'março';
      case MonthsNameEnum.april:
        return 'abril';
      case MonthsNameEnum.may:
        return 'maio';
      case MonthsNameEnum.june:
        return 'junho';
      case MonthsNameEnum.july:
        return 'julho';
      case MonthsNameEnum.august:
        return 'agosto';
      case MonthsNameEnum.september:
        return 'setembro';
      case MonthsNameEnum.october:
        return 'outubro';
      case MonthsNameEnum.november:
        return 'novembro';
      case MonthsNameEnum.december:
        return 'dezembro';
      default:
        return null;
    }
  }
}

MonthsNameEnum? monthsNameEnumFromDate(int? month) {
  switch (month) {
    case 01:
      return MonthsNameEnum.january;
    case 02:
      return MonthsNameEnum.february;
    case 03:
      return MonthsNameEnum.march;
    case 04:
      return MonthsNameEnum.april;
    case 05:
      return MonthsNameEnum.may;
    case 06:
      return MonthsNameEnum.june;
    case 07:
      return MonthsNameEnum.july;
    case 08:
      return MonthsNameEnum.august;
    case 09:
      return MonthsNameEnum.september;
    case 10:
      return MonthsNameEnum.october;
    case 11:
      return MonthsNameEnum.november;
    case 12:
      return MonthsNameEnum.december;
    default:
      return null;
  }
}
