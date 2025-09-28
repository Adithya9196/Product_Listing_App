import 'package:equatable/equatable.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object?> get props => [];
}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final List<int> wishlistIds;

  const WishlistLoaded(this.wishlistIds);

  @override
  List<Object?> get props => [wishlistIds];
}

class WishlistError extends WishlistState {
  final String message;

  const WishlistError(this.message);

  @override
  List<Object?> get props => [message];
}
