import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class
MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RoundedCornerSliderPage(),
    );
  }
}
class RoundedCornerSliderPage extends StatefulWidget {
  @override
  _RoundedCornerSliderPageState createState() => _RoundedCornerSliderPageState();
}

class _RoundedCornerSliderPageState extends State<RoundedCornerSliderPage> {
  double topLeft = 20.0;
  double topRight = 20.0;
  double bottomLeft = 20.0;
  double bottomRight = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IPZ-31 Serhii'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(topLeft),
                      topRight: Radius.circular(topRight),
                      bottomLeft: Radius.circular(bottomLeft),
                      bottomRight: Radius.circular(bottomRight),
                    ),
                  ),
                ),
              ),
            ),
            SliderRow(
              label: 'Top Left',
              value: topLeft,
              onChanged: (newValue) => setState(() => topLeft = newValue),
            ),
            SliderRow(
              label: 'Top Right',
              value: topRight,
              onChanged: (newValue) => setState(() => topRight = newValue),
            ),
            SliderRow(
              label: 'Bottom Left',
              value: bottomLeft,
              onChanged: (newValue) => setState(() => bottomLeft = newValue),
            ),
            SliderRow(
              label: 'Bottom Right',
              value: bottomRight,
              onChanged: (newValue) => setState(() => bottomRight = newValue),
            ),
          ],
        ),
      ),
    );
  }
}

class SliderRow extends StatelessWidget {
  final String label;
  final double value;
  final ValueChanged<double> onChanged;

  const SliderRow({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 100, child: Text(label)),
        Expanded(
          child: Slider(
            value: value,
            min: 0,
            max: 100,
            onChanged: onChanged,
          ),
        ),
        SizedBox(
          width: 40,
          child: Text(value.toStringAsFixed(1)),
        ),
      ],
    );
  }
}
