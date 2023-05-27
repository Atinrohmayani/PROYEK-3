import 'package:flutter/material.dart';
import '../PageLogin/LoginPage.dart';
import 'GuestHomePage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'UNIRU',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Image.asset(
              'assets/LogoUniru.png',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Aksi ketika tombol "Masuk" ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GuestHomePage()),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 8),
                  Text('Masuk'),
                ],
              ),
            ),
          ],
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Aksi ketika tombol "Login" ditekan
      //   },
      //   child: Icon(Icons.login),

      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        icon: Icon(Icons.login),
        label: Text('Login'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
