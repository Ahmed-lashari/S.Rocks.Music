import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skility_x/core/config/init_dependencies.dart';
import 'package:skility_x/view/screens/home/home.dart';
import 'package:toastification/toastification.dart';
import 'view/themes/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initilizing dependencies
  await InitDependencies.initBootStrap();

  runApp(const ProviderScope(child: SRocksMusic()));
}

class SRocksMusic extends StatefulWidget {
  const SRocksMusic({super.key});

  @override
  State<SRocksMusic> createState() => _SRocksMusicState();
}

class _SRocksMusicState extends State<SRocksMusic> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 845), // taken from figma assignemnt file
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => ToastificationWrapper(
              child: SafeArea(
                  top: false,
                  bottom: true,
                  right: true,
                  left: true,
                  child: MaterialApp(
                      debugShowCheckedModeBanner: false,
                      themeMode: ThemeMode.dark,
                      theme: ThemeManager.darkTheme,
                      home: child)),
            ),
        child: const HomeTabs());
  }
}
