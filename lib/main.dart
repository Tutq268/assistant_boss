import 'package:hanam/app.dart';
import 'package:hanam/ui/config/app_config.dart';
import 'package:hanam/ui/config/app_initializer.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer(AppConfig.getInstance()).init();
  runApp(const MyApp());
}
