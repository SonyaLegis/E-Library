// ignore_for_file: prefer_const_constructors, file_names

import 'package:e_library/Page/Beranda.dart';
import 'package:e_library/Page/Anggota.dart';
import 'package:e_library/ApiModel/MemberAPI.dart';
import 'package:e_library/Page/EditAnggota.dart';
import 'package:flutter/material.dart';

class CustomListAnggota extends StatelessWidget {
  const CustomListAnggota({
    Key? key,
    required this.thumbnail,
    required this.no_anggota,
    required this.nama,
    required this.gender,
    required this.hp,
    required this.lahir,
    required this.email,
    required this.alamat,
  }) : super(key: key);

  final Widget thumbnail;
  final String no_anggota;
  final String nama;
  final String gender;
  final String hp;
  final String lahir;
  final String email;
  final String alamat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: thumbnail,
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
          Expanded(
            flex: 3,
            child: _VideoDescription(
              no_anggota: no_anggota,
              nama: nama,
              gender: gender,
              hp: hp,
              lahir: lahir,
              email: email,
              alamat: alamat,
            ),
          ),
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.more_vert,
              size: 16.0,
            ),
            onSelected: (String result) {
              switch (result) {
                case 'Edit':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return EditAnggota(
                          id: no_anggota,
                          nama_lengkap: nama,
                          jenis_kelamin: gender,
                          no_telephone: hp,
                          tempat_tanggal_lahir: lahir,
                          email: email,
                          alamat: alamat,
                        );
                      },
                    ),
                  );
                  break;
                case 'Hapus':
                  MemberResult.delete(no_anggota).then(
                    (value) {
                      if (value.status == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Anggota();
                            },
                          ),
                        );
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(value.message != null
                              ? value.message
                              : 'Delete Data'),
                        ),
                      );
                    },
                  );
                  break;
                default:
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Edit',
                child: Text('Edit'),
              ),
              const PopupMenuItem<String>(
                value: 'Hapus',
                child: Text('Hapus'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _VideoDescription extends StatelessWidget {
  const _VideoDescription({
    Key? key,
    required this.no_anggota,
    required this.nama,
    required this.gender,
    required this.hp,
    required this.lahir,
    required this.email,
    required this.alamat,
  }) : super(key: key);

  final String no_anggota;
  final String nama;
  final String gender;
  final String hp;
  final String lahir;
  final String email;
  final String alamat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'No.Anggota : $no_anggota',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          Divider(),
          Text(
            nama,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            gender,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 10.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            hp,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 10.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            lahir,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 10.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            email,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 10.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            alamat,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 10.0),
          ),
        ],
      ),
    );
  }
}
