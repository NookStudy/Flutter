import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
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
      home: const MyHomePage(title: 'EX 52 Camera'),
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
   
  final ImagePicker _picker = ImagePicker();
  //image_picker 모듈에서 File객체 반환. IOS에서 에러
  //late File mPhoto // < -- 나중에 들어온다( 희망고문후 에러)
  File? mPhoto;   //널러블
  XFile? image;
  

  @override
  Widget build(BuildContext context) {
    //Widget photo = (mPhoto != null)? Image.file(mPhoto!) : Text('EMPTY');
    late Widget photo;
    if (mPhoto !=null) {
      photo = Image.file(
        mPhoto!,
        fit:BoxFit.contain,     //작은쪽에 맞춤. 큰 쪽에 여백 남음
        // alignment: Alignment.center,  //현재는 필요없음
        // width: 300,
        // height: 300,
      );
    }else{
      photo = Text("EMPTY");
    }

    return Scaffold(
      appBar: AppBar(
		backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => takePhoto(ImageSource.gallery),
                  child: const Text('Album', style: TextStyle(fontSize: 24),),
                ),
                SizedBox(width: 5,),
                ElevatedButton(
                  onPressed: () => takePhoto(ImageSource.camera),
                  child: const Text('Camera', style: TextStyle(fontSize: 24),),
                ),
                SizedBox(width: 5,),
                ElevatedButton(
                  onPressed: () => savePhoto(),
                  child: const Text('Save', style: TextStyle(fontSize: 24),),
                ),
              ],
            ),
            Expanded(child: photo),
          ],
        ),
      ),
    );
  }
    //이미지 가져오기
  void takePhoto(ImageSource source) async{   
    // final XFile? image = await _picker.pickImage(source: source);
    image = await _picker.pickImage(source: source);
    setState(() {
      mPhoto = File(image!.path);
    });
  }


  void savePhoto() async{
    // await _picker.pickImage(source: ImageSource.camera)
    //   .then((XFile? image){
    //     if (image != null) {
    //       setState(() {
    //         mPhoto = File(image.path);
    //       });

    //       GallerySaver.saveImage(image.path)
    //         .then((bool? success){
    //           print("image saved on gallery...");
    //         });
    //     }
    //   });
        //mPhoto
    if (image != null) {
      GallerySaver.saveImage(image!.path)
        .then((bool? success){
              print("image saved on gallery...");
        });
    
    }
  }
}
