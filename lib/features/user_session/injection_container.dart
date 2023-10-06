import 'package:hive/hive.dart';
import 'package:weatherapp/core/helper/hive_names.dart';
import 'package:weatherapp/features/user_session/cubits/onboarding_status_cubit/onboarding_status_cubit.dart';
import 'package:weatherapp/features/user_session/data/repositories/user_session_repository_impl.dart';
import 'package:weatherapp/features/user_session/domain/repositories/user_session_repository.dart';
import 'package:weatherapp/injection_container.dart';

import 'data/datasource/user_session_cache_datasource.dart';

mixin UserSessionInjector on Injector {
  @override
  Future<void> init() async {
    await super.init();
    // final Dio dio = sl<Dio>(instanceName: globalDio);
    final Box userSessionDataBox = sl<Box>(instanceName: HiveNames.userSessionDataBox);

    // data sources
    sl.registerLazySingleton<UserSessionCacheDatasource>(
      () => UserSessionCacheDatasourceImpl(userSessionDataBox),
    );

    // repositories
    sl.registerLazySingleton<UserSessionRepository>(
      () => UserSessionRepositoryImpl(userSessionCacheDatasource: sl()),
    );

    // cubits
    sl.registerLazySingleton<OnboardingStatusCubit>(
      () => OnboardingStatusCubit(userSessionRepository: sl()),
    );
  }
}
