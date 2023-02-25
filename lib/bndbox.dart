import 'dart:math';

import 'package:flutter/material.dart';
import 'models.dart';

class BndBox extends StatelessWidget {
  final List<dynamic> results;
  final int previewH;
  final int previewW;
  final double screenH;
  final double screenW;
  final String model;

  BndBox(this.results, this.previewH, this.previewW, this.screenH, this.screenW,
      this.model);

  @override
  Widget build(BuildContext context) {
    double _calAngle(Map<String, dynamic> pts){
      double shoulderX = pts['rightShoulder_x'];
      double shoulderY = pts['rightShoulder_y'];
      double elbowX = pts['rightElbow_x'];
      double elbowY = pts['rightElbow_y'];
      double wristX = pts['rightWrist_x'];
      double wristY = pts['rightWrist_y'];
      double seDist2 = pow(shoulderX-elbowX, 2) + pow(shoulderY-elbowY, 2);
      double ewDist2 = pow(wristX-elbowX, 2) + pow(wristY-elbowY, 2);
      double swDist2 = pow(shoulderX-wristX, 2) + pow(shoulderY-wristY, 2);
      double cos = (seDist2 + ewDist2 - swDist2)/(2*sqrt(seDist2)*sqrt(ewDist2));
      double angle = acos(cos) * (180.0 / pi);
      return angle;
    }

    List<double> _calPosition(double x, double y){
      var scaleW, scaleH, xp, yp;

      if (screenH / screenW > previewH / previewW) {
        scaleW = screenH / previewH * previewW;
        scaleH = screenH;
        var difW = (scaleW - screenW) / scaleW;
        xp = (x - difW / 2) * scaleW;
        yp = y * scaleH;
      } else {
        scaleH = screenW / previewW * previewH;
        scaleW = screenW;
        var difH = (scaleH - screenH) / scaleH;
        xp = x * scaleW;
        yp = (y - difH / 2) * scaleH;
      }
      return [xp, yp];
    }

    List<Widget> _renderKeypoints() {
      var lists = <Widget>[];
      results.forEach((re) {
        var sew = {
          'rightShoulder': re['keypoints'][6], 
          'rightElbow': re['keypoints'][8], 
          'rightWrist': re['keypoints'][10]
        };
        // print(sew);
        if (sew.values.any((e) => e == null)){
          return [];
        }
        var pts2 = {
          'rightShoulder': _calPosition(sew['rightShoulder']['x'], sew['rightShoulder']['y']),
          'rightElbow': _calPosition(sew['rightElbow']['x'], sew['rightElbow']['y']),
          'rightWrist': _calPosition(sew['rightWrist']['x'], sew['rightWrist']['y'])
        };
        print(pts2);
        // double angle = _calAngle(pts2);
        var l1 = LinePainter(pts2['rightShoulder'][0], pts2['rightShoulder'][1], pts2['rightElbow'][0], pts2['rightElbow'][1]);
        var l2 = LinePainter(pts2['rightElbow'][0], pts2['rightElbow'][1], pts2['rightWrist'][0], pts2['rightWrist'][1]);
        var list = [
          // Positioned(
          //   left: pts2['rightShoulder'][0] - 6,
          //   top: pts2['rightShoulder'][1] - 6,
          //   width: 100,
          //   height: 12,
          //   child: Container(
          //     child: Text(
          //       "-shoulder",
          //       style: TextStyle(
          //         color: Color.fromRGBO(37, 213, 253, 1.0),
          //         fontSize: 12.0,
          //       ),
          //     ),
          //   ),
          // ),
          // Positioned(
          //   left: pts2['rightElbow'][0] - 6,
          //   top: pts2['rightElbow'][1] - 6,
          //   width: 100,
          //   height: 12,
          //   child: Container(
          //     child: Text(
          //       "-elbow",
          //       style: TextStyle(
          //         color: Color.fromRGBO(37, 213, 253, 1.0),
          //         fontSize: 12.0,
          //       ),
          //     ),
          //   ),
          // ),
          // Positioned(
          //   left: pts2['rightWrist'][0] - 6,
          //   top: pts2['rightWrist'][1] - 6,
          //   width: 100,
          //   height: 12,
          //   child: Container(
          //     child: Text(
          //       "-wrist",
          //       style: TextStyle(
          //         color: Color.fromRGBO(37, 213, 253, 1.0),
          //         fontSize: 12.0,
          //       ),
          //     ),
          //   ),
          // ),
          CustomPaint(painter: l1,),
          CustomPaint(painter: l2,),
        ];
        // print(angle);
        lists..addAll(list);
      });

      return lists;
    }

    return Stack(
      children: model == posenet ? _renderKeypoints() : null
    );
  }
}

class LinePainter extends CustomPainter { 
  final double p1x;
  final double p1y;
  final double p2x;
  final double p2y;

  LinePainter(this.p1x, this.p1y, this.p2x, this.p2y);
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(p1x, p1y);
    final p2 = Offset(p2x, p2y);
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}