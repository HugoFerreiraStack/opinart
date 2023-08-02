import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opinarti/controllers/auth_controller.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xff24277F),
              child:
                  Center(child: GetX<AuthController>(builder: (authController) {
                return Text(
                  authController.user.value?.name?.substring(0, 1) ?? '',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                      color: Colors.white),
                );
              })),
            ),
          ),
          SvgPicture.asset("assets/arrow_user_profile.svg")
        ],
      ),
    );
  }
}
