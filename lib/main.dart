import 'package:flutter/material.dart';
import 'PageTamu/HomePage.dart';

void main() {
  runApp(UniruApp());
}

class UniruApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uniru',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class Guru {
  final String name;
  final String matpel;
  final String imagePath;
  final String description;

  Guru(this.name, this.matpel, this.imagePath, this.description);
}

final List<Guru> guruList = [
  Guru('Guru 1', 'Matpel 1', 'assets/test.jpg', 'deskripsi'),
  Guru('Guru 2', 'Matpel 2', 'assets/guru2.png', 'deskripsi guru...'),
  Guru('Guru 3', 'Matpel 3', 'assets/guru3.png', 'deskripsi guru...'),
  Guru('Guru 4', 'Matpel 4', 'assets/guru4.png', 'deskripsi guru...'),
  Guru('Guru 5', 'Matpel 5', 'assets/guru5.png', 'deskripsi guru...'),
  Guru('Guru 6', 'Matpel 6', 'assets/guru6.png', 'deskripsi guru...'),
  Guru('Guru 7', 'Matpel 7', 'assets/guru7.png', 'deskripsi guru...'),
  Guru('Guru 8', 'Matpel 8', 'assets/guru8.png', 'deskripsi guru...'),
  Guru('Guru 9', 'Matpel 9', 'assets/guru9.png', 'deskripsi guru...'),
  Guru('Guru 10', 'Matpel 10', 'assets/guru10.png', 'deskripsi guru...'),
];
