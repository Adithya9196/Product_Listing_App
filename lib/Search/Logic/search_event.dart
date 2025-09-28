part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class searchProduct extends SearchEvent{
  final String query;
  searchProduct(this.query);
}
