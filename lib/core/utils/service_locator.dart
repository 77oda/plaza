import 'package:get_it/get_it.dart';
import 'package:plaza/core/networking/api_service.dart';
import 'package:plaza/features/auth/data/repos/login_repo/login_repo_impl.dart';
import 'package:plaza/features/auth/data/repos/register_repo/register_repo_impl.dart';
import 'package:plaza/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:plaza/features/auth/logic/register_cubit/register_cubit_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  //api service
  getIt.registerSingleton<ApiService>(ApiService());

  //login
  getIt.registerLazySingleton<LoginRepoImpl>(
    () => LoginRepoImpl(getIt<ApiService>()),
  );
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepoImpl>()));

  //register
  getIt.registerLazySingleton<RegisterRepoImpl>(
    () => RegisterRepoImpl(getIt<ApiService>()),
  );
  getIt.registerFactory<RegisterCubit>(
    () => RegisterCubit(getIt<RegisterRepoImpl>()),
  );
}
