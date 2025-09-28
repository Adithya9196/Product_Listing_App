import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:product_listing_app/Slider/Data/SliderModel.dart';
import 'package:product_listing_app/Slider/Data/Slider_api.dart';

part 'slider_event.dart';

part 'slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  final BannerRepository bannerrepository;

  SliderBloc(this.bannerrepository) : super(SliderInitial()) {
    on<SliderEvent>((event, emit) async {
      emit(SliderLoading());
      try {
        final bannerresult = await bannerrepository.bannerList();
        emit(SliderLoaded(bannerresult));
      } catch (e) {
        emit(SliderError(e.toString()));
      }
    });
  }
}
