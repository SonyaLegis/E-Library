// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:e_library/Page/Admin.dart';
import 'package:e_library/Page/Beranda.dart';
import 'package:e_library/ApiModel/AdminAPI.dart';
import 'package:flutter/material.dart';

class EditAdmin extends StatefulWidget {
  final String id;
  final String nama_petugas;
  final String jenis_kelamin;
  final String no_telephone;
  final String jabatan;
  final String alamat;

  const EditAdmin(
      {Key? key,
      required this.id,
      required this.nama_petugas,
      required this.jenis_kelamin,
      required this.no_telephone,
      required this.jabatan,
      required this.alamat})
      : super(key: key);
  @override
  EditAdminState createState() {
    return EditAdminState(this.id, this.nama_petugas, this.jenis_kelamin,
        this.no_telephone, this.jabatan, this.alamat);
  }
}

class EditAdminState extends State<EditAdmin> {
  final String id;
  final String nama_petugas;
  final String jenis_kelamin;
  final String no_telephone;
  final String jabatan;
  final String alamat;

  final _formKey = GlobalKey<FormState>();
  TextEditingController namaController = TextEditingController();
  TextEditingController jenisKelaminController = TextEditingController();
  TextEditingController noTelephoneController = TextEditingController();
  TextEditingController jabatanController = TextEditingController();
  TextEditingController alamatController = TextEditingController();

  EditAdminState(this.id, this.nama_petugas, this.jenis_kelamin,
      this.no_telephone, this.jabatan, this.alamat);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Admin'),
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
                      "EDIT ADMIN",
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
                                controller: namaController..text = nama_petugas,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Nama Petugas',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Nama Petugas Tidak Boleh Kosong';
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
                                controller: jenisKelaminController
                                  ..text = jenis_kelamin,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Jenis Kelamin',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Jenis Kelamin Tidak Boleh Kosong';
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
                                controller: noTelephoneController
                                  ..text = no_telephone,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'No.Telpon',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'No.Telpon Tidak Boleh Kosong';
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
                                controller: jabatanController..text = jabatan,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Jabatan',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Jabatan Tidak Boleh Kosong';
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
                                controller: alamatController..text = alamat,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Alamat',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Alamat Tidak Boleh Kosong';
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
                              AdminResult.update(
                                      id,
                                      namaController.text,
                                      jenisKelaminController.text,
                                      noTelephoneController.text,
                                      jabatanController.text,
                                      alamatController.text)
                                  .then(
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
