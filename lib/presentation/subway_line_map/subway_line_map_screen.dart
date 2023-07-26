import 'package:flutter/material.dart';

class SubwayLineMapScreen extends StatefulWidget {
  const SubwayLineMapScreen({Key? key}) : super(key: key);

  @override
  State<SubwayLineMapScreen> createState() => _SubwayLineMapScreenState();
}

class _SubwayLineMapScreenState extends State<SubwayLineMapScreen> {
  final controller = TransformationController();

  @override
  void initState() {
    super.initState();
    controller.value = Matrix4.identity() * 4.5;
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
        height: 550,
        child: InteractiveViewer(
          boundaryMargin: const EdgeInsets.all(10.0),
          transformationController: controller,
          minScale: 2.5,
          maxScale: 6.0,
          child: Stack(children: [
            Image.asset('assets/images/seoul_subway_line.jpg',
                fit: BoxFit.fitWidth),
          ]),
        ),
      )),
    );
  }
}
