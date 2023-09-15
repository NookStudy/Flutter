import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
      home: const MyHomePage(title: '타이틀입력'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
		backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _launchURL('http://m.google.com'),
              child: const Text('https',style: TextStyle(fontSize: 24),)
            ),
            const SizedBox(height: 10,),
            ElevatedButton(   //자동전화걸기에 많이 사용
              onPressed: () => _launchURL('tel:010-5108-4285'),
              child: const Text('tel',style: TextStyle(fontSize: 24),)
            ),
            const SizedBox(height: 10,),
            ElevatedButton(     //광고성 홍보문자
              onPressed: () => _sendSMS(),
              child: const Text('sms',style: TextStyle(fontSize: 24),),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () => _sendEmail(),
              child: const Text('email',style: TextStyle(fontSize: 24),),
            ),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }

  void _launchURL(url) async{
    Uri _url = Uri.parse(url);
    await canLaunchUrl(_url) ? await launchUrl(_url) :throw 'Could not launch $url';
  }

  void _sendSMS(){
    final Uri smsLaunchUri = Uri(
      scheme: 'sms',
      path : '010 9273 9992',
      queryParameters: <String,String>{
        'body' : Uri.encodeComponent('Example Subject & Symbols are allowed!'),
      }
    );
    launchUrl(smsLaunchUri);
  }

  void _sendEmail(){
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path:  'aqui6290@gmail.com', //List로 박으면 여러개 동시발송 가능
      query: encodeQueryParameters(<String,String>{
        'subject': 'Example Subject & Symbols ar allowed!',
        'body' : "something you put in"
      }),
    );
    launchUrl(emailLaunchUri);
  }

  String? encodeQueryParameters(Map<String,String> params){
    return params.entries.map((MapEntry<String, String> e) => 
                  '${Uri.encodeComponent(e.key)}=${Uri.decodeComponent(e.value)}').join('&');
  }
}
