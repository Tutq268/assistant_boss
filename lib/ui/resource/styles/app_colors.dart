// ignore_for_file: avoid_hard_coded_colors
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const primaryColor = Color(0xff009874);
  static const primaryDark = Color(0xff009874);
  static const primaryDarker = Color(0xff2D524D);
  static const secondaryColor = Color(0xff47FFAF);
  static const secondaryDark = Color(0xff227A54);
  static const secondaryDarker = Color(0xff175238);
  static const primaryTextColor = Color(0xffffffff);
  static const secondaryTextColor = Color(0xff7D9491);
  static const noteTextColor = Color(0xFFB3B3B4);
  static const textPrimaryDefault = Color(0xff009874);
  static const textPrimaryStrong = Color(0xff31AD8F);
  static const textColorDisable = Color(0xff374745);
  static const backGroundColor = Color(0xff0F0F11);
  static const bgCanvas = Color(0xFF0F0F11);
  static const gray200 = Color(0xff1B1B1D);
  static const bgSurface1 = Color(0xFF141416);
  static const backGroundColorPaper = Color(0xff1C2E2B);
  static const backgroundColorNeutral = Color(0xff7D9491);
  static const warningText = Color(0xffFFAB00);
  static Color white90 = Colors.white.withOpacity(0.9);
  static Color white64 = Colors.white.withOpacity(0.64);
  static Color white54 = Colors.white.withOpacity(0.54);

  static const Color iconErrorDefault = Color(0xffE54C42);
  static const primaryGradient =
      LinearGradient(colors: [Color(0xFF8DFFF1), Color(0xFF2D524D)]);
  static const deviceTrainingChartColor = Color(0xff007A5D);
  static const cloudTrainingChartColor = Color(0xffFFBC33);
  static const refDeviceTrainingChartColor = Color(0xff7AB2FF);
  static const clusterTrainingChartColor = Color(0xff14C780);
  static const eventChartColor = Color(0xffE8FFF9);
  static const shareProfitChartColor = Color(0xffFC766D);
  static const avatarBgPalette = [
    Color(0xff009874),
    Color(0xff374B43),
    Color(0xff99B0A7),
    Color(0xff6C82CF),
    Color(0xff325198),
  ];

  static const avatarOrangeGradient = LinearGradient(
    colors: [Color(0xFFEDBF6B), Color(0xFFC06E5D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const avatarPurpleGradient = LinearGradient(
    colors: [Color(0xFFB674FF), Color(0xFF7875F2)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const avatarRedGradient = LinearGradient(
    colors: [Color(0xFFF7815C), Color(0xFFE22452)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const avatarGreenGradient = LinearGradient(
    colors: [Color(0xFF14C780), Color(0xFF009874)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const avatarCyanGradient = LinearGradient(
    colors: [Color(0xFF42C5E3), Color(0xFF1D9C8D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static List<LinearGradient> listAvatarGradientColor = <LinearGradient>[
    avatarOrangeGradient,
    avatarPurpleGradient,
    avatarRedGradient,
    avatarGreenGradient,
    avatarCyanGradient,
  ];
  static Color getAvatarBgColor() {
    return (AppColors.avatarBgPalette.toList()..shuffle()).first;
  }

  static Color borderNeutralLighterDefault = Colors.white.withOpacity(0.06);
  static Color bgDisable = Colors.white.withOpacity(0.06);
  static Color iconNeutralStrong = Colors.white.withOpacity(0.9);
  static Color textNeutralStrong = Colors.white.withOpacity(0.9);
  static Color textNeutralLight = Colors.white.withOpacity(0.48);
  static Color textNeutralMedium = Colors.white.withOpacity(0.64);

  static const advancePackGradient = LinearGradient(
    colors: [Color(0xFF009874), Color(0xFF00392C)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const basicPackGradient = LinearGradient(
    colors: [Color(0xFF49DEFF), Color(0xFF174752)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const standardPackGradient = LinearGradient(
    colors: [Color(0xFFFFAB00), Color(0xFF624200)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const secondaryGradient =
      LinearGradient(colors: [Color(0xFF47FFAF), Color(0xFF175238)]);

  static const backgroundGradient = LinearGradient(
      colors: [Color(0xFF145357), Color(0xFF061217)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  static const containerBgGradient = LinearGradient(
      colors: [Color(0xFF061217), Color(0xFF145357)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  static const defaultBackGroundColor = Color(0xff080D0C);
  static const LinearGradient trainingBgLinear = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFF194840), Color(0xFF000000)]);
  static const successColor = Color(0xff1B806A);
  static const errorColor = Color(0xffE54C42);

//   const AppColors(
//       {required this.primaryColor,
//       required this.secondaryColor,
//       required this.primaryTextColor,
//       required this.secondaryTextColor,
//       required this.primaryGradient,
//       required this.backGroundColor,
//       required this.primaryDark,
//       required this.primaryDarker,
//       required this.secondaryDark,
//       required this.secondaryDarker,
//       required this.textColorDisable,
//       required this.backGroundColorPaper,
//       required this.backgroundColorNeutral,
//       required this.secondaryGradient,
//       required this.backgroundGradient});

//   static late AppColors current;

//   final Color primaryColor;
//   final Color secondaryColor;
//   final Color primaryTextColor;
//   final Color secondaryTextColor;
//   final Color backGroundColor;

//   final Color primaryDark;
//   final Color primaryDarker;
//   final Color secondaryDark;
//   final Color secondaryDarker;
//   final Color textColorDisable;
//   final Color backGroundColorPaper;
//   final Color backgroundColorNeutral;
//   //button

//   /// gradient
//   final LinearGradient primaryGradient;
//   final LinearGradient secondaryGradient;
//   final LinearGradient backgroundGradient;

//   static const defaultBackGroundColor = Color(0xff080D0C);
//   static const LinearGradient trainingBgLinear = LinearGradient(
//       begin: Alignment.topCenter,
//       end: Alignment.bottomCenter,
//       colors: [Color(0xFF194840), Color(0xFF000000)]);

//   static const defaultAppColor = AppColors(
//     primaryColor: Color(0xff8DFFF1),
//     primaryDark: Color(0xff447A74),
//     primaryDarker: Color(0xff2D524D),
//     secondaryColor: Color(0xff47FFAF),
//     secondaryDark: Color(0xff227A54),
//     secondaryDarker: Color(0xff175238),
//     primaryTextColor: Color(0xffffffff),
//     secondaryTextColor: Color(0xff7D9491),
//     textColorDisable: Color(0xff374745),
//     backGroundColor: Color(0xff080D0C),
//     backGroundColorPaper: Color(0xff1C2E2B),
//     backgroundColorNeutral: Color(0xff7D9491),
//     primaryGradient:
//         LinearGradient(colors: [Color(0xFF8DFFF1), Color(0xFF2D524D)]),
//     secondaryGradient:
//         LinearGradient(colors: [Color(0xFF47FFAF), Color(0xFF175238)]),
//     backgroundGradient: LinearGradient(
//         colors: [Color(0xFF145357), Color(0xFF061217)],
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight),
//   );
// // 080D0C
//   static const darkThemeColor = AppColors(
//     primaryColor: Color(0xff8DFFF1),
//     primaryDark: Color(0xff447A74),
//     primaryDarker: Color(0xff2D524D),
//     secondaryColor: Color(0xff47FFAF),
//     secondaryDark: Color(0xff227A54),
//     secondaryDarker: Color(0xff175238),
//     primaryTextColor: Color(0xffffffff),
//     secondaryTextColor: Color(0xff7D9491),
//     textColorDisable: Color(0xff374745),
//     backGroundColor: Color(0xff080D0C),
//     backGroundColorPaper: Color(0xff1C2E2B),
//     backgroundColorNeutral: Color(0xff7D9491),
//     primaryGradient:
//         LinearGradient(colors: [Color(0xFF8DFFF1), Color(0xFF2D524D)]),
//     secondaryGradient: LinearGradient(
//         colors: [Color.fromRGBO(71, 255, 175, 1), Color(0xFF175238)]),
//     backgroundGradient: LinearGradient(colors: [
//       Color(0xFF1D2B25),
//       Color(0xFF1D2B25),
//       Color(0xFF1D2B25),
//       Color(0xff1C2E2B),
//     ], begin: Alignment.topLeft, end: Alignment.bottomRight),
//   );

//   static AppColors of(BuildContext context) {
//     final appColor = Theme.of(context).appColor;

//     current = appColor;

//     return current;
//   }

//   AppColors copyWith(
//       {Color? primaryColor,
//       Color? secondaryColor,
//       Color? primaryTextColor,
//       Color? secondaryTextColor,
//       Color? backGroundColor,
//       Color? primaryDark,
//       Color? primaryDarker,
//       Color? secondaryDark,
//       Color? secondaryDarker,
//       Color? textColorDisable,
//       Color? backGroundColorPaper,
//       Color? backgroundColorNeutral,
//       LinearGradient? secondaryGradient,
//       LinearGradient? primaryGradient,
//       LinearGradient? backgroundGradient}) {
//     return AppColors(
//         primaryColor: primaryColor ?? this.primaryColor,
//         secondaryColor: secondaryColor ?? this.secondaryColor,
//         primaryTextColor: primaryTextColor ?? this.primaryTextColor,
//         secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
//         primaryGradient: primaryGradient ?? this.primaryGradient,
//         backGroundColor: backGroundColor ?? this.backGroundColor,
//         primaryDark: primaryDark ?? this.primaryDark,
//         primaryDarker: primaryDarker ?? this.primaryDarker,
//         secondaryDark: secondaryDark ?? this.secondaryDark,
//         secondaryDarker: secondaryDarker ?? this.secondaryDarker,
//         textColorDisable: textColorDisable ?? this.textColorDisable,
//         backGroundColorPaper: backGroundColorPaper ?? this.backGroundColorPaper,
//         backgroundColorNeutral:
//             backgroundColorNeutral ?? this.backgroundColorNeutral,
//         secondaryGradient: secondaryGradient ?? this.secondaryGradient,
//         backgroundGradient: backgroundGradient ?? this.backgroundGradient);
//   }
}
