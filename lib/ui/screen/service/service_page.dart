import 'package:auto_route/auto_route.dart';
import 'package:hanam/resource/dimens/app_dimen.dart';
import 'package:hanam/resource/dimens/dimens.dart';
import 'package:hanam/ui/screen/service/cubit/service_cubit.dart';
import 'package:hanam/ui/screen/service/cubit/service_state.dart';
import 'package:hanam/ui/share/loading/common_loading.dart';
import 'package:hanam/ui/share/scaffold/base_page_state.dart';
import 'package:hanam/ui/share/scaffold/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends BasePageState<ServicePage, ServiceCubit> {
  @override
  void initState() {
    cubit.initData();
    super.initState();
  }

  @override
  Widget buildPage(BuildContext context) {
    return BaseScreen(
        child: BlocConsumer<ServiceCubit, ServiceState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state.isLoading == true) {
                return Center(
                  child: Container(
                    margin: EdgeInsets.only(top: Dimens.d32.h),
                    child: CommonLoading(
                        containerHeight: Dimens.d42.responsive(),
                        containerWidth: Dimens.d42.responsive()),
                  ),
                );
              }
              return Container();
            }));
  }
}
