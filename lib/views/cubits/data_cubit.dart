import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repo/data_repository.dart';
import 'data_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class DataCubit extends Cubit<DataState> {
  final DataRepository repository;

  DataCubit(this.repository) : super(DataInitial());

  Future<void> fetchData() async {
    emit(DataLoading());
    try {
      final posts = await repository.getData();
      emit(DataLoaded(posts));
    } catch (e) {
      emit(DataError(e.toString()));
    }
  }
}