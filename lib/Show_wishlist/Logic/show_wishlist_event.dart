import 'package:equatable/equatable.dart';

abstract class ShowWishlistEvent extends Equatable {
 const ShowWishlistEvent();

  @override
  List<Object> get props => [];
}

class FetchWishlist extends ShowWishlistEvent {}
