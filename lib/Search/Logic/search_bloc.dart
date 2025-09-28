import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:product_listing_app/Search/Data/Search_api.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository repository;

  SearchBloc(this.repository) : super(SearchInitial()) {
    on<searchProduct>((event, emit) async {
      emit(SearchLoading());
      try {
        final searchResults = await repository.searchProducts(event.query);
        emit(SearchLoaded(searchResults));
      } catch (e) {
        emit(SearchError(e.toString()));
      }
    });
  }
}
