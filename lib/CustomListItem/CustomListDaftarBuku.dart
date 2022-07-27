// ignore_for_file: prefer_const_constructors, file_names

import 'package:e_library/Page/Beranda.dart';
import 'package:e_library/Page/EditDaftarBuku.dart';
import 'package:flutter/material.dart';

class CustomListDaftarBuku extends StatelessWidget {
  const CustomListDaftarBuku({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.user,
    required this.jenis,
    required this.stok,
  }) : super(key: key);

  final Widget thumbnail;
  final String title;
  final String user;
  final String jenis;
  final int stok;

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
              title: title,
              user: user,
              jenis: jenis,
              stok: stok,
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
                        return EditDaftarBuku();
                      },
                    ),
                  );
                  break;
                case 'Hapus':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Beranda();
                      },
                    ),
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
    required this.title,
    required this.user,
    required this.jenis,
    required this.stok,
  }) : super(key: key);

  final String title;
  final String user;
  final String jenis;
  final int stok;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          Divider(),
          Text(
            user,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            jenis,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            'Stok : $stok',
            style: const TextStyle(fontSize: 10.0),
          ),
        ],
      ),
    );
  }
}
