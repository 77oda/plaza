import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:plaza/core/networking/api_service.dart';
import 'package:plaza/features/auth/data/repos/login_repo/login_repo_impl.dart';
import 'package:plaza/features/auth/data/repos/register_repo/register_repo_impl.dart';
import 'package:plaza/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:plaza/features/auth/logic/register_cubit/register_cubit.dart';
import 'package:plaza/features/home/data/repos/home_repo_impl.dart';
import 'package:plaza/features/home/logic/banners_cubit/banners_cubit.dart';
import 'package:plaza/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:plaza/features/home/logic/cubit/home_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  //api service
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  //login
  getIt.registerLazySingleton<LoginRepoImpl>(
    () => LoginRepoImpl(getIt<ApiService>()),
  );
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(getIt<LoginRepoImpl>(), getIt<ApiService>()),
  );

  //register
  getIt.registerLazySingleton<RegisterRepoImpl>(
    () => RegisterRepoImpl(getIt<ApiService>()),
  );
  getIt.registerFactory<RegisterCubit>(
    () => RegisterCubit(getIt<RegisterRepoImpl>()),
  );

  //home
  getIt.registerLazySingleton<HomeRepoImpl>(
    () => HomeRepoImpl(getIt<ApiService>()),
  );
  getIt.registerFactory<BannersCubit>(
    () => BannersCubit(getIt<HomeRepoImpl>()),
  );
  getIt.registerFactory<CategoriesCubit>(
    () => CategoriesCubit(getIt<HomeRepoImpl>()),
  );
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepoImpl>()));
}
