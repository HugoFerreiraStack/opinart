import 'package:get/route_manager.dart';
import 'package:opinarti/views/access_management/access_management.dart';
import 'package:opinarti/views/all_search/all_search_page.dart';
import 'package:opinarti/views/authentication/recover_password.dart';
import 'package:opinarti/views/authentication/sign_In.dart';
import 'package:opinarti/views/bootstrap/bootstrap_page.dart';
import 'package:opinarti/views/main_screen.dart';
import 'package:opinarti/views/new_search/new_search_page.dart';
import 'package:opinarti/views/personal_data/personal_data_page.dart';
import 'package:opinarti/views/support/suppot_page.dart';
import 'package:opinarti/views/totem/configure_totem.dart';
import '../views/edit/edit_page.dart';
import '../views/message/message_page.dart';
import '../views/totem/totem_access_page.dart';

abstract class Pages {
  static final routes = <GetPage>[
    GetPage(name: PagesRoutes.main, page: () => const MainScreen()),
    GetPage(name: PagesRoutes.login, page: () => SignIn()),
    GetPage(name: PagesRoutes.recoverPassword, page: () => const RecoverPassword()),
    GetPage(name: PagesRoutes.allSearch, page: () => const AllSearchPage()),
    GetPage(name: PagesRoutes.newSearch, page: () => const NewSearchPage()),
    GetPage(name: PagesRoutes.personalData, page: () => const PersonalDataPage()),
    GetPage(name: PagesRoutes.support, page: () => const SuppotPage()),
    GetPage(name: PagesRoutes.totemAccess, page: () => const TotemAccessPage()),
    GetPage(name: PagesRoutes.configureTotem, page: () => const ConfigureTotem()),
    GetPage(name: PagesRoutes.bootStrapPage, page: () => const BootStrapPage()),
    GetPage(name: PagesRoutes.accessManagement, page: () => const AccessManagement()),
    GetPage(name: PagesRoutes.message, page: () => const MessagePage()),
    GetPage(name: PagesRoutes.edit, page: () => const EditPage())
  ];
}

abstract class PagesRoutes {
  static const String main = '/home';
  static const String login = '/login';
  static const String recoverPassword = '/recover_password';
  static const String allSearch = '/all_search';
  static const String newSearch = '/new_search';
  static const String personalData = '/personal_data';
  static const String support = '/support';
  static const String totemAccess = '/totem_access';
  static const String configureTotem = '/configure_Totem';
  static const String bootStrapPage = '/bootstrap_page';
  static const String accessManagement = '/access_management';
  static const String message = '/message_page';
  static const String edit = '/edit_page';
}
