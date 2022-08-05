import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/singup_screen/bindings/singup_screen_binding.dart';
import '../modules/singup_screen/views/singup_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SINGUP_SCREEN,
      page: () => const SingupScreenView(),
      binding: SingupScreenBinding(),
    ),
  ];
}
