import 'dart:ui';
import 'package:flutter/material.dart';

class ChartCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          child: Text(
            "背 & 二头",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          )),
      Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsetsDirectional.fromSTEB(2, 6, 0, 0),

          child: Text(
            "上次训练：2020-1-08",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          )),
      Container(
          alignment: Alignment.topLeft,
          height: 160,
          child: CustomPaint(
            // 使用CustomPaint
            painter: PaperPainter(),
          )),
      Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
          child: Table(children: [
            TableRow(children: [
              Container(
                  margin: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 6),
                        child: Text(
                          '7',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                      Text(
                        '训练动作',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )
                    ],
                  )),
              Container(
                margin: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                child: RaisedButton(
                  onPressed: () {},
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    child: const Text('        开始        ',
                        style: TextStyle(fontSize: 20)),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff1a73e8),
                          Colors.indigo,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  ),
                ),
              ),
            ])
          ])),
    ]);
  }
}

class PaperPainter extends CustomPainter {
  final List<int> yData = [10195, 12195, 14000, 13000, 12003, 13340];
  double xStep = 0; // x 间隔
  double yStep = 30; // y 间隔
  final double _kScaleHeight = 8; // 刻度高
  final double _kBarPadding = 20; // 柱状图前间隔
  Paint fillPaint = Paint()..color = Colors.white;
  final TextPainter _textPainter =
      TextPainter(textDirection: TextDirection.ltr);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(5, 20);
    _drawYText(canvas, size);
    _drawBarChart(canvas, size);
  }

  void _drawBarChart(Canvas canvas, Size size) {
    canvas.save();
    canvas.translate(40, 130);
    int maxData = findMax();
    for (int i = 0; i < 6; i++) {
      if (i % 2 == 0) {
        fillPaint.color = Color(0xff677EF2);
      } else {
        fillPaint.color = Color(0xff8A9EFD);
      }
      canvas.drawRRect(
          RRect.fromLTRBAndCorners(
            0, //left
            0, //top
            30, //right
            -((yData[i] ~/ 1000) * 9.2).toDouble(), //bottom
            topRight: Radius.elliptical(0, 0),
            topLeft: Radius.elliptical(0, 0),
          ),
          fillPaint);
      canvas.translate(40, 0);
    }
    canvas.restore();
  }

  void _drawYText(Canvas canvas, Size size) {
    canvas.save();
    int maxData = findMax();

    int numStep = findMax() ~/ 1000 ~/ 5;

    String init = "0 k";
    String max = '${maxData ~/ 1000} k';

    for (int i = 0; i < 5; i++) {
      if (i == 0) {
        _drawText(max, canvas, Offset.zero);
        canvas.translate(0, yStep);
        continue;
      }
      if (i == 4) {
        _drawText(init, canvas, Offset.zero);
        break;
      }
      String str = '${(numStep * (5 - i + 1)).toStringAsFixed(0)} k';
      _drawText(str, canvas, Offset.zero);
      canvas.translate(0, yStep);
    }
    canvas.restore();
  }

  void _drawText(String str, Canvas canvas, Offset offset) {
    TextSpan text = TextSpan(
        text: str,
        style: TextStyle(
          fontSize: 12,
          color: Colors.white,
        ));
    _textPainter.text = text;
    _textPainter.layout(); // 进行布局

    _textPainter.paint(canvas, offset); // 进行
  }

  int findMax() {
    int max = yData[0];
    for (int i = 1; i < yData.length; i++) {
      if (yData[i] > max) {
        max = yData[i];
      }
    }

    return max;
  }

  @override
  bool shouldRepaint(PaperPainter oldDelegate) => false;
}
