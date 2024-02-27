part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}
class LoadData extends AppEvent{
  LoadData();
}
class AddNewUrl extends AppEvent{
  final String url;

  AddNewUrl({required this.url});
}
class DeleteUrl extends AppEvent{
  final String id;

  DeleteUrl({required this.id});
}