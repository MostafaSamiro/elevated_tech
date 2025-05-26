import 'package:elevated_tech_1/data/models/Data_model.dart';
import 'package:injectable/injectable.dart';

import 'package:dio/dio.dart';

import '../../domain/repo/data_repository.dart';

@LazySingleton(as: DataRepository)
class dataRepositoryImpl implements DataRepository {
  final Dio dio;

  dataRepositoryImpl(this.dio);

  @override
  Future<List<DataModel>> getData() async {
    final response = await dio.get('https://fakestoreapi.com/products');
    return (response.data as List)
        .map((json) => DataModel.fromJson(json))
        .toList();
  }
}