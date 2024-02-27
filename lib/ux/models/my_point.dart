class MyPoint {
  final int x;
  final int y;

  MyPoint(this.x, this.y);

  @override
  String toString() {
    return "($x,$y)";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyPoint &&
          runtimeType == other.runtimeType &&
          x == other.x &&
          y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}
