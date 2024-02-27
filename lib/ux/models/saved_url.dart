
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'saved_url.freezed.dart';
part 'saved_url.g.dart';

@freezed
@HiveType(typeId: 1)
class SavedUrl with _$SavedUrl {
  factory SavedUrl({
    @HiveField(0) @Default("") String id,
    @HiveField(1) @Default("") String url,
    @HiveField(2) @Default("") String data,

  }) = _SavedUrl;

  factory SavedUrl.fromJson(Map<String, dynamic> json) => _$SavedUrlFromJson(json);
}
