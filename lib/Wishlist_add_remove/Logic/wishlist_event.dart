import 'package:equatable/equatable.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object?> get props => [];
}

class LoadWishlist extends WishlistEvent {}

class AddToWishlist extends WishlistEvent {
  final int productId;

  const AddToWishlist(this.productId);

  @override
  List<Object?> get props => [productId];
}

class RemoveFromWishlist extends WishlistEvent {
  final int productId;

  const RemoveFromWishlist(this.productId);

  @override
  List<Object?> get props => [productId];
}
