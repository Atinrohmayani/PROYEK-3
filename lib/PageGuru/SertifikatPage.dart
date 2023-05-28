import 'package:flutter/material.dart';

class SertifikatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 168, 87),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Implementasi logika unduh sertifikat PDF
            // Di sini, Anda dapat menambahkan logika untuk mengunduh file PDF dari URL atau sumber lainnya
            // Untuk tujuan demonstrasi, kita akan menggunakan peringatan sederhana
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Download Sertifikat'),
                  content: Text('Sertifikat PDF akan diunduh.'),
                  actions: [
                    ElevatedButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Text(
            'Unduh Sertifikat',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
