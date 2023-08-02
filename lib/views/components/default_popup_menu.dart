import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopupMenu extends StatefulWidget {
  const PopupMenu({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<PopupMenu> createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      splashColor: const Color(0xffE7E7EE),
      onTap: _showPopupMenu,
      child: widget.child,
    );
  }

  void _showPopupMenu() {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        RenderBox renderBox = (widget.child.key as GlobalKey)
            .currentContext
            ?.findRenderObject() as RenderBox;
        Offset position = renderBox.localToGlobal(Offset.zero);
        return PopupMenuContainer(position: position, size: renderBox.size);
      },
    );
  }
}

class PopupMenuContainer extends StatefulWidget {
  const PopupMenuContainer({
    Key? key,
    required this.position,
    required this.size,
  }) : super(key: key);

  final Offset position;
  final Size size;

  @override
  State<PopupMenuContainer> createState() => _PopupMenuContainerState();
}

class _PopupMenuContainerState extends State<PopupMenuContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutCubic,
      ),
    );
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _closePopup();
        return false;
      },
      child: Material(
        type: MaterialType.transparency,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: widget.position.dy,
              right: (MediaQuery.of(context).size.width - widget.position.dx) -
                  widget.size.width,
              child: AnimatedBuilder(
                animation: _animationController.view,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _animation.value,
                    alignment: Alignment.topRight,
                    child: child,
                  );
                },
                child: Container(
                  // width: double.maxFinite,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.7,
                  ),
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 8,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      // DAQUI PRA BAIXO É CONTEUDO
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Notificações",
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          IconButton(
                            onPressed: _closePopup,
                            icon: const Icon(Icons.close),
                          )
                        ],
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _closePopup() {
    _animationController.reverse().whenComplete(() {
      Navigator.of(context).pop();
    });
  }
}
