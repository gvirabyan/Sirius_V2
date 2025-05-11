import 'package:flutter/material.dart';
import 'package:untitled9/screens/booking_bag_page.dart';
import 'package:untitled9/screens/companies_page.dart';
import 'package:untitled9/screens/specialists_page.dart';
import 'package:untitled9/screens/user_order_history_page.dart';
import 'package:untitled9/services/auth_service.dart';
import '../screens/personal_info_page.dart';
import '../screens/service_categories_page.dart';
import '../screens/user_home_page.dart';
import 'sirius_app_bar.dart';

class SiriusScaffold extends StatefulWidget {
  final Widget body;

  final int index;

  const SiriusScaffold({super.key, required this.body, required this.index});

  @override
  State<SiriusScaffold> createState() => _SiriusScaffoldState();
}

class _SiriusScaffoldState extends State<SiriusScaffold> {
  bool _isDrawerOpen = false;
  int _selectedIndex = 0;

  void toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
      _selectedIndex = widget.index;
    });
  }

  void navigateToUserHomePage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => UserHomePage()),
    );
  }

  void navigateToServicesPage(BuildContext context) {
     Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ServiceCategoriesPage()),
    );
  }

  void navigateToPersonalInfo(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => PersonalInfoPage()),
    );
  }

  void navigateToMyBookings(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => BookingBagPage()),
    );
  }

  void navigateToFavorites(BuildContext context) {
    // TODO: implement FavoritesPage
  }

  void navigateToSettingsPage(BuildContext context) {
    // TODO: implement SettingsPage
  }

  void navigateToOrderHistory(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => UserOrderHistoryPage()),
    );
  }

  void navigateToPaymentInfo(BuildContext context) {
    // TODO: implement PaymentInfoPage
  }
  void navigateToSpecialists(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SpecialistsPage()),
    );
  }
  void navigateToCompanies(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CompaniesPage()),
    );
  }

  void logOut(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ուզում ե՞ք դուրս գալ'),
          actions: <Widget>[
            TextButton(
              child: Text('Ոչ'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Այո'),
              onPressed: () {
                AuthService().logoutUser(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_isDrawerOpen) toggleDrawer();
      },
      onHorizontalDragUpdate: (details) {
        if (details.primaryDelta! < -10 && !_isDrawerOpen) toggleDrawer();
        if (details.primaryDelta! > 10 && _isDrawerOpen) toggleDrawer();
      },
      child: Scaffold(
        appBar: SiriusAppBar(onMenuPressed: toggleDrawer),
        body: Stack(
          children: [
            widget.body,

            // Кастомный Drawer поверх контента
            if (_isDrawerOpen)
              Positioned.fill(
                child: GestureDetector(
                  onTap: toggleDrawer,
                  child: Container(
                    color: Colors.black54,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        color: Colors.white,
                        child: ListView(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05),
                            _buildMenuSection(context),
                            const SizedBox(height: 20),
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

  Widget _buildMenuSection(BuildContext context) {
    bool isProfileExpanded = true;

    return StatefulBuilder(
      builder: (context, setInnerState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _menuItem(
              context: context,
              title: 'Գլխավոր',
              index: 0,
              selectedIndex: _selectedIndex,
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                  _isDrawerOpen = !_isDrawerOpen;

                });
                navigateToUserHomePage(context);
              },
            ),
            _menuItem(
              context: context,
              title: 'Ծառայություններ',
              index: 1,
              selectedIndex: _selectedIndex,
              expandable: true,
              expanded: false,
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
                navigateToServicesPage(context);
              },
            ),
            _menuItem(
              context: context,
              index: 2,
              selectedIndex: _selectedIndex,
              title: 'Կազմակերպություններ',
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });
                navigateToCompanies(context);
              },
            ),
            _menuItem(
              context: context,
              title: 'Մասնագետներ',
              index: 3,
              selectedIndex: _selectedIndex,
              onTap: () {
                setState(() {
                  _selectedIndex = widget.index;
                });
                navigateToSpecialists(context);

              },
            ),
            _menuItem(
              context: context,
              title: 'Կապ մեզ հետ',
              index: 4,
              selectedIndex: _selectedIndex,
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
            ExpansionTile(
              title: const Text(
                'Իմ էջը',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              childrenPadding: const EdgeInsets.only(left: 20),
              collapsedIconColor: Colors.black54,
              iconColor: Colors.black54,
              children: [
                _subItem(
                    'Անձնական տվյալներ', () => navigateToPersonalInfo(context),5),
                _subItem('Պատվերների պատմություն',
                    () => navigateToOrderHistory(context),6),
                _subItem('Նախըտրելի', () => navigateToFavorites(context),7),
                _subItem('Ակտիվ բաժանորդագրություններ', () {},8),
                _subItem('Ամրագրումներ',
                    () => navigateToMyBookings(context),9),
                _subItem(
                    'Վճարման մեթոդներ', () => navigateToPaymentInfo(context),10),
                _subItem('Դուրս գալ', () => logOut(context),11),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _menuItem({
    required BuildContext context,
    required String title,
    required int index,
    required int selectedIndex,
    bool expandable = false,
    bool expanded = false,
    VoidCallback? onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      title: Text(
        title,
        style: TextStyle(
          color: index == _selectedIndex ? Colors.blueAccent : Colors.black87,
          // Цвет зависит от selectedIndex
          fontWeight:
              index == _selectedIndex ? FontWeight.bold : FontWeight.normal,
          // Жирный шрифт для выбранного

          fontSize: 16,
        ),
      ),
      trailing: expandable
          ? Icon(
              expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: Colors.black54,
            )
          : null,
      onTap: onTap,
    );
  }

  Widget _subItem(String title, VoidCallback onTap,int index) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 30),
      title: Text(
        title,
        style: TextStyle(
          color: index == _selectedIndex ? Colors.blueAccent : Colors.black87,
          fontWeight:
          index == _selectedIndex ? FontWeight.bold : FontWeight.normal,

          fontSize: 16,
        ),
      ),

      onTap: () {
        onTap();
        toggleDrawer(); // Закрыть меню при переходе
      },
    );
  }
}
