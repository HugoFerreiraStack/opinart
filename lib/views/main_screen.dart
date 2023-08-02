import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:opinarti/helpers/responsive.dart';
import 'package:opinarti/views/access_management/access_management.dart';
import 'package:opinarti/views/notifications_management/notifications_management.dart';

import 'personal_data/personal_data_page.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (kDebugMode) {
      print(size);
    }
    return const Material(
      child: Responsive(
        mobile: AccessManagement(),
        tablet: AccessManagement(),
        web: AccessManagement(),
      ),
    );
  }
}
