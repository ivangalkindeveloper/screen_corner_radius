import 'package:flutter/material.dart';
import 'package:screen_corner_radius/screen_corner_radius.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: FutureBuilder(
            future: ScreenCornerRadius.get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final data = snapshot.data;
              if (data == null) {
                return const Center(child: Text('No data'));
              }

              return Padding(
                padding: const EdgeInsets.all(16),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(data.topLeft),
                      topRight: Radius.circular(data.topRight),
                      bottomLeft: Radius.circular(data.bottomLeft),
                      bottomRight: Radius.circular(data.bottomRight),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            data.topLeft.toStringAsFixed(2).toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 32),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            data.topRight.toStringAsFixed(2).toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 32),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            data.bottomLeft.toStringAsFixed(2).toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 32),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            data.bottomRight.toStringAsFixed(2).toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 32),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
