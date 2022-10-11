import 'package:get/get.dart';

import '../modules/about_us_screen/bindings/about_us_screen_binding.dart';
import '../modules/about_us_screen/views/about_us_screen_view.dart';
import '../modules/blog_details_screen/bindings/blog_details_screen_binding.dart';
import '../modules/blog_details_screen/views/blog_details_screen_view.dart';
import '../modules/blogs_screen/bindings/blogs_screen_binding.dart';
import '../modules/blogs_screen/views/blogs_screen_view.dart';
import '../modules/breeders_screen/bindings/breeders_screen_binding.dart';
import '../modules/breeders_screen/views/breeders_screen_view.dart';
import '../modules/breeds_screen/bindings/breeds_screen_binding.dart';
import '../modules/breeds_screen/views/breeds_screen_view.dart';
import '../modules/forget_password/bindings/forget_password_binding.dart';
import '../modules/forget_password/views/forget_password_view.dart';
import '../modules/get_in_touch_screen/bindings/get_in_touch_screen_binding.dart';
import '../modules/get_in_touch_screen/views/get_in_touch_screen_view.dart';
import '../modules/home_screen/bindings/home_screen_binding.dart';
import '../modules/home_screen/views/home_screen_view.dart';
import '../modules/login_screen/bindings/login_screen_binding.dart';
import '../modules/login_screen/views/login_screen_view.dart';
import '../modules/puppies_details_screen/bindings/puppies_details_screen_binding.dart';
import '../modules/puppies_details_screen/views/puppies_details_screen_view.dart';
import '../modules/signup_screen/bindings/signup_screen_binding.dart';
import '../modules/signup_screen/views/signup_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => const LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP_SCREEN,
      page: () => const SignupScreenView(),
      binding: SignupScreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME_SCREEN,
      page: () => const HomeScreenView(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.BREEDERS_SCREEN,
      page: () => const BreedersScreenView(),
      binding: BreedersScreenBinding(),
    ),
    GetPage(
      name: _Paths.BREEDS_SCREEN,
      page: () => const BreedsScreenView(),
      binding: BreedsScreenBinding(),
    ),
    GetPage(
      name: _Paths.BLOGS_SCREEN,
      page: () => const BlogsScreenView(),
      binding: BlogsScreenBinding(),
    ),
    GetPage(
      name: _Paths.GET_IN_TOUCH_SCREEN,
      page: () => const GetInTouchScreenView(),
      binding: GetInTouchScreenBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_US_SCREEN,
      page: () => const AboutUsScreenView(),
      binding: AboutUsScreenBinding(),
    ),
    GetPage(
      name: _Paths.PUPPIES_DETAILS_SCREEN,
      page: () => const PuppiesDetailsScreenView(),
      binding: PuppiesDetailsScreenBinding(),
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD,
      page: () => const ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.BLOG_DETAILS_SCREEN,
      page: () => const BlogDetailsScreenView(),
      binding: BlogDetailsScreenBinding(),
    ),
  ];
}
