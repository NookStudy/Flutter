import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'EX60 Goolglemap1'),
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

  Completer<GoogleMapController> _controller = Completer();
  LatLng _myLoc1 = LatLng(37.57979551550774, 126.97706246296076); //경복궁
  LatLng _myLoc2 = LatLng(37.578932311976125, 126.99489126244981);  //창경궁
  LatLng _myLoc3 = LatLng(37.536560, 126.977137);
  List<Marker> _markers = [];
    /*
      마커 추가 : 마커 클릭시 인포윈도우를 띄울 수 있다.
      제목과 간단한 설명 글 그리고 탭(클릭) 했을 때 호출할 메서드를 지정할 수 있다.
    */
  void setMarkerData(){
    final marker1 = Marker(
      markerId: MarkerId('A01'),
      position: _myLoc1,
      infoWindow: InfoWindow(
        title: '경복궁',
        snippet: '여기는 경복궁입니다.',
        onTap: (){
          print('여기는 경복궁입니다.');
        }
      )
    );
    _markers.add(marker1);

    final marker2 =  Marker(
      markerId: MarkerId('A02'),
      position: _myLoc2,
      infoWindow: InfoWindow(
        title: '창경궁',
        snippet: '여기는 창경궁입니다.',
        onTap: (){
          print('여기는 창경궁입니다.');
        }
      )
    );
    _markers.add(marker2);

    final marker3 =  Marker(
      markerId: MarkerId('B01'),
      position: _myLoc3,
      infoWindow: InfoWindow(
        title: '전쟁기념관',
        snippet: '여기는 전쟁기념관입니다.',
        onTap: (){
          print('여기는 전쟁기념관입니다.');
        }
      )
    );
    _markers.add(marker3);
  }

  @override
  void initState(){
    super.initState();
    setMarkerData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
		backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 400,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(target: _myLoc1,zoom: 15.0),
              markers: Set.from(_markers),
              onMapCreated: (GoogleMapController controller){
                _controller.complete(controller);
              },
            ),
          ),
          SizedBox(height: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text("창경궁 이동",style: TextStyle(fontSize: 24),),
                onPressed: () => goTOLocation(_myLoc2), 
              ),
              ElevatedButton(
                child: Text("경복궁 이동",style: TextStyle(fontSize: 24),),
                onPressed: () => goTOLocation(_myLoc1), 
              ),
              ElevatedButton(
                child: Text("전쟁기념관 이동",style: TextStyle(fontSize: 24),),
                onPressed: () => goTOLocation(_myLoc3), 
              ),
            ],
          )
        ],
      ),
    );
  }

  //이동버튼 클릭시 카메라의 위치 및 이동방식, 표현방식 설정
  Future<void> goTOLocation(LatLng loc) async{
    final GoogleMapController controller = await _controller.future;

    final CameraPosition pos = CameraPosition(
      target: loc,
      zoom: 15, //줌 레벨. 숫자가 클수록 확대.
      // bearing: 180.0,
      // tilt: 60.0
    );
    //애니메이션효과가 없는 카메라
    // controller.moveCamera(CameraUpdate.newCameraPosition(pos));
    //애니효과 있음
    controller.animateCamera(CameraUpdate.newCameraPosition(pos));
  }
}
