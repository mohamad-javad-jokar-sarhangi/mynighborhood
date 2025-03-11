import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mynighborhood/datalayer/datasources/remote/user_remote_datasource.dart';
import 'package:mynighborhood/datalayer/repositories/user_repository_impl.dart';
import 'package:mynighborhood/domainlayer/repositories/user_repository.dart';


final getIt = GetIt.instance;

void setupDependencies() {
  // ثبت Dio
  getIt.registerLazySingleton(() => Dio());

  // ثبت Remote Data Source
  getIt.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(dio: getIt<Dio>()),
  );

  // ثبت Repository
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDataSource: getIt<UserRemoteDataSource>()),
  );
}
