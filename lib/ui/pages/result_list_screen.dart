import 'package:flutter/material.dart';
import 'package:test_projects/ui/pages/preview_screen.dart';

class ResultListScreen extends StatefulWidget {
  const ResultListScreen(
      {super.key, required this.results, required this.currentData});

  final List<Map<String, dynamic>> results;
  final List<Map<String, dynamic>> currentData;

  @override
  State<ResultListScreen> createState() => _ResultListScreenState();
}

class _ResultListScreenState extends State<ResultListScreen> {
  late List<Map<String, dynamic>> results;
  List<String> path = [];

  @override
  void initState() {
    results = widget.results;
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result list screen"),
        backgroundColor: Colors.blue.shade300,
      ),
      body: ListView.builder(
          itemCount: path.length,
          itemBuilder: (context, position) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => PreviewScreen(
                          result: results[position],
                          currentData: widget.currentData[position])),
                  (route) => true,
                );
              },
              child: Container(
                height: 44,
                decoration:
                    const BoxDecoration(border: Border(bottom: BorderSide())),
                child: Center(
                  child: Text(path[position]),
                ),
              ),
            );
          }),
    );
  }

  loadData() {
    for (int i = 0; i < results.length; i++) {
      String text = '';
      for (int j = 0; j < results[i]["steps"].length; j++) {
        text += results[i]["steps"][j].toString();
        if (j != results[i]["steps"].length - 1) {
          text += '->';
        }
      }
      path.add(text);
    }
    setState(() {});
  }
}
