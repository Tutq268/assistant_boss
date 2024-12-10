import 'package:hanam/ui/config/config.dart';

abstract class ApplicationConfig extends Config {}

class AppInitializer {
  AppInitializer(this._applicationConfig);

  final ApplicationConfig _applicationConfig;

  Future<void> init() async {
    // EnvConstants.init();
    await _applicationConfig.init();
  }
}
