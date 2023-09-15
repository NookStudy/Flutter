import 'package:flutter/material.dart';
import 'package:open_api_xml_parser/src/ui/list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListWidget(),
    );
  }
}