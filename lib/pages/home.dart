// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map datas = {};
  @override
  Widget build(BuildContext context) {
    // datas =
    // print(datas);

    datas = datas
            .isNotEmpty // we're running this check to allow for the setstate data to take it's effect
        ? datas
        : ModalRoute.of(context)!.settings.arguments as Map;
    print(datas);

    // set background image
    String bgImage = datas['isDaytime'] ? 'da.jpg' : 'nigh.jpg';
    Color? bgColor = datas['isDaytime'] ? Colors.blue : Colors.indigo[900];

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                // ignore: unnecessary_string_escapes
                image: AssetImage('build/images/$bgImage'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 110.0, 0, 0),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/Location');
                  setState(() {
                    datas = {
                      'time': result['time'],
                      'location': result['location'],
                      'isDaytime': result['isDaytime'],
                      'flag': result['flag']
                    };
                  });
                },
                icon: Icon(
                  Icons.edit_location_alt,
                  color: Colors.grey[300],
                ),
                label: const Text(
                  'Edit Location',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    datas['location'],
                    style: TextStyle(
                        fontSize: 28, letterSpacing: 2.0, color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                datas['time'],
                style: TextStyle(fontSize: 66, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
