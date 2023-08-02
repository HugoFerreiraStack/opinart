import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opinarti/controllers/edit_controller.dart';
import 'package:opinarti/views/components/default_button.dart';

import '../components/custom_appbar.dart';

class EditPage extends GetView<EditController> {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(preferredSize: Size.fromHeight(kTextTabBarHeight), child: CustomAppBar(title: 'Editar dados')),
      body: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          SizedBox(
            height: 80,
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 32,
                  child: DefaultButtom(
                    text: "Cancelar",
                    activeButton: false,
                    onPressed: () => Get.back(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
