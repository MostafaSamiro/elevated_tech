import 'package:elevated_tech_1/data/models/Data_model.dart';

abstract class DataRepository {
  Future<List<DataModel>> getData();
}