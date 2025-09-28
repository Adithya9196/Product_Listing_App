import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/BlocObserver/bloc_observer.dart';
import 'package:product_listing_app/HomePage/Homepage.dart';
import 'package:product_listing_app/LoginPage/Data/login_api.dart';
import 'package:product_listing_app/LoginPage/Logic/auth_bloc.dart';
import 'package:product_listing_app/LoginPage/Logic/auth_event.dart';
import 'package:product_listing_app/LoginPage/Logic/auth_state.dart';
import 'package:product_listing_app/ProductListing/Data/repository.dart';
import 'package:product_listing_app/ProductListing/Logic/products_bloc.dart';
import 'package:product_listing_app/ProductListing/UI_Page/products.dart';
import 'package:product_listing_app/Profile_Page/Data/profile_api.dart';
import 'package:product_listing_app/Profile_Page/Logic/profile_bloc.dart';
import 'package:product_listing_app/Profile_Page/Logic/profile_event.dart';
import 'package:product_listing_app/Search/Data/Search_api.dart';
import 'package:product_listing_app/Search/Logic/search_bloc.dart';
import 'package:product_listing_app/Search/UI/Searchbar.dart';
import 'package:product_listing_app/Show_wishlist/Logic/show_wishlist_event.dart';
import 'package:product_listing_app/Slider/Data/Slider_api.dart';
import 'package:product_listing_app/Slider/Logic/slider_bloc.dart';
import 'package:product_listing_app/Slider/UI/Slider.dart';
import 'package:product_listing_app/Splash_Screen/Splashscreen.dart';
import 'package:product_listing_app/Wishlist_add_remove/Data/Wishlist_api.dart';
import 'package:product_listing_app/Wishlist_add_remove/Logic/wishlist_bloc.dart';
import 'package:product_listing_app/Wishlist_add_remove/Logic/wishlist_event.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  // final prefs = await SharedPreferences.getInstance();
  // final userToken = prefs.getString("auth_token") ?? "";
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final String userToken;
  const MyApp({super.key, });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductsBloc(ProductRepository())..add(GetProducts())),
        BlocProvider(create: (context)=> SearchBloc(SearchRepository())),
        BlocProvider(create: (context)=> SliderBloc(BannerRepository())),
        BlocProvider(create: (context) => AuthBloc(AuthRepository())..add(CheckAuthStatusEvent())),
        //BlocProvider(create: (context) => WishlistBloc(WishlistRepository(userToken))..add(LoadWishlist())),

    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
