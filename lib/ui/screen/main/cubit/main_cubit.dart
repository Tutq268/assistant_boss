import 'package:hanam/ui/cubit/base_cubit.dart';
import 'package:hanam/ui/screen/main/cubit/main_state.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class MainCubit extends BaseCubit<MainState> {
  MainCubit() : super(const MainState());
  Future<void> initData() async {
    try {} on DioException catch (_) {}
  }
}
