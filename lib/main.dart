import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:udemy_flutter_update/Layouts/NewLayout/News_Layout.dart';
import 'package:udemy_flutter_update/Layouts/NewLayout/cubit_new/states.dart';
import 'package:udemy_flutter_update/Network/local/cashHelper.dart';
import 'package:udemy_flutter_update/Styles/thems/them.dart';
import 'Module/home_screen.dart';
import 'Module/splash_screen.dart';
import 'Network/remote/Dio_helper.dart';
import 'Layouts/NewLayout/cubit_new/cubit_news_layout.dart';

void main() async {
  // كوود يضمن ان كل ما هو قبل run  البرنامج سوف ينفذ
  WidgetsFlutterBinding.ensureInitialized();

  // Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CashHelper.init();
  bool? isDark = CashHelper.getBoolean(key: 'isDark') ?? false;

  runApp(

      DevicePreview(
        enabled: true,
        tools: const [
          ...DevicePreview.defaultTools,
        ],
        builder: (context) => MyApp(isDark),
      ),
  );
}

class MyApp extends StatelessWidget {
  final bool isDark;
  MyApp(this.isDark);

  @override
  Widget build(context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewCubit>(
          create: (context) => NewCubit()
            ..getBusniss()
            ..getSports()
            ..getScience(),
        ),
        BlocProvider<NewCubit>(
          create: (contex) => NewCubit()..changeModelOfApp(fromShared: isDark),
        ),
      ],
      child: BlocConsumer<NewCubit, NewState>(
        listener: (context, state) => Container(),
        builder: (context, state) => GetMaterialApp(
          theme: Themes.lightThem ,
          darkTheme:Themes.darkThem ,
          themeMode:
              NewCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
           home:  SplashScreen(),
        ),
      ),
    );
  }
}
