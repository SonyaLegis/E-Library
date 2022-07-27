// ignore_for_file: prefer_const_constructors, file_names

import 'package:e_library/Page/Beranda.dart';
import 'package:e_library/Page/PinjamBuku.dart';
import 'package:e_library/Page/EditPinjamBuku.dart';
import 'package:e_library/ApiModel/PinjamBukuAPI.dart';
import 'package:flutter/material.dart';

class CustomListPinjamBuku extends StatelessWidget {
  const CustomListPinjamBuku({
    Key? key,
    required this.thumbnail,
    required this.no_pinjaman,
    required this.nim,
    required this.nama,
    required this.jenis,
    required this.judul,
    required this.dari,
    required this.sampai,
  }) : super(key: key);

  final Widget thumbnail;
  final String no_pinjaman;
  final String nim;
  final String nama;
  final String jenis;
  final String judul;
  final String dari;
  final String sampai;

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
              no_pinjaman: no_pinjaman,
              nim: nim,
              nama: nama,
              jenis: jenis,
              judul: judul,
              dari: dari,
              sampai: sampai,
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
                        return EditPinjamBuku(
                          id: no_pinjaman,
                          nim_anggota: nim,
                          nama_anggota: nama,
                          kategory: jenis,
                          nama_buku: judul,
                          tanggal_pinjam: dari,
                          tanggal_kembali: sampai,
                        );
                      },
                    ),
                  );
                  break;
                case 'Hapus':
                  PinjamBukuResult.delete(no_pinjaman).then(
                    (value) {
                      if (value.status == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PinjamBuku();
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
    required this.no_pinjaman,
    required this.nim,
    required this.nama,
    required this.jenis,
    required this.judul,
    required this.dari,
    required this.sampai,
  }) : super(key: key);

  final String no_pinjaman;
  final String nim;
  final String nama;
  final String jenis;
  final String judul;
  final String dari;
  final String sampai;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'No.Pinjaman : $no_pinjaman',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          Divider(),
          Text(
            nim,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 10.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            nama,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            jenis,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 10.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            judul,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            dari,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 10.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            sampai,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 10.0),
          ),
        ],
      ),
    );
  }
}
