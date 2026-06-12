import 'package:flutter/material.dart';
import 'package:i_bank/screens/home_screen/home_screen_page.dart';
import 'package:i_bank/screens/search/search_screen.dart';

class NavBar extends StatefulWidget {
  final int initialIndex;

  const NavBar({Key? key, this.initialIndex = 0}): super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  final List<Widget> _pages = const [
    HomeScreenPage(),
    SearchScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30)
        ),
        child: NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorColor: Colors.transparent,

            ), child: NavigationBar(
            backgroundColor: Colors.white,
            selectedIndex: selectedIndex,
            onDestinationSelected: (index){
              setState(() {
                selectedIndex = index;
              });
            },
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.search_rounded), label: 'Serch'),
              NavigationDestination(icon: Icon(Icons.email_outlined), label: 'Message'),
              NavigationDestination(icon: Icon(Icons.settings_outlined), label: 'Setting'),
            ])),
      ),
    );
  }
}
