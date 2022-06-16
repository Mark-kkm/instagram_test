import 'package:flutter/material.dart';
import 'package:flutter_testing/screens/profile_screen.dart';

import 'constants/screen_size.dart';
import 'screens/feed_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

  List<BottomNavigationBarItem> buttonNavigationItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
    const BottomNavigationBarItem(icon: Icon(Icons.add), label: '추가'),
    const BottomNavigationBarItem(icon: Icon(Icons.search), label: '검색'),
    const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '관심'),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이'),
  ];

  int _selectedIndex = 0;

  final List<Widget> _screens = <Widget>[
    const FeedScreen(),
    Container(color: Colors.blueAccent,),
    Container(color: Colors.greenAccent,),
    Container(color: Colors.purpleAccent,),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    size ??= MediaQuery.of(context).size;
    return Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: buttonNavigationItems,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          onTap: _btnClicked,
        ));
  }
  void _btnClicked(int index) {
    setState((){
      _selectedIndex = index;
    });
  }

}


