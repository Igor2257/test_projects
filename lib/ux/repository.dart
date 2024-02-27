import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:test_projects/main.dart';
import 'package:test_projects/ux/models/saved_url.dart';

class Repository {
  List<SavedUrl> get savedUrls =>
      savedUrlsBox?.values.cast<SavedUrl>().toList() ?? List.empty();

  Future<String> getData(
      {String userUrl = "https://flutter.webspark.dev/flutter/api"}) async {
    String data = "";
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      data = "No internet connection";
    } else {
      try {
        var url = Uri.parse(userUrl);
        await http.get(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
        ).then((value) async {
          if (value.statusCode > 199 && value.statusCode < 300) {
            data = value.body;
            addSavedUrl(SavedUrl(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                url: userUrl,
                data: data));
          } else {
            data = value.body;
          }
        });
      } catch (e) {
        data = e.toString();
        Fluttertoast.showToast(
            msg: e.toString(), toastLength: Toast.LENGTH_LONG);
      }
    }
    return data;
  }

  Future<String?> sendResult(List<Map<String, dynamic>> result) async {
    String? error;
    if (await (Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      error = "No internet connection";
    } else {
      try {
        var url = Uri.parse("https://flutter.webspark.dev/flutter/api");
        List<Map<String, dynamic>> newResult = [];
        for (int i = 0; i < result.length; i++) {
          List<Map<String, dynamic>> steps = [];
          for (int j = 0; j < result[i]["steps"].length; j++) {
            steps.add(
              {"x": result[i]["steps"][j].x, "y": result[i]["steps"][j].y},
            );
          }
          String text = '';
          for (int j = 0; j < result[i]["steps"].length; j++) {
            text += result[i]["steps"][j].toString();
            if (j != result[i]["steps"].length - 1) {
              text += '->';
            }
          }
          newResult.add({
            "id": result[i]["id"],
            "result": {
              "steps": steps,
              "path": text,
            }
          });
        }

        for (var result in newResult) {
          await http
              .post(
            url,
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            body: jsonEncode([result]),
          )
              .then((value) async {
            if (!(value.statusCode > 199 && value.statusCode < 300)) {
              error = value.body;
              Fluttertoast.showToast(
                  msg: error.toString(), toastLength: Toast.LENGTH_LONG);
            } else {
              print("value.body ${value.body}");
            }
          });
        }
      } catch (e) {
        error = e.toString();
        Fluttertoast.showToast(
            msg: e.toString(), toastLength: Toast.LENGTH_LONG);
      }
    }
    return error;
  }

  Future addSavedUrl(SavedUrl savedUrl) async {
    await savedUrlsBox!.put(savedUrl.id, savedUrl);
  }

  Future updateSavedUrl(SavedUrl savedUrl) async {
    await savedUrlsBox!.put(savedUrl.id, savedUrl);
  }

  Future removeSavedUrl(String id) async {
    await savedUrlsBox!.delete(id);
  }
}
