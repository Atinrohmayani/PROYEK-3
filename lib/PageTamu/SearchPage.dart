import 'package:flutter/material.dart';
import '../main.dart';
import 'GuestHomePage.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Guru> searchResults = []; // Daftar hasil pencarian

  // Variabel untuk menampilkan/hide drawer
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isDrawerOpen = false;

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
      key: _scaffoldKey, // Menyimpan kunci scaffold
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
              _handleDrawer(); // Memanggil fungsi untuk menampilkan/hide drawer
            },
          ),
        ],
      ),
      drawer: _buildDrawer(), // Memanggil fungsi untuk membangun drawer
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

  // Fungsi untuk menampilkan/hide drawer
  void _handleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
      if (_isDrawerOpen) {
        _scaffoldKey.currentState?.openEndDrawer();
      } else {
        _scaffoldKey.currentState?.openDrawer();
      }
    });
  }

  // Fungsi untuk membangun drawer
  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 100,
            color: Colors.lightBlue,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pilih Mata Pelajaran',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text('Matpel 1'),
                  onTap: () {
                    _filterGuruByMatpel('Matpel 1');
                  },
                ),
                ListTile(
                  title: Text('Matpel 2'),
                  onTap: () {
                    _filterGuruByMatpel('Matpel 2');
                  },
                ),
                ListTile(
                  title: Text('Matpel 3'),
                  onTap: () {
                    _filterGuruByMatpel('Matpel 3');
                  },
                ),
                ListTile(
                  title: Text('Matpel 4'),
                  onTap: () {
                    _filterGuruByMatpel('Matpel 4');
                  },
                ),
                ListTile(
                  title: Text('Matpel 5'),
                  onTap: () {
                    _filterGuruByMatpel('Matpel 5');
                  },
                ),
                ListTile(
                  title: Text('Matpel 6'),
                  onTap: () {
                    _filterGuruByMatpel('Matpel 6');
                  },
                ),
                ListTile(
                  title: Text('Matpel 7'),
                  onTap: () {
                    _filterGuruByMatpel('Matpel 7');
                  },
                ),
                ListTile(
                  title: Text('Matpel 8'),
                  onTap: () {
                    _filterGuruByMatpel('Matpel 8');
                  },
                ),
                ListTile(
                  title: Text('Matpel 9'),
                  onTap: () {
                    _filterGuruByMatpel('Matpel 9');
                  },
                ),
                ListTile(
                  title: Text('Matpel 10'),
                  onTap: () {
                    _filterGuruByMatpel('Matpel 10');
                  },
                ),
                // Tambahkan fungsi matpel lainnya sesuai kebutuhan
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk memfilter data guru berdasarkan mata pelajaran
  void _filterGuruByMatpel(String matpel) {
    setState(() {
      searchResults.clear();

      for (Guru guru in guruList) {
        if (guru.matpel.toLowerCase() == matpel.toLowerCase()) {
          searchResults.add(guru);
        }
      }
    });

    _handleDrawer(); // Menutup drawer setelah memfilter data
  }
}
