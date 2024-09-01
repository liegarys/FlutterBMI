// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_giris0/main_page.dart';

void main() {
  runApp(AnaUygulama());
}

class AnaUygulama extends StatelessWidget
{
  @override
  Widget build(BuildContext context) 
  {
     return MaterialApp(home: MainPage(),);
  }
}
