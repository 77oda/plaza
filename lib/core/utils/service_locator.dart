import 'package:get_it/get_it.dart';
import 'package:plaza/core/networking/api_service.dart';
import 'package:plaza/features/Favorites/data/repos/favorites_repo_impl.dart';
import 'package:plaza/features/Favorites/logic/toggle_favorite_cubit/toggle_favorite_cubit.dart';
import 'package:plaza/features/address/data/repos/address_repo_impl.dart';
import 'package:plaza/features/address/logic/address_cubit/address_cubit.dart';
import 'package:plaza/features/auth/data/repos/login_repo/login_repo_impl.dart';
import 'package:plaza/features/auth/data/repos/register_repo/register_repo_impl.dart';
import 'package:plaza/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:plaza/features/auth/logic/register_cubit/register_cubit.dart';
import 'package:plaza/features/cart/data/repos/cart_repo_impl.dart';
import 'package:plaza/features/cart/logic/cart_cubit/cart_cubit.dart';
import 'package:plaza/features/categories/data/repos/categories_repo_impl.dart';
import 'package:plaza/features/categories/logic/categories_cubit/categories_cubit.dart';
import 'package:plaza/features/home/data/repos/home_repo_impl.dart';
import 'package:plaza/features/home/logic/banners_cubit/banners_cubit.dart';
import 'package:plaza/features/home/logic/all_products_cubit/all_products_cubit.dart';
import 'package:plaza/features/notifications/data/repos/notifications_repo_impl.dart';
import 'package:plaza/features/notifications/logic/notifications_cubit/notifications_cubit.dart';
import 'package:plaza/features/products/data/repos/products_repo_impl.dart';
import 'package:plaza/features/products/logic/products_cubit/products_cubit.dart';
import 'package:plaza/features/Favorites/logic/favorites_cubit/favorites_cubit.dart';
import 'package:plaza/features/profile/data/repos/profile_repo_impl.dart';
import 'package:plaza/features/profile/logic/change_pass_cubit/change_pass_cubit.dart';
import 'package:plaza/features/profile/logic/profile_cubit/profile_cubit.dart';

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
  getIt.registerLazySingleton<AllProductsCubit>(
    () => AllProductsCubit(getIt<HomeRepoImpl>()),
  );

  //categories
  getIt.registerLazySingleton<CategoriesRepoImpl>(
    () => CategoriesRepoImpl(getIt<ApiService>()),
  );
  getIt.registerFactory<CategoriesCubit>(
    () => CategoriesCubit(getIt<CategoriesRepoImpl>()),
  );

  //products
  getIt.registerLazySingleton<ProductsRepoImpl>(
    () => ProductsRepoImpl(getIt<ApiService>()),
  );
  getIt.registerFactory<ProductsCubit>(
    () => ProductsCubit(getIt<ProductsRepoImpl>()),
  );

  // toggleFavorite
  getIt.registerFactory<ToggleFavoriteCubit>(
    () => ToggleFavoriteCubit(
      getIt<FavoritesRepoImpl>(),
      getIt<AllProductsCubit>(),
    ),
  );

  //favorites
  getIt.registerLazySingleton<FavoritesRepoImpl>(
    () => FavoritesRepoImpl(getIt<ApiService>()),
  );
  getIt.registerFactory<FavoriteCubit>(
    () =>
        FavoriteCubit(getIt<FavoritesRepoImpl>(), getIt<ToggleFavoriteCubit>()),
  );

  //profile
  getIt.registerLazySingleton<ProfileRepoImpl>(
    () => ProfileRepoImpl(getIt<ApiService>()),
  );
  getIt.registerFactory<ProfileCubit>(
    () => ProfileCubit(getIt<ProfileRepoImpl>()),
  );

  //changePassword
  getIt.registerFactory<ChangePassCubit>(
    () => ChangePassCubit(getIt<ProfileRepoImpl>()),
  );

  //notifications
  getIt.registerLazySingleton<NotificationsRepoImpl>(
    () => NotificationsRepoImpl(getIt<ApiService>()),
  );
  getIt.registerFactory<NotificationsCubit>(
    () => NotificationsCubit(getIt<NotificationsRepoImpl>()),
  );

  //address
  getIt.registerLazySingleton<AddressRepoImpl>(
    () => AddressRepoImpl(getIt<ApiService>()),
  );
  getIt.registerFactory<AddressCubit>(
    () => AddressCubit(getIt<AddressRepoImpl>()),
  );

  //carts
  getIt.registerLazySingleton<CartRepoImpl>(
    () => CartRepoImpl(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<CartCubit>(
    () => CartCubit(getIt<CartRepoImpl>(), getIt<AllProductsCubit>()),
  );
}
