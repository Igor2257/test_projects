part of 'app_bloc.dart';

class AppState {
  int percentage;
  List<Map<String, dynamic>> result, currentData;
  bool isLoading;
  List<SavedUrl> savedUrls;
  String error;

  AppState(
      {this.percentage = 0,
      this.result = const [],
      this.savedUrls = const [],
      this.currentData = const [],
      this.isLoading = false,
      this.error = ""});

  AppState copyWith({
    int? percentage,
    List<Map<String, dynamic>>? result,
    currentData,
    bool? isLoading,
    List<SavedUrl>? savedUrls,
    String? error,
  }) {
    return AppState(
      percentage: percentage ?? this.percentage,
      result: result ?? this.result,
      isLoading: isLoading ?? this.isLoading,
      savedUrls: savedUrls ?? this.savedUrls,
      error: error ?? this.error,
      currentData: currentData ?? this.currentData,
    );
  }

  AppState clear() {
    return AppState(
      percentage: 0,
      result: [],
      isLoading: false,
      savedUrls: Repository().savedUrls,
      error: "",
      currentData: [],
    );
  }
}
