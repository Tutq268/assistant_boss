import 'package:hanam/data/api/mapper/base/base_data_mapper.dart';
import 'package:hanam/ui/enum/language_code/language_code_enum.dart';
import 'package:dartx/dartx.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LanguageCodeDataMapper extends BaseDataMapper<String, LanguageCode>
    with DataMapperMixin {
  @override
  LanguageCode mapToEntity(String? data) {
    return LanguageCode.values
            .firstOrNullWhere((element) => element.serverValue == data) ??
        LanguageCode.defaultValue;
  }

  @override
  String mapToData(LanguageCode entity) {
    return entity.serverValue;
  }
}
