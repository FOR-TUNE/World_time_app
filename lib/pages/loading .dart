// ignore_for_file: file_names, avoid_print,, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time_class.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
// Asynchronous code is an action that starts now and finishes later in the future.
// To handle this we use a combination of "Async functions", "Await key word", and "Futures"

  setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'Lagos', flag: 'nigeria.png', url: 'Africa/Lagos');

    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isDaytime": instance.isDaytime
    }); // arguments map used here contain the key-value pairs we wish to send to the next route

    // print(instance.time);

    // setState(() {
    //   times = instance.time;
    // });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SpinKitPouringHourGlassRefined(
            color: Colors.white,
            size: 90.0,
          ),
        ));
  }
}
