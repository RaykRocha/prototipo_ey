import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prototipo_ey/colaboradores/colaboradores_screen.dart';
import 'package:prototipo_ey/controllers/menu_controller.dart';
import 'package:prototipo_ey/dashboard/dashboard_screen.dart';
import 'package:prototipo_ey/main/sobre_screen.dart';
import 'package:prototipo_ey/responsive.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: sideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: sideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: _getDrawerItem(_selectedIndex),
            ),
          ],
        ),
      ),
    );
  }

  _getDrawerItem(int pos) {
    switch (pos) {
      case 0:
        return const DashboardScreen();
      case 1:
        return const ColaboradorScreen();
      case 2:
        return const SobrePage();
      default:
        return const DashboardScreen();
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedIndex = index);
    // Navigator.of(context).pop();
  }

  _drawerListTile(String title, String svgSrc, int item) {
    return ListTile(
      onTap: () {
        setState(() {
          _selectedIndex = item;
        });
        _onSelectItem(item);
      },
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }

  sideMenu() {
    return Container(
      color: const Color(0xFF363740),
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Image.asset("assets/images/logo.png"),
            ),
            _drawerListTile(
              "Visão Geral",
              "assets/icons/menu_dashbord.svg",
              0,
            ),
            _drawerListTile(
              "Colaboradores",
              "assets/icons/menu_task.svg",
              1,
            ),
          ],
        ),
      ),
    );
  }
}
