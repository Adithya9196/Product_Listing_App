part of 'products_bloc.dart';

@immutable
sealed class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductLoading extends ProductsState{}

class ProductLoaded extends ProductsState{
  final List<Products> products;
  ProductLoaded(this.products);
}

class ProductError extends ProductsState{
  final String message;
  ProductError(this.message);
}