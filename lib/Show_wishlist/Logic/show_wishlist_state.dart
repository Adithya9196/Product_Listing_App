import 'package:equatable/equatable.dart';
import 'package:product_listing_app/Show_wishlist/Data/show_wishlist_model.dart';

abstract class ShowWishlistState extends Equatable {
  const ShowWishlistState();

  @override
  List<Object> get props => [];
}

class ShowWishlistInitial extends ShowWishlistState {}

class ShowWishlistLoading extends ShowWishlistState {}

class ShowWishlistLoaded extends ShowWishlistState {
  final List<ShowWishlistModel> wishlist;

  const ShowWishlistLoaded(this.wishlist);

  @override
  List<Object> get props => [wishlist];
}

class ShowWishlistError extends ShowWishlistState {
  final String message;

  const ShowWishlistError(this.message);

  @override
  List<Object> get props => [message];
}
