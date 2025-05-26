
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectableModule {
  @LazySingleton()
  Dio get dio => Dio();
}