import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'pagenavigation_state.dart';

class PagenavigationCubit extends Cubit<PagenavigationState> {
  PagenavigationCubit() : super(PagenavigationState.initial());

  void updatePage({required int page}) {
    emit(state.copyWith(
      page: page,
    ));
    state.pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}
