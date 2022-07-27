// ignore_for_file: prefer_const_constructors, file_names

import 'package:e_library/Page/Admin.dart';
import 'package:e_library/Page/Beranda.dart';
import 'package:e_library/ApiModel/AdminAPI.dart';
import 'package:e_library/Page/EditAdmin.dart';
import 'package:flutter/material.dart';

class CustomListAdmin extends StatelessWidget {
  const CustomListAdmin({
    Key? key,
    required this.thumbnail,
    required this.id,
    required this.nama,
    required this.kota,
    required this.role,
    required this.hp,
    required this.gender,
  }) : super(key: key);

  final Widget thumbnail;
  final String id;
  final String nama;
  final String kota;
  final String role;
  final String hp;
  final String gender;

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
              nama: nama,
              kota: kota,
              role: role,
              hp: hp,
              gender: gender,
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
                        return EditAdmin(
                          id: id,
                          nama_petugas: nama,
                          jenis_kelamin: kota,
                          no_telephone: role,
                          jabatan: hp,
                          alamat: gender,
                        );
                      },
                    ),
                  );
                  break;
                case 'Hapus':
                  AdminResult.delete(id).then(
                    (value) {
                      if (value.status == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Admin();
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
    required this.nama,
    required this.kota,
    required this.role,
    required this.hp,
    required this.gender,
  }) : super(key: key);

  final String nama;
  final String kota;
  final String role;
  final String hp;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            nama,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          Divider(),
          Text(
            kota,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            role,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            hp,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 10.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            gender,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 10.0),
          ),
        ],
      ),
    );
  }
}
