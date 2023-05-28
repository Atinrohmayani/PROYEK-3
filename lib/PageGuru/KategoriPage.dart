import 'package:flutter/material.dart';
import '../main.dart';

class KategoriPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 168, 87),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: kategori.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                height: 80.0,
                width: double.infinity,
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.book, size: 20.0),
                    SizedBox(width: 8.0),
                    Text(
                      kategori[index],
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0), // Jarak antara setiap pelajaran
            ],
          );
        },
      ),
    );
  }
}
