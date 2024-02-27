import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_projects/ux/models/field_data.dart';
import 'package:test_projects/ux/models/my_point.dart';
import 'package:test_projects/ux/models/saved_url.dart';
import 'package:test_projects/ux/repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<AddNewUrl>(_onAddNewUrl);
    on<LoadData>(_onLoadData);
    on<DeleteUrl>(_onDeleteUrl);
  }

  List<List<MyPoint>> getSteps(
      Emitter<AppState> emit, List<Map<String, dynamic>> data) {
    emit(state.copyWith(percentage: 30));
    List<List<MyPoint>> result = [];
    emit(state.copyWith(percentage: 35));
    for (int i = 0; i < data.length; i++) {
      FieldData fieldData = FieldData.fromJSON(data[i]);
      result.add(fieldData.shortestPath());
      emit(state.copyWith(percentage: 35 + i));
    }
    emit(state.copyWith(percentage: 100-state.percentage-10));
    return result;
  }

  FutureOr<void> _onAddNewUrl(AddNewUrl event, Emitter<AppState> emit) async {
    emit(state.copyWith(percentage: 0));
    List<Map<String, dynamic>> data = [];
    if (Repository().savedUrls.any((element) => element.url == event.url)) {
      data = List.from(jsonDecode(Repository()
          .savedUrls
          .firstWhere((element) => element.url == event.url)
          .data)["data"]);
    } else {
      try {
        await Repository().getData(userUrl: event.url).then((value) {
          data = List.from(jsonDecode(value)["data"]);
        });
      } catch (e) {
        emit(state.copyWith(error: e.toString()));
      }
    }
    emit(state.copyWith(percentage: 30));
    List<List<MyPoint>> steps = getSteps(emit, data);
    emit(state.copyWith(percentage: 100-state.percentage-10));
    List<Map<String, dynamic>> result = [];
    emit(state.copyWith(percentage: 100-state.percentage-10));
    for (int i = 0; i < data.length; i++) {
      result.add({"id": data[i]["id"], "steps": steps[i]});
    }
    emit(state.copyWith(
        result: result,
        percentage: 100,
        savedUrls: Repository().savedUrls,
        currentData: data));
  }

  FutureOr<void> _onLoadData(LoadData event, Emitter<AppState> emit) {
    emit(state.clear());
  }

  FutureOr<void> _onDeleteUrl(DeleteUrl event, Emitter<AppState> emit)async {
    await Repository().removeSavedUrl(event.id).then((value) {
      emit(state.copyWith(savedUrls: Repository().savedUrls,));
    });
  }
}
