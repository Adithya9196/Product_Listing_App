part of 'slider_bloc.dart';

@immutable
sealed class SliderState {}

final class SliderInitial extends SliderState {}

class SliderLoading extends SliderState{}

class SliderLoaded extends SliderState{
  final List sliderlist;
  SliderLoaded(this.sliderlist);
}

class SliderError extends SliderState{
  final String sliderError;
  SliderError(this.sliderError);
}
