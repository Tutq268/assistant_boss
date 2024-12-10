import 'package:hanam/ui/navigation/app_navigator.dart';
import 'package:hanam/ui/navigation/app_popup_info.dart';
import 'package:flutter/material.dart';

abstract class BasePopupInfoMapper {
  Widget map(AppPopupInfo appRouteInfo, AppNavigator navigator);
}
