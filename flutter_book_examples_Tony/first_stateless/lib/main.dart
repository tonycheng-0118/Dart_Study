import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 123, 58, 183)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Three Cars!'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: const Column (children: <Widget>[
          CarWidget("Bmw", "M3",
              "https://media.ed.edmunds-media.com/bmw/m3/2018/oem/2018_bmw_m3_sedan_base_fq_oem_4_150.jpg"),
          CarWidget("Nissan", "GTR",
              "https://media.ed.edmunds-media.com/nissan/gt-r/2018/oem/2018_nissan_gt-r_coupe_nismo_fq_oem_1_150.jpg"),
          CarWidget("Nissan", "Sentra",
              "https://media.ed.edmunds-media.com/nissan/sentra/2017/oem/2017_nissan_sentra_sedan_sr-turbo_fq_oem_4_150.jpg"),
        ]));
  }
}

class CarWidget extends StatelessWidget {
  const CarWidget(this.make, this.model, this.imageSrc, {super.key});

  final String make;
  final String model;
  final String imageSrc;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child:  Center(
                child: Column(children: <Widget>[
              Text('$make $model', style: const TextStyle(fontSize: 24.0)),
              Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Image.network(imageSrc))
            ])));
  }
}
