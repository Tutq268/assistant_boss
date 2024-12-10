import 'package:hanam/data/api/exceptions/server_error.dart';
import 'package:hanam/data/api/mapper/base/base_error_response_mapper.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class JsonObjectErrorResponseMapper
    extends BaseErrorResponseMapper<Map<String, dynamic>> {
  @override
  ServerError mapToServerError(Map<String, dynamic>? data) {
    print(data?["statusCode"]);
    print(data?['response']);
    return ServerError(
      generalServerStatusCode: 400,
      generalServerErrorId: '400',
      // generalMessage: data?['error']?['message'],
      generalMessage: data?['error'],
    );
  }
}
