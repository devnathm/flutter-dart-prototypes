import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: APIScreen());
  }
}

class APIScreen extends StatefulWidget {
  const APIScreen({super.key});

  @override
  State<APIScreen> createState() => _APIScreenState();
}

class _APIScreenState extends State<APIScreen> {
  String currentLocation = "Press Start to track location.";
  bool isTracking = false;

  StreamSubscription<Position>? _locationSubscription;

  Future<void> startTracking() async {
    //harware + permission check
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        currentLocation = "Error: Please turn on GPS.";
      });
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          currentLocation = "Error: Permission Denied.";
        });
        return;
      }
    }

    //battery saving settings
    LocationSettings mySettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
    );

    //open the pipe
    _locationSubscription =
        Geolocator.getPositionStream(locationSettings: mySettings).listen((
          Position position,
        ) {
          setState(() {
            currentLocation =
                "Lat: ${position.latitude.toStringAsFixed(4)}\nLng: ${position.longitude.toStringAsFixed(4)}";

            isTracking = true;
          });
        });
  }

  //stop tracking
  void stopTracking() {
    _locationSubscription?.cancel();
    setState(() {
      currentLocation = "Location tracking stopped.";
      isTracking = false;
    });
  }

  //if user presses back, we close
  @override
  void dispose() {
    _locationSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Geolocator Prototype")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Icon(Icons.location_on, size: 100),
              SizedBox(height: 20),

              Text(currentLocation),
              SizedBox(height: 20),

              isTracking
                  ? ElevatedButton(
                      onPressed: () {
                        stopTracking();
                      },
                      child: Text("Stop Tracking"),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        startTracking();
                      },
                      child: Text("Start Tracking"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
