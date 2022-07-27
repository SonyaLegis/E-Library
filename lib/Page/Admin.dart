// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:e_library/Model/AdminModel.dart';
import 'package:e_library/CustomListItem/CustomListAdmin.dart';
import 'package:e_library/ApiModel/AdminAPI.dart';
import 'package:e_library/Page/InputAdmin.dart';
import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  @override
  AdminState createState() {
    return AdminState();
  }
}

class AdminState extends State<Admin> {
  Future<List<AdminResult>> adminFuture = AdminResult.show();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
        backgroundColor: Colors.grey,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return InputAdmin();
              },
            ),
          );
        },
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/BerandaBackground.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder<List<AdminResult>>(
            future: adminFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final admins = snapshot.data!;
                return buildAdmin(admins);
              } else {
                return const Text('No Data');
              }
            }),
      ),
    );
  }

  Widget buildAdmin(List<AdminResult> admins) => ListView.builder(
        itemCount: admins.length,
        itemBuilder: (context, index) {
          final admin = admins[index];

          return Card(
            child: CustomListAdmin(
              id: admin.id,
              nama: admin.nama_petugas,
              gender: admin.jenis_kelamin,
              hp: admin.no_telephone,
              role: admin.jabatan,
              kota: admin.alamat,
              thumbnail: Image(
                image: AssetImage("assets/Mahasiswa.png"),
              ),
            ),
            color: Color.fromRGBO(242, 238, 238, 1),
          );
        },
      );
}
