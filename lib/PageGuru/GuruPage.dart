import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:uniru_app/PageGuru/KategoriPage.dart';
import 'package:uniru_app/PageGuru/PageHomeGuru.dart';
import 'package:uniru_app/PageGuru/ProfilPage.dart';
import 'package:uniru_app/PageGuru/SertifikatPage.dart';

class GuruPage extends StatefulWidget {
  @override
  _GuruPageState createState() => _GuruPageState();
}

class _GuruPageState extends State<GuruPage> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    PageHomeGuru(),
    KategoriPage(),
    SertifikatPage(),
    ProfilPage(),
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
        title: Text('Halaman Guru'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 78, 78, 78),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 5,
          ),
          child: GNav(
            curve: Curves.easeOutExpo,
            backgroundColor: Color.fromARGB(255, 78, 78, 78),
            color: Colors.white,
            activeColor: Colors.yellow,
            tabBackgroundColor: Colors.blue.shade100,
            gap: 8,
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            padding: EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.category,
                text: 'Kategori',
              ),
              GButton(
                icon: Icons.bookmark,
                text: 'Sertifikat',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
