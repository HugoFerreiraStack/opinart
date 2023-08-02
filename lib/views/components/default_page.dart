import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opinarti/helpers/colors.dart';
import 'package:opinarti/helpers/responsive.dart';
import 'package:opinarti/views/components/default_header.dart';
import 'package:opinarti/views/components/side_menu/side_menu.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage(
      {super.key,
      this.title,
      this.children,
      this.iconButtom,
      this.activeButtom = false,
      this.onPressedButtom,
      this.actionTitle,
      this.floatingActionButton,
      this.inactivePadding = false,
      this.backgroundColor,
      this.centerChild = false});
  final String? title, iconButtom, actionTitle;
  final bool activeButtom;
  final bool inactivePadding;
  final bool centerChild;
  final Color? backgroundColor;
  final List<Widget>? children;
  final void Function()? onPressedButtom;
  final Widget? floatingActionButton;

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = !Responsive.isweb(context);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      floatingActionButton: widget.floatingActionButton,
      key: scaffoldKey,
      appBar: isMobile
          ? AppBar(
              iconTheme: const IconThemeData(color: Color(0xff74747E)),
              elevation: 0,
              leading: InkWell(
                onTap: () {
                  scaffoldKey.currentState!.openDrawer();
                },
                child: SizedBox(
                  width: 48,
                  height: 48,
                  child: SvgPicture.asset(
                    "assets/short_menu.svg",
                    fit: BoxFit.scaleDown,
                    color: const Color(0xff131316),
                  ),
                ),
              ),
              backgroundColor: onPrimaryColor,
              centerTitle: true,
              title: Text(
                widget.title ?? "",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  letterSpacing: -.02,
                  color: const Color(0xFF1B1B1F),
                ),
              ))
          : null,
      drawer: isMobile ? const SideMenu() : null,
      backgroundColor: widget.backgroundColor ?? backgroundColor,
      body: Row(
        children: [
          if (!isMobile) const SideMenu(),
          Expanded(
            child: ListView(
              children: [
                if (!isMobile)
                  DefaultHeader(
                    title: widget.title,
                    icon: widget.iconButtom,
                    activeButtom: widget.activeButtom,
                    onPressed: widget.onPressedButtom,
                    actionTitle: widget.actionTitle,
                  ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: widget.centerChild
                            ? CrossAxisAlignment.center
                            : CrossAxisAlignment.start,
                        children: [
                          widget.children == null
                              ? Container()
                              : Padding(
                                  padding: widget.inactivePadding
                                      ? EdgeInsets.zero
                                      : isMobile
                                          ? const EdgeInsets.only(
                                              left: 16, right: 16, top: 24)
                                          : const EdgeInsets.only(
                                              left: 24, right: 24, top: 24),
                                  child: Column(
                                    crossAxisAlignment: widget.centerChild
                                        ? CrossAxisAlignment.center
                                        : CrossAxisAlignment.start,
                                    children: widget.children!,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
