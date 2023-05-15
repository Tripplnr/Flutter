import 'package:flutter/material.dart';

class ColorConstant {
  static Color black = Colors.black;

  static Color white = Colors.white;

  static Color blueA400 = fromHex('#1877f2');

  static Color lightBlue100 = fromHex('#a5d8ff');

  static Color black9003f = fromHex('#3f000000');

  static Color black9004c01 = fromHex('#4c000000');

  static Color lightBlue900 = fromHex('#0657a1');

  static Color black90001 = fromHex('#000000');

  static Color yellow90099 = fromHex('#99fd7e14');

  static Color lime90033 = fromHex('#33a75d1f');

  static Color gray9004c = fromHex('#4c222222');

  static Color gray20001 = fromHex('#e8e8e7');

  static Color gray20002 = fromHex('#e8e8ec');

  static Color yellow90019 = fromHex('#19fd7e14');

  static Color black90002 = fromHex('#110800');

  static Color gray600 = fromHex('#888480');

  static Color black9004c = fromHex('#4c110801');

  static Color gray400 = fromHex('#cdbeb0');

  static Color blueGray100 = fromHex('#cfcecc');

  static Color orangeA200 = fromHex('#ff953c');

  static Color orangeA300 = fromHex('#FFD9B9');

  static Color blue700 = fromHex('#1c7ed6');

  static Color gray1007f = fromHex('#7ff4f4f4');

  static Color gray800 = fromHex('#413934');

  static Color blue500 = fromHex('#339af0');

  static Color orangeA20001 = fromHex('#fd9843');

  static Color gray2004c = fromHex('#4ce8e7e6');

  static Color gray200 = fromHex('#e8e7e6');

  static Color black90099 = fromHex('#99110800');

  static Color bluegray400 = fromHex('#888888');

  static Color gray10001 = fromHex('#f6f6f9');

  static Color black90019 = fromHex('#19000000');

  static Color whiteA700 = fromHex('#ffffff');

  static Color blueGray50 = fromHex('#f1f1f1');

  static Color blueGray10000 = fromHex('#00d9d9d9');

  static Color blueGray10001 = fromHex('#d9d9d9');

  static Color gray4006c = fromHex('#6cb8b5b3');

  static Color amber60019 = fromHex('#19fab005');

  static Color fab005 = fromHex('#fab005');

  static Color gray50 = fromHex('#fff5f5');

  static Color black9001e = fromHex('#1e000000');

  static Color whiteA70033 = fromHex('#33ffffff');

  static Color yellow90033 = fromHex('#33fd7e14');

  static Color whiteA70075 = fromHex('#75ffffff');

  static Color black90066 = fromHex('#66000000');

  static Color black26092B = fromHex('#26092B');

  static Color black900 = fromHex('#110801');

  static Color gray50001 = fromHex('#a09c99');

  static Color yellow900 = fromHex('#fd7e14');

  static Color blue507f = fromHex('#7fe7f5ff');

  static Color black901 = fromHex('#000000');

  static Color black90026 = fromHex('#26000000');

  static Color gray90002 = fromHex('#2f2924');

  static Color gray700 = fromHex('#59534d');

  static Color whiteA7006c = fromHex('#6cffffff');

  static Color blueGray200 = fromHex('#bac5d0');

  static Color gray60001 = fromHex('#706b66');

  static Color gray500 = fromHex('#a39386');

  static Color black9006c = fromHex('#6c000000');

  static Color gray900 = fromHex('#26092a');

  static Color gray90001 = fromHex('#29211b');

  static Color blue600 = fromHex('#228be6');

  static Color gray100 = fromHex('#f4f2f5');

  static Color orange100 = fromHex('#ffd9b9');

  static Color black90075 = fromHex('#75110800');

  static Color gray9003f = fromHex('#3f0f1626');

  static Color orange50 = fromHex('#fff9db');

  static Color orange5001 = fromHex('#fff3e8');

  static Color yellow90087 = fromHex('#87fd7e14');

  static Color orange5002 = fromHex('#ffe5d0');

  static Color black90072 = fromHex('#72000000');

  static Color gray40066 = fromHex('#66c2c1c0');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
