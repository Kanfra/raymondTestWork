import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:raymond_test/Pages/HomePages/loadingPage.dart';
import 'package:raymond_test/Pages/HomePages/networkErrorPage.dart';

import '../../bloc/weather_bloc.dart';
import 'homePage.dart';

class StatusCheckerPage extends StatefulWidget {
  const StatusCheckerPage({super.key});

  @override
  State<StatusCheckerPage> createState() => _StatusCheckerPageState();
}

class _StatusCheckerPageState extends State<StatusCheckerPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _determinePosition(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const LoadingPage();
          }
          else if(snapshot.hasData){
            return BlocProvider<WeatherBloc>(
              create: (BuildContext context) => WeatherBloc()..add(
                  FetchWeather(snapshot.data as Position)
              ),
              child: const HomePage(),);
          }else {
            return const NetworkErrorPage();
          }
        }
    );
  }

  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
