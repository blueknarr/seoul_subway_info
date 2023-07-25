import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final controller = TransformationController();

  @override
  void initState() {
    super.initState();
    controller.value = Matrix4.identity() * 2.5;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('서울 지하철 노선'),
      ),
      body: Center(
          child: SizedBox(
        height: 400,
        child: InteractiveViewer(
          boundaryMargin: const EdgeInsets.all(20.0),
          transformationController: controller,
          minScale: 0.5,
          maxScale: 3.0,
          child: Stack(children: [
            Image.asset('lib/data/data_source/local/seoul_subway_line.jpg',
                fit: BoxFit.fitWidth),
          ]),
        ),
      )),
    );
  }
}
