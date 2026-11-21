part of 'slider_cubit.dart';

@freezed
class SliderState with _$SliderState {
  const factory SliderState.initial() = _Initial;
  const factory SliderState.loading() = _Loading;
  const factory SliderState.loaded(List<SliderModel> sliders) = _Loaded;
  const factory SliderState.error(String message) = _Error;
}
