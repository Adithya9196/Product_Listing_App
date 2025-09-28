part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

class SearchInitial extends SearchState{}

class SearchLoading extends SearchState{}

class SearchLoaded extends SearchState{
  final List searchProducts;
  SearchLoaded(this.searchProducts);
}

class SearchError extends SearchState{
  final String searcherror;
  SearchError(this.searcherror);
}