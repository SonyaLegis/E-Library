// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:e_library/Page/Beranda.dart';
import 'package:e_library/Page/PinjamBuku.dart';
import 'package:flutter/material.dart';
import 'package:e_library/ApiModel/PinjamBukuAPI.dart';

class EditPinjamBuku extends StatefulWidget {
  final String id;
  final String nim_anggota;
  final String nama_anggota;
  final String kategory;
  final String nama_buku;
  final String tanggal_pinjam;
  final String tanggal_kembali;

  const EditPinjamBuku(
      {Key? key,
      required this.id,
      required this.nim_anggota,
      required this.nama_anggota,
      required this.kategory,
      required this.nama_buku,
      required this.tanggal_pinjam,
      required this.tanggal_kembali})
      : super(key: key);
  @override
  EditPinjamBukuState createState() {
    return EditPinjamBukuState(
        this.id,
        this.nim_anggota,
        this.nama_anggota,
        this.kategory,
        this.nama_buku,
        this.tanggal_pinjam,
        this.tanggal_kembali);
  }
}

class EditPinjamBukuState extends State<EditPinjamBuku> {
  final String id;
  final String nim_anggota;
  final String nama_anggota;
  final String kategory;
  final String nama_buku;
  final String tanggal_pinjam;
  final String tanggal_kembali;

  final _formKey = GlobalKey<FormState>();
  TextEditingController nimController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController kategoryController = TextEditingController();
  TextEditingController bukuController = TextEditingController();
  TextEditingController pinjamController = TextEditingController();
  TextEditingController kembaliController = TextEditingController();

  EditPinjamBukuState(this.id, this.nim_anggota, this.nama_anggota,
      this.kategory, this.nama_buku, this.tanggal_pinjam, this.tanggal_kembali);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Pinjam Buku'),
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
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Container(
                      width: 50,
                      child: Image(
                        image: AssetImage("assets/book.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      "EDIT PINJAM BUKU",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 20.0),
                    ),
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Stack(
                        alignment: const Alignment(0, 0),
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: TextFormField(
                                controller: nimController..text = nim_anggota,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Nim Anggota',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Nim Anggota Tidak Boleh Kosong';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Stack(
                        alignment: const Alignment(0, 0),
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: TextFormField(
                                controller: namaController..text = nama_anggota,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Nama Anggota',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Nama Anggota Tidak Boleh Kosong';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Stack(
                        alignment: const Alignment(0, 0),
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: TextFormField(
                                controller: kategoryController..text = kategory,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Kode Buku',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Kode Buku Tidak Boleh Kosong';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Stack(
                        alignment: const Alignment(0, 0),
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: TextFormField(
                                controller: bukuController..text = nama_buku,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Nama Buku',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Nama Buku Tidak Boleh Kosong';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Stack(
                        alignment: const Alignment(0, 0),
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: TextFormField(
                                controller: pinjamController
                                  ..text = tanggal_pinjam,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Tanggal Pinjam',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Tanggal Pinjam Tidak Boleh Kosong';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Stack(
                        alignment: const Alignment(0, 0),
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: TextFormField(
                                controller: kembaliController
                                  ..text = tanggal_kembali,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Tanggal Kembali',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Tanggal Kembali Tidak Boleh Kosong';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        child: RaisedButton(
                          color: Color.fromRGBO(122, 165, 253, 1),
                          onPressed: () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              PinjamBukuResult.update(
                                      id,
                                      nimController.text,
                                      namaController.text,
                                      kategoryController.text,
                                      bukuController.text,
                                      pinjamController.text,
                                      kembaliController.text)
                                  .then(
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
                                          : 'Update Data'),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                          child: Text(
                            'SIMPAN',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(
                              color: Color.fromRGBO(122, 165, 253, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        child: RaisedButton(
                          color: Color.fromRGBO(139, 146, 208, 1),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Beranda();
                                },
                              ),
                            );
                          },
                          child: Text(
                            'KEMBALI',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(
                              color: Color.fromRGBO(122, 165, 253, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
