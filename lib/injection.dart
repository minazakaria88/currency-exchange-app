import 'package:currency/Features/data/data_source/remote_data_source.dart';
import 'package:currency/Features/data/repos/currency_repo_impl.dart';
import 'package:currency/Features/domain/repos/currency_repo.dart';
import 'package:currency/Features/domain/use_cases/currency_use_case.dart';
import 'package:currency/Features/presentation/cubit/cubit.dart';
import 'package:currency/core/api/api_helper.dart';
import 'package:currency/core/api/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final s1 = GetIt.instance;

void setupServiceLocator() {
  s1.registerFactory(
    () => AppCubit(
      currencyUseCase: s1(),
    ),
  );

  s1.registerLazySingleton<CurrencyUseCase>(
    () => CurrencyUseCase(
      currencyRepo: s1(),
    ),
  );

  s1.registerLazySingleton<CurrencyRepo>(
        () => CurrencyRepoImpl(remoteDataSource: s1())
  );

  s1.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(apiHelper: s1()));

  s1.registerLazySingleton<ApiHelper>(() => DioHelper(dio: s1()));

  s1.registerLazySingleton(() => Dio());
}
