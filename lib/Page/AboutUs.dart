// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'TENTANG KAMI',
                style: const TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 25.0),
              ),
              Text(
                'Aplikasi ini dirancang dan dibuat oleh :',
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50,
                    child: Image(
                      image: AssetImage("assets/Mahasiswa.PNG"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sonya Legis',
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.0),
                      ),
                      Text(
                        '30819100',
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.0),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50,
                    child: Image(
                      image: AssetImage("assets/Mahasiswa.PNG"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Siti Aisah',
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.0),
                      ),
                      Text(
                        '30819051',
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.0),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50,
                    child: Image(
                      image: AssetImage("assets/Mahasiswa.PNG"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Meli Ayu L',
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.0),
                      ),
                      Text(
                        '30819019',
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.0),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                width: 150,
                child: Image(
                  image: AssetImage("assets/EsaUnggul.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )),
    );
  }
}
