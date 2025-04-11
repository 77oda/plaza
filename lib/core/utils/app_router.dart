import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plaza/core/helpers/cacheHelper.dart';
import 'package:plaza/core/utils/service_locator.dart';
import 'package:plaza/features/Favorites/logic/favorites_cubit/favorites_cubit.dart';
import 'package:plaza/features/Favorites/logic/toggle_favorite_cubit/toggle_favorite_cubit.dart';
import 'package:plaza/features/Favorites/presentation/favorites_screen.dart';
import 'package:plaza/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:plaza/features/auth/logic/register_cubit/register_cubit.dart';
import 'package:plaza/features/auth/presentation/Login_Screen.dart';
import 'package:plaza/features/auth/presentation/register_screen.dart';
import 'package:plaza/features/home/logic/banners_cubit/banners_cubit.dart';
import 'package:plaza/features/categories/logic/categories_cubit/categories_cubit.dart';
import 'package:plaza/features/home/logic/all_products_cubit/all_products_cubit.dart';
import 'package:plaza/features/layout/presentation/layout_screen.dart';
import 'package:plaza/features/onboarding/presentation/onboarding_screen.dart';
import 'package:plaza/features/products/data/model/products_model.dart';
import 'package:plaza/features/products/logic/products_cubit/products_cubit.dart';
import 'package:plaza/features/products/presentation/product_details_screen.dart';
import 'package:plaza/features/products/presentation/products_screen.dart';
import 'package:plaza/features/profile/logic/change_pass_cubit/change_pass_cubit.dart';
import 'package:plaza/features/profile/logic/profile_cubit/profile_cubit.dart';
import 'package:plaza/features/profile/presentation/change_pass_screen.dart';
import 'package:plaza/features/profile/presentation/profile_screen.dart';
import 'package:plaza/features/search/presentation/search_screen.dart';

abstract class AppRouter {
  static const onBoardingScreen = '/OnBoardingScreen';
  static const loginScreen = '/LoginScreen';
  static const registerScreen = '/RegisterScreen';
  static const layoutScreen = '/LayoutScreen';
  static const productsScreen = '/ProductsScreen';
  static const productDetailsScreen = '/ProductDetailsScreen';
  static const favoritesScreen = '/FavoritesScreen';
  static const profileScreen = '/ProfileScreen';
  static const changePassScreen = '/ChangePassScreen';
  static const searchScreen = '/SearchScreen';

  static late String initialRoute;

  static Future<void> getInitialRoute() async {
    final finishedOnBoarding = await CacheHelper.getData('onBoarding') ?? false;
    final token = await CacheHelper.getSecuredString('token') ?? '';

    if (finishedOnBoarding == false)
      initialRoute = onBoardingScreen;
    else if (token == '')
      initialRoute = loginScreen;
    else
      initialRoute = layoutScreen;
  }

  static final router = GoRouter(
    initialLocation: initialRoute,
    routes: [
      GoRoute(
        path: onBoardingScreen,
        builder: (context, state) => OnBoardingScreen(),
      ),

      GoRoute(
        path: loginScreen,
        builder:
            (context, state) => BlocProvider(
              create: (context) => getIt<LoginCubit>(),
              child: LoginScreen(),
            ),
      ),

      GoRoute(
        path: registerScreen,
        builder:
            (context, state) => BlocProvider(
              create: (context) => getIt<RegisterCubit>(),
              child: RegisterScreen(),
            ),
      ),

      GoRoute(
        path: layoutScreen,
        builder:
            (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => getIt<BannersCubit>()..fetchBanners(),
                ),
                BlocProvider(
                  create:
                      (context) => getIt<CategoriesCubit>()..fetchCategories(),
                ),
                BlocProvider(
                  create:
                      (context) =>
                          getIt<AllProductsCubit>()..fetchAllProducts(),
                ),
                BlocProvider(create: (context) => getIt<ToggleFavoriteCubit>()),
              ],
              child: LayoutScreen(),
            ),
      ),

      GoRoute(
        path: productsScreen,
        builder: (context, state) {
          final data = state.extra! as Map<String, dynamic>;
          return BlocProvider(
            create:
                (context) =>
                    getIt<ProductsCubit>()..fetchProducts(data['id'] as int),
            child: ProductsScreen(categoryName: data['name'] as String),
          );
        },
      ),

      GoRoute(
        path: productDetailsScreen,
        builder: (context, state) {
          final data = state.extra;
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(value: getIt<AllProductsCubit>()),
              BlocProvider.value(value: getIt<ToggleFavoriteCubit>()),
            ],
            child: ProductDetailsScreen(model: data as ProductData),
          );
        },
      ),

      GoRoute(
        path: favoritesScreen,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) => getIt<FavoriteCubit>()..fetchFavoriteProducts(),
              child: FavoritesScreen(),
            ),
      ),

      GoRoute(
        path: profileScreen,
        builder:
            (context, state) => BlocProvider(
              create: (context) => getIt<ProfileCubit>()..fetchProfileData(),
              child: ProfileScreen(),
            ),
      ),

      GoRoute(
        path: changePassScreen,
        builder:
            (context, state) => BlocProvider(
              create: (context) => getIt<ChangePassCubit>(),
              child: ChangePassScreen(),
            ),
      ),

      GoRoute(
        path: searchScreen,
        builder:
            (context, state) => BlocProvider.value(
              value: getIt<AllProductsCubit>(),
              child: SearchScreen(),
            ),
      ),
    ],
  );
}
