import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:async';
import 'dart:math';

class GyroscopeDisplay extends StatefulWidget {
  const GyroscopeDisplay({super.key});

  @override
  State<GyroscopeDisplay> createState() => _GyroscopeDisplayState();
}

class _GyroscopeDisplayState extends State<GyroscopeDisplay> {
  StreamSubscription<GyroscopeEvent>? _gyroscopeSubscription;
  List<double> _gyroscopeValues = <double>[0.0, 0.0, 0.0];

  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  List<double> _accelerometerValues = <double>[0.0, 0.0, 0.0];
  String _orientation = 'Unknown';

  @override
  void initState() {
    super.initState();
    _startListening();
  }

  @override
  void dispose() {
    _stopListening();
    super.dispose();
  }

  void _startListening() {
    _gyroscopeSubscription = gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeValues = <double>[event.x!, event.y!, event.z!];
      });
      // Bạn có thể thêm logic xử lý dữ liệu gyroscope ở đây nếu cần
      // print('Gyroscope: x=${event.x?.toStringAsFixed(2)}, y=${event.y?.toStringAsFixed(2)}, z=${event.z?.toStringAsFixed(2)}');
    });

    _accelerometerSubscription = accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _accelerometerValues = <double>[event.x!, event.y!, event.z!];
        _updateOrientation();
      });
    });
  }

  void _stopListening() {
    _gyroscopeSubscription?.cancel();
    _accelerometerSubscription?.cancel();
  }

  void _updateOrientation() {
    // Lấy giá trị gia tốc trên trục z (bao gồm cả trọng lực)
    double zAcceleration = _accelerometerValues[2];

    // Ngưỡng để xác định úp hay ngửa. Giá trị này có thể cần điều chỉnh tùy theo thiết bị.
    double threshold = 7.0; // Khoảng +/- so với gia tốc trọng trường (~9.8 m/s^2)

    if (zAcceleration > threshold) {
      _orientation = 'Ngửa';
    } else if (zAcceleration < -threshold) {
      _orientation = 'Úp';
    } else {
      _orientation = 'Gần như thẳng đứng hoặc nghiêng';
    }
  }

  @override
  Widget build(BuildContext context) {
    final gyroscope = _gyroscopeValues.map((double v) => v.toStringAsFixed(2)).toList();
    final accelerometer = _accelerometerValues.map((double v) => v.toStringAsFixed(2)).toList();

    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Sensor Readings',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text('Gyroscope:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('X: ${gyroscope[0]} rad/s'),
            Text('Y: ${gyroscope[1]} rad/s'),
            Text('Z: ${gyroscope[2]} rad/s'),
            const SizedBox(height: 8.0),
            const Text('Accelerometer:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('X: ${accelerometer[0]} m/s²'),
            Text('Y: ${accelerometer[1]} m/s²'),
            Text('Z: ${accelerometer[2]} m/s²'),
            const SizedBox(height: 8.0),
            const Text('Orientation:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Trạng thái: $_orientation'),
          ],
        ),
      ),
    );
  }
}