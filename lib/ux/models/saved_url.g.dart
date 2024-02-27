// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_url.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavedUrlAdapter extends TypeAdapter<SavedUrl> {
  @override
  final int typeId = 1;

  @override
  SavedUrl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SavedUrl(
      id: fields[0] as String,
      url: fields[1] as String,
      data: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SavedUrl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavedUrlAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SavedUrlImpl _$$SavedUrlImplFromJson(Map<String, dynamic> json) =>
    _$SavedUrlImpl(
      id: json['id'] as String? ?? "",
      url: json['url'] as String? ?? "",
      data: json['data'] as String? ?? "",
    );

Map<String, dynamic> _$$SavedUrlImplToJson(_$SavedUrlImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'data': instance.data,
    };
