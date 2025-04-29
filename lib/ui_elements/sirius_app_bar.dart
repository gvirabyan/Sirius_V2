import 'package:flutter/material.dart';
import 'package:untitled9/screens/user_home_page.dart';

class SiriusAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SiriusAppBar({Key? key, this.onMenuPressed}) : super(key: key);
  final VoidCallback? onMenuPressed;

  @override
  _SiriusAppBarState createState() => _SiriusAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SiriusAppBarState extends State<SiriusAppBar> {
  double _opacity = 1.0;

  void _handleTap() async {
    // Плавно уменьшаем прозрачность
    setState(() {
      _opacity = 0.3;
    });

    // Небольшая задержка (например, для завершения анимации)
    await Future.delayed(Duration(milliseconds: 300));

    // Переход на другую страницу
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserHomePage()),
    );

    // По желанию можно восстановить прозрачность (если возвращаемся)
    setState(() {
      _opacity = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: _handleTap,
            child: AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(milliseconds: 300),
              child: Image.asset(
                'assets/icons/sirius_icon.png',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.menu_rounded),
            onPressed: widget.onMenuPressed ??
                    () => Scaffold.of(context).openDrawer(),
          ),
        ],
      ),
    );
  }
}
