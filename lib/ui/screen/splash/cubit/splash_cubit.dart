import 'package:hanam/data/api/app_api_service.dart';
import 'package:hanam/data/preference/app_preferences.dart';
import 'package:hanam/ui/cubit/base_cubit.dart';
import 'package:hanam/ui/navigation/app_route_info.dart';
import 'package:hanam/ui/screen/splash/cubit/splash_state.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SplashCubit extends BaseCubit<SplashState> {
  SplashCubit({required this.appPreference, required this.apiClient})
      : super(const SplashState());
  final AppPreferences appPreference;
  final AppApiService apiClient;
  Future<void> initData() async {
    try {
      // await appPreference.clearCurrentUserData();

      final currentUser = appPreference.currentUser;
      if (currentUser == null) {
        emit(state.copyWith(isLoading: true));
        final response = await apiClient.createUser();
        if (response == null) {
          return;
        } else {
          final user = response.data;
          await appPreference.saveCurrentUser(user);
          appCubit.updateCurrentUser(user);
          navigator.push(const AppRouteInfo.detailChatPage(""));
        }
        emit(state.copyWith(isLoading: false));
      } else {
        appCubit.updateCurrentUser(currentUser);
        navigator.push(const AppRouteInfo.detailChatPage(""));
      }
    } on DioException catch (_) {}
  }
}
