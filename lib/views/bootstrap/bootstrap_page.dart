import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BootStrapPage extends StatelessWidget {
  const BootStrapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  SizedBox(
                      width: 222,
                      height: 48,
                      child: SvgPicture.asset("assets/brand_bootstrap.svg")),
                  Expanded(
                      child: SizedBox(
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 106,
                        ),
                        SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              color: Color(0xFF828282),
                              strokeWidth: 2,
                            )),
                      ],
                    ),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
