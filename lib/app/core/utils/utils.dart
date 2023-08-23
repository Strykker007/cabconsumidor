import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Utils {
  static String getShortMonthName(int monthNumber) {
    switch (monthNumber) {
      case 1:
        return 'Jan';
      case 2:
        return 'Fev';
      case 3:
        return 'Mar';
      case 4:
        return 'Abr';
      case 5:
        return 'Mai';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Ago';
      case 9:
        return 'Set';
      case 10:
        return 'Out';
      case 11:
        return 'Nov';
      case 12:
        return 'Dez';
      default:
        return '';
    }
  }

  static Future<String?> scanQRCode() async {
    try {
      String qrCodeResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', // Cor personalizada para a tela de digitalização
        'Cancelar', // Texto do botão de cancelar
        false, // Desabilitar a animação do scanner
        ScanMode.QR, // Modo de digitalização do QR code
      );

      if (qrCodeResult == '-1') {
        // Usuário cancelou a digitalização
        return null;
      }

      return qrCodeResult;
    } catch (e) {
      // Lidar com erros de leitura de QR code
      return null;
    }
  }
}
