import 'package:hanam/data/api/exceptions/server_error.dart';
import 'package:hanam/data/api/exceptions/server_error_detail.dart';
import 'package:hanam/data/api/mapper/base/base_error_response_mapper.dart';
import 'package:injectable/injectable.dart';

@Injectable()
// ignore: avoid-dynamic
class JsonArrayErrorResponseMapper
    extends BaseErrorResponseMapper<List<dynamic>> {
  @override
  // ignore: avoid-dynamic
  ServerError mapToServerError(List<dynamic>? data) {
    return ServerError(
      errors: data
              ?.map((jsonObject) => ServerErrorDetail(
                    serverStatusCode: jsonObject['code'],
                    message: jsonObject['message'],
                  ))
              .toList(growable: false) ??
          [],
    );
  }
}
