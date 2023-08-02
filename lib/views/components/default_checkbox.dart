import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controllers/checkBox_controller.dart';

class DefaultCheckBox extends StatelessWidget {
  const DefaultCheckBox({
    super.key,
    required this.onChanged,
    this.width,
    this.height,
    this.color,
  });

  final Function(bool) onChanged;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GetX<CheckboxController>(builder: (checkboxController) {
      return GestureDetector(
        onTap: () {
          checkboxController.isChecked.value =
              !checkboxController.isChecked.value;
          onChanged(checkboxController.isChecked.value);
        },
        child: SizedBox(
          height: height ?? 24,
          width: width ?? 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              checkboxController.isChecked.value
                  ? SvgPicture.asset(
                      "assets/checkbox-fill.svg",
                      color: color,
                    )
                  : SvgPicture.asset(
                      "assets/checkbox-blank-line.svg",
                      color: color,
                    )
            ],
          ),
        ),
      );
    });
  }
}
