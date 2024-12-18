import 'package:hanam/data/api/mapper/base/base_success_response_mapper.dart';
import 'package:hanam/data/api/model/base/data_response.dart';
import 'package:hanam/data/model/typedef.dart';

class DataJsonArrayResponseMapper<T extends Object>
    extends BaseSuccessResponseMapper<T, DataListResponse<T>> {
  @override
  // ignore: avoid-dynamic
  DataListResponse<T>? mapToDataModel({
    required dynamic response,
    Decoder<T>? decoder,
  }) {
    return decoder != null && response is Map<String, dynamic>
        ? DataListResponse.fromJson(response, (json) => decoder(json))
        : null;
  }
}
