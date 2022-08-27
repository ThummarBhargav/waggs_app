import 'package:get/get.dart';

import '../modules/Add_To_Cart_Shipping_View/bindings/add_to_cart_shipping_view_binding.dart';
import '../modules/Add_To_Cart_Shipping_View/views/add_to_cart_shipping_view_view.dart';
import '../modules/Changed_Password_Send_Otp_View/bindings/changed_password_send_otp_view_binding.dart';
import '../modules/Changed_Password_Send_Otp_View/views/changed_password_send_otp_view_view.dart';
import '../modules/OTP_screen/bindings/o_t_p_screen_binding.dart';
import '../modules/OTP_screen/views/o_t_p_screen_view.dart';
import '../modules/Top_selling_Store_all_Products/bindings/top_selling_store_all_products_binding.dart';
import '../modules/Top_selling_Store_all_Products/views/top_selling_store_all_products_view.dart';
import '../modules/View_All_My_Cart/bindings/view_all_my_cart_binding.dart';
import '../modules/View_All_My_Cart/views/view_all_my_cart_view.dart';
import '../modules/email_screen/bindings/email_screen_binding.dart';
import '../modules/email_screen/views/email_screen_view.dart';
import '../modules/filter/bindings/filter_binding.dart';
import '../modules/filter/views/filter_view.dart';
import '../modules/forgot_new_password/bindings/forgot_new_password_binding.dart';
import '../modules/forgot_new_password/views/forgot_new_password_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/forgot_send_otp/bindings/forgot_send_otp_binding.dart';
import '../modules/forgot_send_otp/views/forgot_send_otp_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login_screen/bindings/login_screen_binding.dart';
import '../modules/login_screen/views/login_screen_view.dart';
import '../modules/my_account/bindings/my_account_binding.dart';
import '../modules/my_account/views/my_account_view.dart';
import '../modules/plane/bindings/plane_binding.dart';
import '../modules/plane/views/plane_view.dart';
import '../modules/product/bindings/product_binding.dart';
import '../modules/product/views/product_view.dart';
import '../modules/product_list_screen/bindings/product_list_screen_binding.dart';
import '../modules/product_list_screen/views/product_list_screen_view.dart';
import '../modules/singup_screen/bindings/singup_screen_binding.dart';
import '../modules/singup_screen/views/singup_screen_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/tab_bar1/bindings/tab_bar1_binding.dart';
import '../modules/tab_bar1/views/tab_bar1_view.dart';
import '../modules/view-product/bindings/view_product_binding.dart';
import '../modules/view-product/views/view_product_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static String INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.SINGUP_SCREEN,
      page: () => const SingupScreenView(),
      binding: SingupScreenBinding(),
    ),
    GetPage(
      name: _Paths.O_T_P_SCREEN,
      page: () => OTPScreenView(),
      binding: OTPScreenBinding(),
    ),
    GetPage(
      name: _Paths.EMAIL_SCREEN,
      page: () => const EmailScreenView(),
      binding: EmailScreenBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_PRODUCT,
      page: () => ViewProductView(),
      binding: ViewProductBinding(),
    ),
    // GetPage(
    //   name: _Paths.CATAGORY_PAGE,
    //   page: () => CatagoryPageView(),
    //   binding: CatagoryPageBinding(),
    // ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => const ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.TOP_SELLING_STORE_ALL_PRODUCTS,
      page: () => TopSellingStoreAllProductsView(),
      binding: TopSellingStoreAllProductsBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_LIST_SCREEN,
      page: () => const ProductListScreenView(),
      binding: ProductListScreenBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_ALL_MY_CART,
      page: () => const ViewAllMyCartView(),
      binding: ViewAllMyCartBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TO_CART_SHIPPING_VIEW,
      page: () => const AddToCartShippingViewView(),
      binding: AddToCartShippingViewBinding(),
    ),
    GetPage(
      name: _Paths.TAB_BAR1,
      page: () => const TabBar1View(),
      binding: TabBar1Binding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.MY_ACCOUNT,
      page: () => const MyAccountView(),
      binding: MyAccountBinding(),
    ),
    GetPage(
      name: _Paths.FILTER,
      page: () => const FilterView(),
      binding: FilterBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.PLANE,
      page: () => const PlaneView(),
      binding: PlaneBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_SEND_OTP,
      page: () => const ForgotSendOtpView(),
      binding: ForgotSendOtpBinding(),
    ),
    GetPage(
      name: _Paths.CHANGED_PASSWORD_SEND_OTP_VIEW,
      page: () => const ChangedPasswordSendOtpViewView(),
      binding: ChangedPasswordSendOtpViewBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_NEW_PASSWORD,
      page: () => const ForgotNewPasswordView(),
      binding: ForgotNewPasswordBinding(),
    ),
  ];
}
