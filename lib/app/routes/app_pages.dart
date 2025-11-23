import 'package:get/get.dart';
import 'package:tejas_portfolio/app/routes/app_routes.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/home/presentation/controllers/home_binding.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}