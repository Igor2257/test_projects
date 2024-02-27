import 'dart:collection';

import 'package:test_projects/ux/models/my_point.dart';

class FieldData {
  String id;
  List<String> field;
  MyPoint start;
  MyPoint end;

  FieldData({
    required this.start,
    required this.end,
    required this.id,
    required this.field,
  });

  factory FieldData.fromJSON(Map<String, dynamic> data) {
    return FieldData(
      id: data["id"],
      field: List.from(data["field"]).cast<String>(),
      start: MyPoint(data["start"]["x"], data["start"]["y"]),
      end: MyPoint(data["end"]["x"], data["end"]["y"]),
    );
  }

  @override
  String toString() {
    return "FieldData: id=$id, start=$start, end=$end";
  }

  List<MyPoint> shortestPath() {
    MyPoint start = MyPoint(this.start.x, this.start.y);
    MyPoint end = MyPoint(this.end.x, this.end.y);
    final List<List<bool>> visited = List.generate(
      field.length,
      (_) => List.filled(field[0].length, false),
    );
    final List<List<MyPoint?>> previous = List.generate(
      field.length,
      (_) => List.filled(field[0].length, null),
    );

    final List<MyPoint> directions = [
      MyPoint(0, 1),
      MyPoint(0, -1),
      MyPoint(1, 0),
      MyPoint(-1, 0),
      MyPoint(1, 1),
      MyPoint(1, -1),
      MyPoint(-1, 1),
      MyPoint(-1, -1),
    ];

    final Queue<MyPoint> queue = Queue();
    queue.add(start);
    visited[start.y][start.x] = true;

    while (queue.isNotEmpty) {
      final current = queue.removeFirst();

      if (current.x == end.x && current.y == end.y) {
        List<MyPoint> path = [];
        MyPoint? backtrack = current;
        while (backtrack != null) {
          path.add(backtrack);
          backtrack = previous[backtrack.y][backtrack.x];
        }

        return path.toList();
      }

      for (final direction in directions) {
        final next = MyPoint(current.x + direction.x, current.y + direction.y);
        if (next.x >= 0 &&
            next.x < field[0].length &&
            next.y >= 0 &&
            next.y < field.length &&
            field[next.y][next.x] != 'X' &&
            !visited[next.y][next.x]) {
          queue.add(next);
          visited[next.y][next.x] = true;
          previous[next.y][next.x] = current;
        }
      }
    }
    return [];
  }
}
