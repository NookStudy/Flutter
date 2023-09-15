import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
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
      home: MyHomePage(title: 'EX49 WebView'),
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

  // //WebViewController 생성 - 1단계
  // WebViewController controller = WebViewController()
  // ..setJavaScriptMode(JavaScriptMode.unrestricted)
  // ..setBackgroundColor(const Color(0x00000000))
  // ..setNavigationDelegate(
  //   NavigationDelegate(
  //     //진행사항을 보고하기 위해 페이지가 로드될 때 호출합니다.
  //     onProgress: (int progress){/** Update loading bar. */},
  //     //페이지 로드가 시작되면 호출됩니다.
  //     onPageStarted: (String url){},
  //     //페이지 로드가 완료되면 호출됩니다.
  //     onPageFinished: (String url){print("onPageFinished");},
  //     //리소스 로딩 율가 발생하면 호출됩니다.
  //     onWebResourceError: (WebResourceError error){},
  //     //탐색요청에 대한 결정이 보류중일 때 호출됩니다.
  //     onNavigationRequest: (NavigationRequest request){
  //       if (request.url.startsWith('https://www.youtube.com/')) {
  //         return NavigationDecision.prevent;
  //       }
  //       return NavigationDecision.navigate;
  //     },
  //   ),
  // )
  // //웹뷰에 연결할 url
  // ..loadRequest(Uri.parse('https://daum.net'));


  late final WebViewController controller;

  @override
  void initState(){
    super.initState();

    controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //html에 있는 채널과 일치시켜준다.
    ..addJavaScriptChannel('JsFlutter', onMessageReceived: (JavaScriptMessage message){
      //JavaScript 에서 Flutter 쪽으로 명령 보내기 처리
      //메세지에 따라 일을 분가히여 처리
      print(message.message);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message.message)));
      }
    )
    // ..loadRequest(Uri.parse('https://map.kakao.com'));  //카카오맵 웹뷰
    ..loadFlutterAsset("assets/html/my.html");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
		backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:SafeArea(
        // child:  Expanded(      //1단계
        //   child: WebViewWidget(
        //     controller: controller,
        //   ),
        // )
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => callJavaScript(),
              child: const Text('Flutter 에서 자바스크립트 실행'),
            ),
            SizedBox(
              height: 500,
              child: WebViewWidget(controller: controller,),
            )
          ],
        ),
      )
    );
  }
  void callJavaScript(){
    // controller.runJavaScript('alert("홍길동")');
    // 플러터(앱)에서 자바스크립트의 function을 사용
    controller.runJavaScript('appToJs("안녕하세요~")');
  }
}
