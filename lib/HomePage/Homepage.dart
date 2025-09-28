//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:product_listing_app/ProductListing/Data/Model.dart';
// import 'package:product_listing_app/ProductListing/Logic/products_bloc.dart';
// import 'package:product_listing_app/ProductListing/UI_Page/products.dart';
//
// class HomePage extends StatefulWidget {
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int _currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<ProductsBloc, ProductsState>(
//         builder: (context, state) {
//           if (state is ProductLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is ProductLoaded) {
//             final products = state.products;
//
//             // Split into two categories just for demo
//             final popular = products.take(4).toList();
//             final latest = products.skip(4).take(4).toList();
//
//             return ListView(
//               children: [
//                 ProductSection(title: "Popular Products", products: popular),
//                 ProductSection(title: "Latest Products", products: latest),
//               ],
//             );
//           } else if (state is ProductError) {
//             return Center(child: Text("Error: ${state.message}"));
//           }
//           return const Center(child: Text("No Products"));
//         },
//       ),
//
//       // Bottom Nav
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) => setState(() => _currentIndex = index),
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Wishlist"),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
//         ],
//       ),
//     );
//   }
// }
//
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:product_listing_app/ProductListing/Data/Model.dart';
// import 'package:product_listing_app/ProductListing/Logic/products_bloc.dart';
//
// class ProductList extends StatelessWidget {
//   final Products product;
//   final VoidCallback onWishlistTap;
//
//   const ProductList({super.key, required this.product, required this.onWishlistTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 160,
//       margin: const EdgeInsets.only(right: 12),
//       child: Card(
//         elevation: 2,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Image + Wishlist button
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//                   child: Image.network(
//                     product.featuredImage,
//                     height: 120,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Positioned(
//                   top: 8,
//                   right: 8,
//                   child: GestureDetector(
//                     onTap: onWishlistTap,
//                     child: CircleAvatar(
//                       radius: 14,
//                       backgroundColor: Colors.white,
//                       child: Icon(
//                         product.inWishlist ? Icons.favorite : Icons.favorite_border,
//                         color: Colors.purple,
//                         size: 18,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             // Name
//             Padding(
//               padding: const EdgeInsets.all(6.0),
//               child: Text(
//                 product.name,
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//             // Price Row
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 6),
//               child: Row(
//                 children: [
//                   Text(
//                     "₹${product.salePrice}",
//                     style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(width: 5),
//                   Text(
//                     "₹${product.mrp}",
//                     style: const TextStyle(
//                       decoration: TextDecoration.lineThrough,
//                       color: Colors.grey,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Rating
//             Padding(
//               padding: const EdgeInsets.all(6.0),
//               child: Row(
//                 children: [
//                   const Icon(Icons.star, color: Colors.orange, size: 16),
//                   Text(product.avgRating.toString(), style: const TextStyle(fontSize: 12)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
// class ProductSection extends StatelessWidget {
//   final String title;
//   final List<Products> products;
//
//   const ProductSection({super.key, required this.title, required this.products});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//           child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//         ),
//         SizedBox(
//           height: 230,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: products.length,
//             itemBuilder: (context, index) {
//               return ProductList(
//                 product: products[index],
//                 onWishlistTap: () {
//                   // Handle wishlist toggle
//                 },
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/HomePage/BottomNavigation.dart';
import 'package:product_listing_app/ProductListing/Logic/products_bloc.dart';
import 'package:product_listing_app/ProductListing/UI_Page/Latest_Product.dart';
import 'package:product_listing_app/ProductListing/UI_Page/products.dart';
import 'package:product_listing_app/Profile_Page/Profile_UI/Profile_page.dart';
import 'package:product_listing_app/Search/UI/Searchbar.dart';
import 'package:product_listing_app/Show_wishlist/Ui/Show_wishlist_UI_page.dart';
import 'package:product_listing_app/Slider/Logic/slider_bloc.dart';
import 'package:product_listing_app/Slider/UI/Slider.dart';

class Homepage extends StatefulWidget{
  final String token;
  Homepage({required this.token});

  @override
  State<Homepage> createState() => _HomepageState();
}
//
// class _HomepageState extends State<Homepage> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<SliderBloc>().add(fetchbanner());
//     context.read<ProductsBloc>().add(GetProducts());
//   }
//   // @override
//   // Widget build(BuildContext context) {
//   //  return Scaffold(
//   //    body: SingleChildScrollView(
//   //      child: Column(
//   //        crossAxisAlignment: CrossAxisAlignment.start,
//   //        children: const [
//   //          BannerSlider(),
//   //          SizedBox(height: 12),
//   //          Padding(
//   //            padding: EdgeInsets.all(8.0),
//   //            child: Text(
//   //              "Popular Products",
//   //              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//   //            ),
//   //          ),
//   //          ProductPage(),
//   //        ],
//   //      ),
//   //    ),
//   //  );
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 200,
//               child: BannerSlider(),
//             ),
//             const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text(
//                 "Popular Products",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//             ),
//             SizedBox(
//               height: 500,
//               child: ProductPage(),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigation(),
//     );
//   }
// }
//

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<SliderBloc>().add(fetchbanner());
    context.read<ProductsBloc>().add(GetProducts());
  }
  
  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:16,left: 16, right: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SearchScreen()),);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Search",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ),
                      Icon(Icons.search, color: Colors.black54),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 210, child: BannerSlider()),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Popular Products",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 500, child: ProductPage(token: widget.token,)),
            SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Latest Products",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 300, child: LatestProduct()),
          ],
        ),
      ),
      SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ShowWishlistPage()
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ProfilePage(token: widget.token),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: _pages[_currentIndex]
      ),
      bottomNavigationBar: BottomNavigation(
        onTabSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
