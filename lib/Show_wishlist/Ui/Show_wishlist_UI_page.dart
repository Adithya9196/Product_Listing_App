import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/Show_wishlist/Data/show_wishlist_api.dart';
import 'package:product_listing_app/Show_wishlist/Logic/show_wishlist_bloc.dart';
import 'package:product_listing_app/Show_wishlist/Logic/show_wishlist_event.dart';
import 'package:product_listing_app/Show_wishlist/Logic/show_wishlist_state.dart';

class ShowWishlistPage extends StatelessWidget {
  const ShowWishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ShowWishlistRepository(),
      child: BlocProvider(
        create: (context) =>
        ShowWishlistBloc(context.read<ShowWishlistRepository>())
          ..add(FetchWishlist()),
        child: Scaffold(
          appBar: AppBar(title: const Text("My Wishlist"),
          automaticallyImplyLeading: false,
          ),
          body: BlocBuilder<ShowWishlistBloc, ShowWishlistState>(
            builder: (context, state) {
              if (state is ShowWishlistLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ShowWishlistLoaded) {
                return ListView.builder(
                  itemCount: state.wishlist.length,
                  itemBuilder: (context, index) {
                    final product = state.wishlist[index];
                    return ListTile(
                      leading: Image.network(
                        product.featuredImage,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(product.name),
                      subtitle: Text("₹${product.salePrice}"),
                    );
                  },
                );
              } else if (state is ShowWishlistError) {
                return Center(child: Text(state.message));
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
