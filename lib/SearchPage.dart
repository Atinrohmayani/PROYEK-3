import 'package:flutter/material.dart';
import 'package:uniru_app/HomePage.dart';
import 'main.dart';
import 'GuestHomePage.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Guru> searchResults = []; // Daftar hasil pencarian

  void searchGuru(String keyword) {
    // Fungsi untuk melakukan pencarian guru
    setState(() {
      // Menghapus hasil pencarian sebelumnya
      searchResults.clear();

      // Melakukan pencarian berdasarkan keyword
      for (Guru guru in guruList) {
        if (guru.name.toLowerCase().contains(keyword.toLowerCase())) {
          searchResults.add(guru);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GuestHomePage()),
            );
          },
          child: Center(
            child: Text(
              'CANCEL',
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        // leading: IconButton(
        //   icon: Icon(Icons.cancel),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Cari guru...',
          ),
          onSubmitted: searchGuru,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Aksi ketika tombol filter ditekan
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: searchResults.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _showGuruDetailPopup(context, searchResults[index]);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 143, 102, 255),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      searchResults[index].imagePath,
                      width: double.infinity,
                      height: 100,
                    ),
                    SizedBox(height: 8),
                    Text(
                      searchResults[index].name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      searchResults[index].description,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showGuruDetailPopup(BuildContext context, Guru guru) {
    // Metode untuk menampilkan detail guru dalam popup
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(guru.name),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Bidang: ${guru.matpel}'),
              SizedBox(height: 8),
              Text('Deskripsi: ${guru.description}'),
              // Tambahkan informasi detail lainnya sesuai kebutuhan
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}
