import 'package:flutter/material.dart';
import 'package:miksoper/core/constants/page_paddings.dart';
import 'package:miksoper/ui/pages/tabs/add_photo/add_photo.dart';
import 'package:miksoper/ui/pages/tabs/defective_list/alt_list.dart';
import 'package:miksoper/ui/pages/tabs/home/home_page.dart';
import 'package:miksoper/ui/pages/tabs/notification/notifications.dart';
import 'package:miksoper/ui/pages/tabs/profile/profile.dart';
import 'package:miksoper/ui/pages/tabs/tab_page/search_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    AltListPage(),
    AddPhotoPage(),
    NotificationsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: PagePadding.only(right: 2.w),
            child: IconButton(
              icon: const Icon(Icons.search_sharp),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchPage()));
              },
            ),
          )
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_sharp),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).focusColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
