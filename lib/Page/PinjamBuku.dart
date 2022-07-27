// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:e_library/Model/PinjamBukuModel.dart';
import 'package:e_library/CustomListItem/CustomListPinjamBuku.dart';
import 'package:e_library/ApiModel/PinjamBukuAPI.dart';
import 'package:flutter/material.dart';

class PinjamBuku extends StatefulWidget {
  @override
  PinjamBukuState createState() {
    return PinjamBukuState();
  }
}

class PinjamBukuState extends State<PinjamBuku> {
  Future<List<PinjamBukuResult>> borrowBookFuture = PinjamBukuResult.show();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pinjaman Buku'),
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
          child: FutureBuilder<List<PinjamBukuResult>>(
              future: borrowBookFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final borrowBooks = snapshot.data!;
                  return buildPinjamBuku(borrowBooks);
                } else {
                  return const Text('No Data');
                }
              })),
    );
  }

  Widget buildPinjamBuku(List<PinjamBukuResult> borrowBooks) =>
      ListView.builder(
        itemCount: borrowBooks.length,
        itemBuilder: (context, index) {
          final borrowBook = borrowBooks[index];

          return Card(
            child: CustomListPinjamBuku(
              no_pinjaman: borrowBook.id,
              nim: borrowBook.nim_anggota,
              nama: borrowBook.nama_anggota,
              jenis: borrowBook.kategory,
              judul: borrowBook.nama_buku,
              dari: borrowBook.tanggal_pinjam,
              sampai: borrowBook.tanggal_kembali,
              thumbnail: Image(
                image: AssetImage("assets/Mahasiswa.png"),
              ),
            ),
            color: Color.fromRGBO(242, 238, 238, 1),
          );
        },
      );
}
