import 'package:flutter/material.dart';

import 'utils/arrow_clipper.dart';

class DropDownMenu extends StatefulWidget {
  final List<String> title;
  final BorderRadius? borderRadius;
  final Color backgroundColor;

  const DropDownMenu({
    Key? key,
    required this.title,
    required this.borderRadius,
    this.backgroundColor = const Color(0xFF67C0B9),
  }) : super(key: key);
  @override
  _DropDownMenuState createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu>
    with SingleTickerProviderStateMixin {
  GlobalKey? _key;
  bool isMenuOpen = false;
  BorderRadius? _borderRadius;
  late OverlayEntry _overlayEntry;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _borderRadius = widget.borderRadius ?? BorderRadius.circular(4.0);
    _key = LabeledGlobalKey("button_icon");
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void closeMenu() {
    _overlayEntry.remove();
    _animationController.reverse();
    isMenuOpen = !isMenuOpen;
  }

  void openMenu() {
    _animationController.forward();
    _overlayEntry = _overlayEntryBuilder();
    Overlay.of(context)!.insert(_overlayEntry);
    isMenuOpen = !isMenuOpen;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _key,
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: _borderRadius,
      ),
      child: IconButton(
        splashRadius: 1,
        icon: AnimatedIcon(
          size: 25,
          icon: AnimatedIcons.menu_close,
          progress: _animationController,
        ),
        color: Colors.black,
        onPressed: () => isMenuOpen ? closeMenu() : openMenu(),
      ),
    );
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          top: 80.0,
          right: 0.0,
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                Positioned(
                  right: 20,
                  child: Material(
                    elevation: 20.0,
                    color: widget.backgroundColor,
                    shape: const ArrowClipper(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.backgroundColor,
                      borderRadius: _borderRadius,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(1.0, 2.0),
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                        ), //BoxShadow
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ],
                    ),
                    child: Column(
                      children: List.generate(
                        widget.title.length,
                        (index) => _onSelected(index),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _onSelected(int index) {
    return GestureDetector(
      onTap: () {
        switch (index) {
          case 0:
            _snackBarMessage(
              const Icon(Icons.home, color: Colors.white),
              'Home',
            );
            break;
          case 1:
            _snackBarMessage(
              const Icon(Icons.info, color: Colors.white),
              'About',
            );
            break;
          case 2:
            _snackBarMessage(
              const Icon(Icons.contact_phone, color: Colors.white),
              'Contact',
            );
            break;
          case 3:
            _snackBarMessage(
              const Icon(Icons.post_add, color: Colors.white),
              'Blog',
            );
            break;
          case 4:
            _snackBarMessage(
              const Icon(Icons.people, color: Colors.white),
              'Careers',
            );
            break;
        }
        closeMenu();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Text(
          widget.title[index],
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  _snackBarMessage(Icon icon, String title) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [icon, const SizedBox(width: 20), Text(title)],
        ),
        action: SnackBarAction(
          label: 'Close',
          textColor: const Color(0xFF00D36B),
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      ),
    );
  }
}
