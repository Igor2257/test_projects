import 'package:flutter/material.dart';
import 'package:test_projects/ux/models/my_point.dart';

class PreviewScreen extends StatefulWidget {
  const PreviewScreen(
      {super.key, required this.result, required this.currentData});

  final Map<String, dynamic> result;
  final Map<String, dynamic> currentData;

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  late final Map<String, dynamic> result;
  late final Map<String, dynamic> currentData;
  List<List<String>> field = [];
  List<MyPoint> steps = [];
  MyPoint start = MyPoint(0, 0), end = MyPoint(0, 0);

  @override
  void initState() {
    result = widget.result;
    currentData = widget.currentData;
    steps = result["steps"];

    List<String> rows = List.from(currentData["field"]);
    for (String row in rows) {
      List<String> characters = List.from(row.split(''));
      field.add(characters);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preview screen"),
        backgroundColor: Colors.blue.shade300,
      ),
      body: GridView.builder(
        shrinkWrap: true,
        itemCount: field.length * field[0].length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: field[0].length,
        ),
        itemBuilder: (BuildContext context, int index) {
          int row = index ~/ field[0].length;
          int col = index % field[0].length;
          Color cellColor = _getCellColor(field[row][col], row, col, steps);
          return GridCell(
            color: cellColor,
            text: '($col,$row)',
          );
        },
      ),
    );
  }

  Color _getCellColor(
    String cellType,
    int row,
    int col,
    List<MyPoint> steps,
  ) {
    MyPoint currentPoint = MyPoint(col, row);

    if (currentPoint == steps.first) {
      return const Color(0xFF64FFDA);
    } else if (currentPoint == steps.last) {
      return const Color(0xFF009688);
    }
    for (MyPoint step in steps) {
      if (currentPoint == step) {
        return const Color(0xFF4CAF50);
      }
    }

    switch (cellType) {
      case ".":
        return Colors.white;
      case "X":
        return Colors.black;
      default:
        return Colors.white;
    }
  }
}

class GridCell extends StatelessWidget {
  final Color color;
  final String text;

  const GridCell({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color, border: Border.all(color: Colors.black38)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: color == Colors.black ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
