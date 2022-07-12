// ignore_for_file: empty_constructor_bodies, avoid_print,
// import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert'; // allows one to convert json file here to workable data i.e a Map.
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  late String time; // the time in that location
  String flag; // url to an assest flag icon
  String url; // location url for api endpoint
  late bool isDaytime; // is true or false if daytime or not

  WorldTime({
    required this.location,
    required this.flag,
    required this.url,
  });

  Future<void> getTime() async {
    // Now we intend to use the 'try and catch' method to handle possible errors,
    // that may be encountered when running code.
    try {
      // make a request
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

      Map data = jsonDecode(response.body);
      // print(data);

      // get properties from the data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      // print(offset);

      // create a DateTime object
      DateTime now = DateTime.parse(
          datetime); // here parse converts the string to datetime format of the object.
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      isDaytime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (error) {
      print('Caught error: $error');
      time = 'Could not get time data...';
    }
  }
}
