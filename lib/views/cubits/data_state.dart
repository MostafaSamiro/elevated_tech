import 'package:elevated_tech_1/data/models/Data_model.dart';

abstract class DataState {}

class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataLoaded extends DataState {
  final List<DataModel> data;
  DataLoaded(this.data);
}

class DataError extends DataState {
  final String message;
  DataError(this.message);
}