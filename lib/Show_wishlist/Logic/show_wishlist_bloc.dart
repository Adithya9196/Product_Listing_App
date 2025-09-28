import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/Show_wishlist/Data/show_wishlist_api.dart';
import 'package:product_listing_app/Show_wishlist/Logic/show_wishlist_event.dart';
import 'package:product_listing_app/Show_wishlist/Logic/show_wishlist_state.dart';

class ShowWishlistBloc extends Bloc<ShowWishlistEvent, ShowWishlistState> {
  final ShowWishlistRepository repository;

  ShowWishlistBloc(this.repository) : super(ShowWishlistInitial()) {
    on<FetchWishlist>(_onFetchWishlist);
  }

  Future<void> _onFetchWishlist(
      FetchWishlist event, Emitter<ShowWishlistState> emit) async {
    emit(ShowWishlistLoading());
    try {
      final wishlist = await repository.fetchWishlist();
      emit(ShowWishlistLoaded(wishlist));
    } catch (e) {
      emit(ShowWishlistError(e.toString()));
    }
  }
}
