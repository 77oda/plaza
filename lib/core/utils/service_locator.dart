import 'package:get_it/get_it.dart';
import 'package:plaza/core/networking/api_service.dart';
import 'package:plaza/features/auth/data/repos/login_repo/login_repo_impl.dart';
import 'package:plaza/features/auth/data/repos/register_repo/register_repo_impl.dart';
import 'package:plaza/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:plaza/features/auth/logic/register_cubit/register_cubit.dart';
import 'package:plaza/features/categories/data/repos/Categories_repo_impl.dart';
import 'package:plaza/features/home/data/repos/home_repo_impl.dart';
import 'package:plaza/features/home/logic/banners_cubit/banners_cubit.dart';
import 'package:plaza/features/categories/logic/categories_cubit/categories_cubit.dart';
import 'package:plaza/features/home/logic/home_cubit/home_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  //api service
  final apiService = await ApiService.create();
  getIt.registerSingleton<ApiService>(apiService);

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
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepoImpl>()));

  //categories
  getIt.registerLazySingleton<CategoriesRepoImpl>(
    () => CategoriesRepoImpl(getIt<ApiService>()),
  );
  getIt.registerFactory<CategoriesCubit>(
    () => CategoriesCubit(getIt<CategoriesRepoImpl>()),
  );
}
