import 'package:hanam/data/constant/server/server_request_response_constants.dart';
import 'package:hanam/foundation/constant/ui/locale_constant.dart';
import 'package:hanam/resource/generated/l10n.dart';

enum LanguageCode {
  vn(
      localeCode: LocaleConstants.vi,
      serverValue: ServerRequestResponseConstants.vi),
  en(
      localeCode: LocaleConstants.en,
      serverValue: ServerRequestResponseConstants.en);

  const LanguageCode({
    required this.localeCode,
    required this.serverValue,
  });
  final String localeCode;
  final String serverValue;

  static LanguageCode get defaultValue => vn;

  static List<LanguageCode> get listLanguage => [vn, en];
}

extension LanguageCodeExt on LanguageCode {
  String display() {
    switch (this) {
      case LanguageCode.vn:
        return S.current.vietnamese;
      case LanguageCode.en:
        return S.current.english;
    }
  }
}
