import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foodstore/resource/model/slider_model.dart';
import 'package:flutter_foodstore/resource/remote/home_remote_resource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'slider_state.dart';
part 'slider_cubit.freezed.dart';

class SliderCubit extends Cubit<SliderState> {
  final HomeRemoteResource homeRemoteResource;
  SliderCubit(this.homeRemoteResource) : super(SliderState.initial());

  fecthSlider() async {
    emit(SliderState.loading());
    try {
      final result = await homeRemoteResource.fetchSliders();
      result.fold(
        (error) => emit(SliderState.error(error)),
        (sliders) => emit(SliderState.loaded(sliders)),
      );
    } catch (e) {
      emit(SliderState.error(e.toString()));
    }
  }
}
