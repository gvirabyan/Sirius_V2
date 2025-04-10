import 'package:flutter/material.dart';
import 'package:untitled9/screens/user_order_history_page.dart';
import '../screens/personal_info_page.dart';
import 'sirius_app_bar.dart'; // Твой кастомный AppBar, импортируем

class SiriusScaffold extends StatefulWidget {
  final Widget body;

  const SiriusScaffold({super.key, required this.body});

  @override
  State<SiriusScaffold> createState() => _SiriusScaffoldState();
}

class _SiriusScaffoldState extends State<SiriusScaffold> {
  bool _isDrawerOpen = false;

  void toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }
  void navigateToPersonalInfo(BuildContext context) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PersonalInfoPage()),
      );
  }
  void navigateToOrderHistory(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => UserOrderHistoryPage()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.primaryDelta! < -10 && !_isDrawerOpen) toggleDrawer();
        if (details.primaryDelta! > 10 && _isDrawerOpen) toggleDrawer();
      },
      child: Scaffold(
        body: Stack(
          children: [
            // Основной контент
            Scaffold(
              appBar: SiriusAppBar(onMenuPressed: toggleDrawer),
              body: widget.body,
            ),
            // Кастомный Drawer поверх контента
            if (_isDrawerOpen)
              Positioned.fill(
                child: GestureDetector(
                  onTap: toggleDrawer, // Закрытие при нажатии на область вокруг
                  child: Container(
                    color: Colors.black54, // Прозрачный фон для затемнения
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6, // Ширина Drawer
                        color: Colors.white, // Цвет фона Drawer
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                            Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.home),
                                    title: Text('Account'),
                                    onTap: () =>navigateToPersonalInfo(context) ,
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.history),
                                    title: Text('Order History'),
                                    onTap: () =>navigateToOrderHistory(context) ,
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.heart_broken),
                                    title: Text('Favorites'),
                                    onTap: toggleDrawer,
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.attach_money),
                                    title: Text('Active Subsctiptions'),
                                    onTap: toggleDrawer,
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.calendar_month),
                                    title: Text('Booking & Appointments'),
                                    onTap: toggleDrawer,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                            Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.credit_card_rounded),
                                    title: Text('Payment Methods'),
                                    onTap: toggleDrawer,
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.notifications),
                                    title: Text('Notifications'),
                                    onTap: toggleDrawer,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                            Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.headset_mic_outlined),
                                    title: Text('Help Center'),
                                    onTap: toggleDrawer,
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.question_mark),
                                    title: Text('FAQ'),
                                    onTap: toggleDrawer,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
