import 'package:flutter/material.dart';

class SiriusAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SiriusAppBar({Key? key, this.onMenuPressed}) : super(key: key);
  final VoidCallback? onMenuPressed;  // коллбек для открытия Drawer

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/icons/sirius_icon.png'),
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: onMenuPressed ?? () {
                // Если коллбек не передан, открываем Drawer через Scaffold
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
