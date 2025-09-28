import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/Wishlist_add_remove/Data/Wishlist_api.dart';
import 'wishlist_event.dart';
import 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final WishlistRepository repository;

  WishlistBloc(this.repository) : super(WishlistLoading()) {
    on<LoadWishlist>(_onLoadWishlist);
    on<AddToWishlist>(_onAddToWishlist);
    on<RemoveFromWishlist>(_onRemoveFromWishlist);
  }

  Future<void> _onLoadWishlist(
      LoadWishlist event, Emitter<WishlistState> emit) async {
    try {
      emit(WishlistLoading());
      final ids = await repository.fetchWishlist();
      emit(WishlistLoaded(ids));
    } catch (e) {
      emit(WishlistError(e.toString()));
    }
  }

  Future<void> _onAddToWishlist(
      AddToWishlist event, Emitter<WishlistState> emit) async {
    if (state is WishlistLoaded) {
      final currentState = state as WishlistLoaded;
      try {
        await repository.toggleWishlist(event.productId);

        final updatedList = List<int>.from(currentState.wishlistIds)
          ..add(event.productId);

        emit(WishlistLoaded(updatedList));
      } catch (e) {
        emit(WishlistError(e.toString()));
      }
    }
  }

  Future<void> _onRemoveFromWishlist(
      RemoveFromWishlist event, Emitter<WishlistState> emit) async {
    if (state is WishlistLoaded) {
      final currentState = state as WishlistLoaded;
      try {
        await repository.toggleWishlist(event.productId);

        final updatedList = List<int>.from(currentState.wishlistIds)
          ..remove(event.productId);

        emit(WishlistLoaded(updatedList));
      } catch (e) {
        emit(WishlistError(e.toString()));
      }
    }
  }
}
