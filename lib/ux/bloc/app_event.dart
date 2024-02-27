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