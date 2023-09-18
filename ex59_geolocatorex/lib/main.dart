import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location_geocoder/location_geocoder.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ex59 Geolocatorex'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final String _apiKey = 'AIzaSyDk7yQTzqQDom7eiy8uX9CwgsKhojgZ0dA';
  late LocatitonGeocoder geocoder = LocatitonGeocoder(_apiKey);
  late Position _currentPosition;
  String currentAddress = '';
  String lat = '';
  String lon ='';

  _getCurrentLocation() async {
    await Permission.location.request().then((status) {
      if (status == PermissionStatus.granted) {
        Geolocator

        .getCurrentPosition(
          //LocationAccuracy 옵션은 문서에 아이폰은 best안씀
          desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager:false)//true시 안드로이드 동작 x
        .then((Position position){
          _currentPosition = position;
          setState(() {
            lat = '${position.latitude}'; //위도
            lon = '${position.longitude}';  //경도
          });
        }).catchError((e) {
          print(e);
        });
      } else {
        print('위치 서비스를 사용할 수 없습니다.');
      }
    });
  }

  Future<void> _getAddressFromLatLng() async {
    final address = await geocoder.findAddressesFromCoordinates(
      Coordinates(_currentPosition.latitude,
                  _currentPosition.longitude));
      print(Coordinates(_currentPosition.latitude,_currentPosition.longitude));
      print(_currentPosition.latitude);
      print('adress:$address');
    var message = address.first.addressLine;
    print('message:$message');
    if (message == null) return;

    setState(() {
      currentAddress = message;
    });

  // if (address.isNotEmpty) {
  //     Address firstAddress = address.first;
  //     // 이제 firstAddress를 사용할 수 있습니다.
  //   } else {
  //     print('주소가 없습니다.');
  //   }    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$lat $lon"),
              Text(currentAddress),
              const SizedBox(height: 10,),
              ElevatedButton(
                child: const Text('현재 위치 찾기', style: TextStyle(fontSize: 24)),
                onPressed: () {
                  _getCurrentLocation();
                },
              ),
              const SizedBox(height: 50,),
              ElevatedButton(
                child: const Text('현재 주소 구하기', style: TextStyle(fontSize: 24)),
                onPressed: () {
                  _getAddressFromLatLng();
                },
              ),
            ],
          ),
      ),
    );
  } 
}