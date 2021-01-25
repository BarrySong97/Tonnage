import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui show Image;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // 确定初始化
  SystemChrome.setPreferredOrientations(// 使设备横屏显示
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  SystemChrome.setEnabledSystemUIOverlays([]); // 全屏显示
  runApp(Paper());
}

class Paper extends StatefulWidget {
  @override
  _PaperState createState() => _PaperState();
}

class _PaperState extends State<Paper> {
  ui.Image _image;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  void _loadImage() async {
    _image = await loadImageFromAssets('assets/connor.jpg');

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white, child: CustomPaint(painter: PaperPainter(_image)));
  }
}

// class Paper extends StatelessWidget {
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: CustomPaint(
//         // 使用CustomPaint
//         painter: PaperPainter(),
//       ),
//     );
//   }
// }

class PaperPainter extends CustomPainter {
  Paint _gridPint; // 画笔

  final ui.Image image;
  final double step = 20; // 小格边长
  final double strokeWidth = .5; // 线宽
  final Color color = Colors.grey; // 线颜色

  PaperPainter(this.image) {
    _gridPint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = color;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    _drawGrid(canvas, size);
    drawAxis(canvas, size);
    _drawPic(canvas);
  }

  void _drawGrid(Canvas canvas, Size size) {
    _drawBottomRight(canvas, size);

    canvas.save();
    canvas.scale(1, -1); //沿x轴镜像
    _drawBottomRight(canvas, size);
    canvas.restore();

    canvas.save();
    canvas.scale(-1, 1); //沿y轴镜像
    _drawBottomRight(canvas, size);
    canvas.restore();

    canvas.save();
    canvas.scale(-1, -1); //沿原点镜像
    _drawBottomRight(canvas, size);
    canvas.restore();
  }

  void _drawBottomRight(Canvas canvas, Size size) {
    canvas.save();
    for (int i = 0; i < size.height / 2 / step; i++) {
      canvas.drawLine(Offset(0, 0), Offset(size.width / 2, 0), _gridPint);
      canvas.translate(0, step);
    }
    canvas.restore();

    canvas.save();
    for (int i = 0; i < size.width / 2 / step; i++) {
      canvas.drawLine(Offset(0, 0), Offset(0, size.height / 2), _gridPint);
      canvas.translate(step, 0);
    }
    canvas.restore();
  }

  void drawAxis(Canvas canvas, Size size) {
    Paint paint = new Paint();
    paint
      ..color = Colors.blue
      ..strokeWidth = 1.5;
    canvas.drawLine(
        Offset(-size.width / 2, 0), Offset(size.width / 2, 0), paint);
    canvas.drawLine(
        Offset(0, -size.height / 2), Offset(0, size.height / 2), paint);

    canvas.drawLine(
        Offset(0, -size.height / 2), Offset(7, -size.height / 2 + 10), paint);
    canvas.drawLine(
        Offset(0, -size.height / 2), Offset(-7, -size.height / 2 + 10), paint);

    canvas.drawLine(
        Offset(size.width / 2, 0), Offset(size.width / 2 - 10, 7), paint);
    canvas.drawLine(
        Offset(size.width / 2, 0), Offset(size.width / 2 - 10, -7), paint);
  }

  @override
  bool shouldRepaint(PaperPainter oldDelegate) => image != oldDelegate.image;

  void _drawPic(Canvas canvas) {
    Paint _paint = new Paint();
    if (image != null) {
      canvas.drawImageRect(
          image,
          Rect.fromCenter(
              center: Offset(0, 0),
              width: 200,
              height: 200),
          Rect.fromLTRB(0, 0,200,200),
          _paint);
    }
  }
}

Future<ui.Image> loadImageFromAssets(String path) async {
  ByteData data = await rootBundle.load(path);
  List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  return decodeImageFromList(bytes);
}
