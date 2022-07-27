// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:e_library/Page/Beranda.dart';
import 'package:flutter/material.dart';

class EditDaftarBuku extends StatefulWidget {
  @override
  EditDaftarBukuState createState() {
    return EditDaftarBukuState();
  }
}

class EditDaftarBukuState extends State<EditDaftarBuku> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Daftar Buku'),
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
                      "EDIT DAFTAR BUKU",
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
                      child: Container(
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
                            controller: emailController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'ID Buku',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'ID Buku Tidak Boleh Kosong';
                              }
                              return null;
                            },
                          ),
                        ),
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
                                controller: passwordController,
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
                                controller: passwordController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Penulis Buku',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Penulis Buku Tidak Boleh Kosong';
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
                                controller: passwordController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Kategory Buku',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Kategory Buku Tidak Boleh Kosong';
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
                                controller: passwordController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Stok',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Stok Tidak Boleh Kosong';
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
