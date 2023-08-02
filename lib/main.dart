import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:opinarti/controllers/auth_controller.dart';
import 'package:opinarti/controllers/card_expanded_controller.dart';
import 'package:opinarti/controllers/common_controller.dart';
import 'package:opinarti/controllers/drawer_controller.dart';
import 'package:opinarti/controllers/edit_controller.dart';
import 'package:opinarti/controllers/message_controller.dart';
import 'package:opinarti/controllers/support_controller.dart';
import 'package:opinarti/controllers/user_profile_controller.dart';
import 'package:opinarti/helpers/page_routes.dart';

import 'controllers/access_management_controller.dart';
import 'controllers/checkBox_controller.dart';
import 'controllers/list_tile_user_controller.dart';

void main() {
  Get.put(AuthController());
  Get.put(DrawerExpandedController());
  Get.put(CardExpandedController());
  Get.put(SuporteController());
  Get.put(UserProfileController());
  Get.put(CheckboxController());
  Get.put(AccessManagementController());
  Get.put(ListTileUserController());
  Get.put(CommomController());
  Get.put(MessageController());
  Get.put(EditController());
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: false,
      title: 'Opinarti',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: PagesRoutes.bootStrapPage,
      defaultTransition: Transition.noTransition,
      locale: const Locale('pt', 'BR'),
      fallbackLocale: const Locale("br", "BR"),
      getPages: Pages.routes,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
        checkboxTheme: CheckboxThemeData(
          side: MaterialStateBorderSide.resolveWith((_) => const BorderSide(color: Color(0xff94959E))),
          fillColor: MaterialStateProperty.all(const Color(0xffF56200)),
          checkColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
    );
  }
}
