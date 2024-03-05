import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(AppWidget());

class AppWidget extends StatefulWidget {
  AppWidget({super.key}) {
    debugPrint("AppWidget - constructor - $hashCode");
  }

  @override
  State<AppWidget> createState() => _AppWidgetState();
  // _AppWidgetState createState() {
  //   debugPrint("AppWidget - createState - $hashCode");
  //   return _AppWidgetState();
  // }
}

class _AppWidgetState extends State<AppWidget> {
  bool _bright = false;

  _brightnessCallback() {
    setState(() => _bright = !_bright);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("_AppWidgetState - build - $hashCode");
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: _bright ? Brightness.light : Brightness.dark),
        home: FlowerWidget(
            imageSrc: _bright
                ? "https://www.viewbug.com/media/mediafiles/" "2015/07/05/56234977_large1300.jpg"
                : "https://images.unsplash.com/photo-1531603071569-0dd65ad72d53?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
            brightnessCallback: _brightnessCallback));
  }
}

class FlowerWidget extends StatefulWidget {
  final String imageSrc;
  final VoidCallback brightnessCallback;

  FlowerWidget({super.key, required this.imageSrc, required this.brightnessCallback}){
    debugPrint("FlowerWidget - constructor - $hashCode");
  }

  @override
  State<FlowerWidget> createState() => _FlowerWidgetState();
  // {
  //   debugPrint("FlowerWidget - createState - $hashCode");
  //   return _FlowerWidgetState();
  // }
}

class _FlowerWidgetState extends State<FlowerWidget> {
  double _blur = 0;

  _FlowerWidgetState() {
    debugPrint("_FlowerWidgetState - constructor - $hashCode");
  }

  @override
  initState() {
    super.initState();
    debugPrint("_FlowerWidgetState - initState - $hashCode");
  }

  /// Fired when Flutter detects that the data from another source has changed,
  /// possibly affecting the UI and causing a call to ‘build’.
  /// In this case it is when the Theme changes (its an InheritedWidget).
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("_FlowerWidgetState - didChangeDependencies - $hashCode");
  }

  // @override
  /// Fired when the widget is reconstructed as its widget data has changed,
  /// In this case it is when a new FlowerWidget is created with a different
  /// imageSrc.
  // void didUpdateWidget(Widget oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   debugPrint("_FlowerWidgetState - didUpdateWidget - $hashCode");

  //   // The flower image has changed, so reset the blur.
  //   _blur = 0;
  // }

  void _blurMore() {
    setState(() {
      _blur += 5.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("_FlowerWidgetState - build - $hashCode");
    return Scaffold(
      appBar: AppBar(title: const Text("Flower"), actions: [
        IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              widget.brightnessCallback();
            })
      ]),
      body: Container(
        decoration: BoxDecoration(
            // dependency on inherited widget - start
            color: Theme.of(context).colorScheme.background,
            // dependency on inherited widget - end
            image: DecorationImage(
                // dependency on data from widget - start
                image: NetworkImage(widget.imageSrc),
                // dependency on data from widget - end
                fit: BoxFit.cover)),
        child: BackdropFilter(
          // dependency on state data - start
          filter: ImageFilter.blur(sigmaX: _blur, sigmaY: _blur),
          // dependency on state data - end
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _blurMore,
        tooltip: 'Blur More',
        child: const Icon(Icons.add),
      ),
    );
  }
}
