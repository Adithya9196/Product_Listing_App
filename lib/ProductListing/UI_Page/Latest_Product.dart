import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/ProductListing/Data/List_Model.dart';
import 'package:product_listing_app/ProductListing/Logic/products_bloc.dart';

class LatestProduct extends StatelessWidget {
  const LatestProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductLoaded) {
          return SizedBox(
            height: 260, // Height of product card
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Horizontal scroll
              padding: const EdgeInsets.all(12),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final Products product = state.products[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: SizedBox(
                    width: 160, // Width of each card
                    child: ProductCard(product: product),
                  ),
                );
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
          borderRadius:
          const BorderRadius.vertical(top: Radius.circular(12), bottom: Radius.circular(12)),
          child: Image.network(
            product.featuredImage,
            height: 160,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
              child: Text(
                "₹${product.mrp}",
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
            Text(
              "₹${product.salePrice}",
              style: const TextStyle(
                color: Colors.blueAccent,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.orange, size: 16),
                Text(product.avgRating.toString(), style: const TextStyle(fontSize: 12)),
              ],
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
