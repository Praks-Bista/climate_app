import 'dart:convert';

import 'package:clima_app/services/location.dart';
import 'package:clima_app/services/networking.dart';
import 'package:clima_app/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  void getLocation() async {
    var decodeData = await WeatherModel().getLocation();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => LocationScreen(decodeData)));
  }

  @override
  void deactivate() {
    super.deactivate();
    print("The screen is closed");
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitChasingDots(
        color: Colors.grey,
      )),
    );
  }
}
