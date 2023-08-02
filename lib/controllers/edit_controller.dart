import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user/user_model.dart';

class EditController extends GetxController with StateMixin<UserModel> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Rx<UserModel?> user = Rx(null);
}
