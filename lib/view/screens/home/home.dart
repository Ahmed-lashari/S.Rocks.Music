import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/view/ui_config/screens/home/home.dart';
import 'package:skility_x/view/widgets/app_bottom_nav_bar.dart';
import 'package:skility_x/view_model/ui_providers/screens/home/home.dart';

class HomeTabs extends ConsumerStatefulWidget {
  const HomeTabs({super.key});

  @override
  ConsumerState<HomeTabs> createState() => _HomeTabs();
}

class _HomeTabs extends ConsumerState<HomeTabs> {
  @override
  Widget build(BuildContext context) {
    debugPrint('Building home tabs');

    return Scaffold(
        body: Consumer(builder: (context, ref, child) {
          final currentIndex = ref.watch(homeViewModelProvider);
          return _pages[currentIndex];
        }),
        bottomNavigationBar: CustomBottomNavigationBar());
  }

  List<Widget> _pages = const [];

  @override
  void initState() {
    _pages = HomeConfig.getScreens();
    super.initState();
  }
}
