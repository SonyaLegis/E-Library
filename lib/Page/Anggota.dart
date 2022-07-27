// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:e_library/Model/AnggotaModel.dart';
import 'package:e_library/CustomListItem/CustomListAnggota.dart';
import 'package:e_library/ApiModel/MemberAPI.dart';
import 'package:e_library/Page/InputAnggota.dart';
import 'package:flutter/material.dart';

class Anggota extends StatefulWidget {
  @override
  AnggotaState createState() {
    return AnggotaState();
  }
}

class AnggotaState extends State<Anggota> {
  Future<List<MemberResult>> memberFuture = MemberResult.show();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anggota'),
        backgroundColor: Colors.grey,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return InputAnggota();
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
        child: FutureBuilder<List<MemberResult>>(
            future: memberFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final members = snapshot.data!;
                return buildMember(members);
              } else {
                return const Text('No Data');
              }
            }),
      ),
    );
  }

  Widget buildMember(List<MemberResult> members) => ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          final member = members[index];

          return Card(
            child: CustomListAnggota(
              no_anggota: member.id,
              nama: member.nama_lengkap,
              gender: member.jenis_kelamin,
              hp: member.no_telephone,
              lahir: member.tempat_tanggal_lahir,
              email: member.email,
              thumbnail: Image(
                image: AssetImage("assets/Mahasiswa.png"),
              ),
              alamat: member.alamat,
            ),
            color: Color.fromRGBO(242, 238, 238, 1),
          );
        },
      );
}
