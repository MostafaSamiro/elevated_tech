// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:elevated_tech_1/core/di/injectable_module.dart' as _i363;
import 'package:elevated_tech_1/data/repo/data_repository_impl.dart' as _i25;
import 'package:elevated_tech_1/domain/repo/data_repository.dart' as _i1060;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../views/cubits/data_cubit.dart';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i361.Dio>(() => injectableModule.dio);
    gh.lazySingleton<_i1060.DataRepository>(
      () => _i25.dataRepositoryImpl(gh<_i361.Dio>()),
    );
    gh.factory<DataCubit>(() => DataCubit(gh<_i1060.DataRepository>()));
    return this;
  }
}

class _$InjectableModule extends _i363.InjectableModule {}
