import 'package:flutter/material.dart';
//import 'dart:io' if (dart.library.html) 'dart:ui' as ui;
import 'dart:ui' as ui;
import 'dart:html' as html;
import 'FakeUi.dart' if (dart.library.html) 'dart:ui' as ui;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Iframe()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class Iframe extends StatelessWidget {
  Iframe() {
    //ignore: undefined_prefixed_name:ignore
    ui.platformViewRegistry.registerViewFactory('iframe', (int viewId) {
      var iframe = html.IFrameElement();
      iframe.src = 'https://swsu.ru/sbornik-statey/pdf/gaiken23_1-13.pdf';
      return iframe;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        width: 2000,
        height: 900,
        child: HtmlElementView(viewType: 'iframe'));
  }
}