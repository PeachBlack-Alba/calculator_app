import 'package:get_it/get_it.dart';
import 'data/data_sources/calculator_data_source.dart';
import 'data/repositories/calculator_repository.dart';
import 'domain/use_cases/calculator_use_case.dart';
import 'presentation/bloc/calculator_bloc.dart';

final sl = GetIt.instance;

void init() {
  // BLoC
  sl.registerFactory(() => CalculatorBloc(sl()));

  // Use cases
  sl.registerLazySingleton(() => CalculateUseCase(sl()));

  // Repository
  sl.registerLazySingleton(() => CalculatorRepository(sl()));

  // Data sources
  sl.registerLazySingleton(() => CalculatorDataSource());
}
