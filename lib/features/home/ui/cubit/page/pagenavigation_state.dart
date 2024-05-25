part of 'pagenavigation_cubit.dart';

class PagenavigationState extends Equatable {
  final int page;
  final PageController pageController;
  const PagenavigationState({
    required this.page,
    required this.pageController,
  });
  PagenavigationState copyWith({
    int? page,
    PageController? pageController,
  }) {
    return PagenavigationState(
      page: page ?? this.page,
      pageController: pageController ?? this.pageController,
    );
  }

  factory PagenavigationState.initial() {
    return PagenavigationState(
      page: 0,
      pageController: PageController(initialPage: 0),
    );
  }

  @override
  List<Object> get props => [page, pageController];
}
