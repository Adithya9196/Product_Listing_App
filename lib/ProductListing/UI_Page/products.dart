import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/ProductListing/Data/List_Model.dart';
import 'package:product_listing_app/ProductListing/Logic/products_bloc.dart';
import 'package:product_listing_app/Wishlist_add_remove/Logic/wishlist_bloc.dart';
import 'package:product_listing_app/Wishlist_add_remove/Logic/wishlist_event.dart';
import 'package:product_listing_app/Wishlist_add_remove/Logic/wishlist_state.dart';

class ProductPage extends StatelessWidget {
  final String token;

  const ProductPage({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            return SizedBox(
              height: (state.products.length/2).ceil() * 250,
              child: GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final Products product = state.products[index];
                  return ProductCard(product: product,);
                },
              ),
            );
          } else if (state is ProductError) {
            return Center(child: Text("Error: ${state.message}"));
          }
          return Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<ProductsBloc>().add(GetProducts());
              },
              child: const Text("Load Products"),
            ),
          );
        },
    );
  }
}

class ProductCard extends StatelessWidget {
  final Products product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12),bottom: Radius.circular(12)),
            child: Image.network(
              product.featuredImage,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: Text(
                  "₹${product.mrp}",
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Text(
                  "₹${product.salePrice}",
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
             Padding(
              padding: const EdgeInsets.only(right: 2, left:55),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange, size: 16),
                  Text(product.avgRating.toString(), style: const TextStyle(fontSize: 12)),
                ],
              ),
             ),
            ],
          ),
          Text(
            product.name,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),

        ],
    );

  }
}


//
// class ProductCard extends StatelessWidget {
//   final Products product;
//   final String token;
//
//   const ProductCard({super.key, required this.product, required this.token});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<WishlistBloc, WishlistState>(
//       builder: (context, wishlistState) {
//         final isInWishlist = wishlistState is WishlistLoaded &&
//             wishlistState.wishlistIds.contains(product.id);
//
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadius.vertical(
//                       top: Radius.circular(12), bottom: Radius.circular(12)),
//                   child: Image.network(
//                     product.featuredImage,
//                     height: 180,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                     errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
//                   ),
//                 ),
//                 Positioned(
//                   right: 8,
//                   top: 8,
//                   child: GestureDetector(
//                     onTap: () {
//                       // if (isInWishlist) {
//                       //   context
//                       //       .read<WishlistBloc>()
//                       //       .add(RemoveFromWishlist(product.id));
//                       // } else {
//                       //   context
//                       //       .read<WishlistBloc>()
//                       //       .add(AddToWishlist(product.id));
//                       // }
//                     },
//                     child: Icon(
//                       isInWishlist ? Icons.favorite : Icons.favorite_border,
//                       color: isInWishlist ? Colors.blue : Colors.grey,
//                       size: 28,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Padding(
//                   padding:
//                   const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
//                   child: Text(
//                     "₹${product.mrp}",
//                     style: const TextStyle(
//                       decoration: TextDecoration.lineThrough,
//                       fontSize: 12,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 2.0),
//                   child: Text(
//                     "₹${product.salePrice}",
//                     style: const TextStyle(
//                       color: Colors.blueAccent,
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 2, left: 30),
//                   child: Row(
//                     children: [
//                       const Icon(Icons.star,
//                           color: Colors.orange, size: 16),
//                       Text(product.avgRating.toString(),
//                           style: const TextStyle(fontSize: 12)),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Text(
//               product.name,
//               overflow: TextOverflow.ellipsis,
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
