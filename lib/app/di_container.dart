import 'package:mock_api_demo/app/core/local_db/database/database.dart';
import 'package:mock_api_demo/app/core/mobx/common/common_store.dart';
import 'package:mock_api_demo/app/core/network/api/api_services.dart';
import 'package:mock_api_demo/app/core/network/api/dio_client.dart';
import 'package:mock_api_demo/app/core/repository/remote/api_repository.dart';
import 'package:mock_api_demo/app/core/repository/repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/mobx/mobx.dart';


final sl = GetIt.instance;

Future<void> init(String baseUrl) async {
   print("base $baseUrl");
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  // Database
   final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
   sl.registerSingleton<AppDatabase>(database);

  // Repository
  sl.registerLazySingleton<Repository>(() => ApiRepository(apiService: sl()));

  // Network
  sl.registerLazySingleton(() => ApiService(dio: sl()));
  sl.registerLazySingleton(() => sl<DioClient>().dio);
  sl.registerLazySingleton(() => DioClient(apiBaseUrl: baseUrl));


  sl.registerFactory(() => CommonStore(authRepository: sl(),database:database));
  sl.registerFactory(() => ProductDetailStore(authRepository: sl()));
  sl.registerFactory(() => CartStore(authRepository: sl(),database: database));

  //Singleton
  // sl.registerSingleton(UserApi(dioClient: sl()));
  // sl.registerSingleton(UserRepository(getIt.get<UserApi>()));
  // sl.registerSingleton(AllController());
}
