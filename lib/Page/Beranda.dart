// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, file_names

import 'package:e_library/Page/PinjamBuku.dart';
import 'package:flutter/material.dart';
import 'package:e_library/Page/Login.dart';
import 'package:e_library/Page/DaftarBuku.dart';
import 'package:e_library/Page/Anggota.dart';
import 'package:e_library/Page/Admin.dart';
import 'package:e_library/Page/Transaksi.dart';
import 'package:e_library/Page/AboutUs.dart';

class Beranda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Library'),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/BerandaBackground.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      width: 40,
                      child: Image(
                        image: AssetImage("assets/Profile.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text('Selamat Datang, Admin'),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Login();
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Logout',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DaftarBuku();
                        },
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/DaftarBuku.jpeg',
                    fit: BoxFit.fill,
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/Anggota.jpeg'),
                    iconSize: 110,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Anggota();
                          },
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Image.asset('assets/Admin.jpeg'),
                    iconSize: 110,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Admin();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/PinjamanBuku.jpeg'),
                    iconSize: 110,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PinjamBuku();
                          },
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Image.asset('assets/Transaksi.jpeg'),
                    iconSize: 110,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Transaksi();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AboutUs();
                      },
                    ),
                  );
                },
                child: const Text('ABOUT US', style: TextStyle(fontSize: 30)),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(122, 165, 253, 1),
                  fixedSize: const Size(250, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
