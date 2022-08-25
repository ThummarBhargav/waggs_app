import 'package:get/get.dart';

import '../../main.dart';
import '../constant/ConstantUrl.dart';
import '../modules/Add_To_Cart_Shipping_View/bindings/add_to_cart_shipping_view_binding.dart';
import '../modules/Add_To_Cart_Shipping_View/views/add_to_cart_shipping_view_view.dart';
import '../modules/OTP_screen/bindings/o_t_p_screen_binding.dart';
import '../modules/OTP_screen/views/o_t_p_screen_view.dart';
import '../modules/Top_selling_Store_all_Products/bindings/top_selling_store_all_products_binding.dart';
import '../modules/Top_selling_Store_all_Products/views/top_selling_store_all_products_view.dart';
import '../modules/View_All_My_Cart/bindings/view_all_my_cart_binding.dart';
import '../modules/View_All_My_Cart/views/view_all_my_cart_view.dart';
import '../modules/email_screen/bindings/email_screen_binding.dart';
import '../modules/email_screen/views/email_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login_screen/bindings/login_screen_binding.dart';
import '../modules/login_screen/views/login_screen_view.dart';
import '../modules/product/bindings/product_binding.dart';
import '../modules/product/views/product_view.dart';
import '../modules/product_list_screen/bindings/product_list_screen_binding.dart';
import '../modules/product_list_screen/views/product_list_screen_view.dart';
import '../modules/singup_screen/bindings/singup_screen_binding.dart';
import '../modules/singup_screen/views/singup_screen_view.dart';
import '../modules/tab_bar1/bindings/tab_bar1_binding.dart';
import '../modules/tab_bar1/views/tab_bar1_view.dart';
import '../modules/view-product/bindings/view_product_binding.dart';
import '../modules/view-product/views/view_product_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static String INITIAL = (box.read(ArgumentConstant.isUserLogin) == null)
      ? Routes.LOGIN_SCREEN
      : Routes.HOME;

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
      page: () => const OTPScreenView(),
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
  ];
}
