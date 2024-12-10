import 'package:hanam/data/api/exceptions/server_error.dart';
import 'package:hanam/data/api/mapper/base/base_error_response_mapper.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GoongErrorResponseMapper
    extends BaseErrorResponseMapper<Map<String, dynamic>> {
  @override
  ServerError mapToServerError(Map<String, dynamic>? json) {
    return ServerError(
      generalMessage: json?['error']['message'] as String?,
    );
  }
}
