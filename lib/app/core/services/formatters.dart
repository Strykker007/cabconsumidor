import 'package:cabconsumidor/app/core/enums/months_name_enum.dart';
import 'package:intl/intl.dart';

class Formatters {
  static String formatNumber(double number) {
    return NumberFormat.decimalPattern('pt-br').format(number);
  }

  static String formatCPF(String cpf) {
    final String numeros = cpf.replaceAll(RegExp(r'[^0-9]'), '');
    if (numeros.length != 11) return cpf;
    return '${numeros.substring(0, 3)}.${numeros.substring(3, 6)}'
        '.${numeros.substring(6, 9)}-${numeros.substring(9)}';
  }

  static String formatPhone(String phone) {
    final String numeros = phone.replaceAll(RegExp(r'[^0-9]'), '');
    if (numeros.length != 11) return phone;
    if (numeros[0] == '0') {
      return '(${numeros.substring(0, 3)}) '
          '${numeros.substring(3, 7)}-${numeros.substring(7)}';
    }
    return '(${numeros.substring(0, 2)}) ${numeros.substring(2, 3)} '
        '${numeros.substring(3, 7)}-${numeros.substring(7)}';
  }

  static DateTime stringToDateTime(String date) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss').parse(date).toLocal();
  }

  static String stringMonthNameAndYear(String date) {
    final DateTime dateTime = stringToDate(date);

    return '${monthsNameEnumFromDate(dateTime.month)!.label}/${dateTime.year}';
  }

  static DateTime stringToDate(String date, {String format = 'yyyy-MM-dd'}) {
    return DateFormat(format).parse(date).toLocal();
  }

  static String dateToStringDate(
    DateTime date, {
    String format = 'dd/MM/yyyy',
  }) {
    return DateFormat(format).format(date.toLocal());
  }

  static String dateAndMonthToStringDate(
    DateTime date, {
    String format = 'dd/MM',
  }) {
    return DateFormat(format).format(date.toLocal());
  }

  static String formatPhoneToParentesisFormat(String phone) {
    String cleanedNumber = phone.replaceAll(RegExp(r'[^\d]'), '');

    if (cleanedNumber.length == 11) {
      return '(${cleanedNumber.substring(0, 2)}) ${cleanedNumber.substring(2, 7)}-${cleanedNumber.substring(7)}';
    }

    return phone;
  }

  static String formatCEP(String? cep) {
    if (cep != null && cep.isNotEmpty) {
      if (cep.length == 8) {
        return '${cep.substring(0, 5)}-${cep.substring(5)}';
      }
    }
    return 'CEP Inválido';
  }

  static String formatDistance(num distanceInMeters) {
    double distanceInKm =
        distanceInMeters / 1000; // Convertendo para quilômetros
    return '${distanceInKm.toStringAsFixed(distanceInKm <= 0 ? 0 : 2)} km'; // Formatando para duas casas decimais
  }

  static String dateToStringDateWithHifen(
    DateTime date, {
    String format = 'yyyy-MM-dd',
  }) {
    return DateFormat(format).format(date.toLocal());
  }

  static String dateToStringTime(DateTime date) {
    return DateFormat('Hm').format(date.toLocal());
  }

  static String dateToStringDateTime(DateTime date) {
    return DateFormat('dd/MM/yyyy HH:mm').format(date.toLocal());
  }

  static String capitalize(String value, {String pattern = ' '}) {
    final List<String> splited = value.split(pattern);
    final List<String> capitalized = List.empty(growable: true);
    for (final item in splited) {
      capitalized.add(
        '${item[0].toUpperCase()}'
        '${item.substring(1).toLowerCase()}',
      );
    }
    return capitalized.join(' ');
  }

  //capitalize ignorando palavras como de, da, do, etc
  static String capitalizeIgnoringWords(String value, {String pattern = ' '}) {
    const String pronomes =
        'de|da|do|das|dos|em|a|e|o|ou|com|para|por|sem|sobre|';
    final List<String> splited = value.split(pattern);
    final List<String> capitalized = List.empty(growable: true);
    for (final item in splited) {
      if (pronomes.contains(item.toLowerCase())) {
        capitalized.add(item.toLowerCase());
      } else {
        capitalized.add(
          '${item[0].toUpperCase()}'
          '${item.substring(1).toLowerCase()}',
        );
      }
    }
    return capitalized.join(' ');
  }

  static String cardValid(DateTime date) {
    return DateFormat('MM/yyyy').format(date.toLocal());
  }

  static String dateToDDMMYYYY(String date) {
    final List<String> splited = date.split('-');
    return '${splited[2]}/${splited[1]}/${splited[0]}';
  }

  static String converterData(String data) {
    if (data.isEmpty || data.length < 10) {
      return 'N/A';
    }
    var dataFormatada = data.split('-');
    var dia = dataFormatada[2];
    var mes = dataFormatada[1];
    var ano = dataFormatada[0];
    var mesFormatado = '';
    switch (mes) {
      case '01':
        mesFormatado = 'Jan';
        break;
      case '02':
        mesFormatado = 'Fev';
        break;
      case '03':
        mesFormatado = 'Mar';
        break;
      case '04':
        mesFormatado = 'Abr';
        break;
      case '05':
        mesFormatado = 'Mai';
        break;
      case '06':
        mesFormatado = 'Jun';
        break;
      case '07':
        mesFormatado = 'Jul';
        break;
      case '08':
        mesFormatado = 'Ago';
        break;
      case '09':
        mesFormatado = 'Set';
        break;
      case '10':
        mesFormatado = 'Out';
        break;
      case '11':
        mesFormatado = 'Nov';
        break;
      case '12':
        mesFormatado = 'Dez';
        break;
      default:
        mesFormatado = 'Jan';
    }
    return '$dia $mesFormatado $ano';
  }
}
