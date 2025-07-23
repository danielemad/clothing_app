import 'core/injections.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/themes/dark_theme.dart';
import 'features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'features/auth/presentation/screens/auth_screen.dart';
import 'features/home/presentation/cubits/product_cubit.dart';
import 'features/home/presentation/screens/product_details_screen.dart';
import 'features/cart/presentation/cubits/cart_cubit.dart';
import 'features/cart/presentation/screens/cart_screen.dart';
import 'features/user/presentation/screens/user_account_screen.dart';
import 'features/wishlist/presentation/cubits/wishlist_cubit.dart';
import 'features/wishlist/presentation/screens/wishlist_screen.dart';
import 'main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getInit();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductCubit>(
          create: (_) => ProductCubit(),
        ),
        BlocProvider<CartCubit>(
          create: (_) => CartCubit(),
        ),
        BlocProvider<WishListCubit>(
          create: (_) => WishListCubit(),
        ),
        BlocProvider<AuthCubit>(
          create: (_) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Clothing Brand',
        theme: AppDarkTheme.theme,
        initialRoute: '/auth',
        routes: {
          '/auth' : (context) => const AuthScreen(),
          '/home': (context) => const MainScreen(),
          '/product': (context) => const ProductDetailsScreen(),
          '/cart': (context) => const CartScreen(),
          '/wishlist': (context) => const WishListScreen(),
          '/user':(context) => const UserAccountScreen()
        },
      ),
    );
  }
}
