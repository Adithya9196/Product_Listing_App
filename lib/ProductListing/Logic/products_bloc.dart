import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:product_listing_app/ProductListing/Data/List_Model.dart';
import 'package:product_listing_app/ProductListing/Data/repository.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository repository;
  ProductsBloc(this.repository) : super(ProductsInitial()) {
    on<GetProducts>((event, emit) async {
      emit(ProductLoading());
      try{
        final products = await repository.fetchProducts();
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}
