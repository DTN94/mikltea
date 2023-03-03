part of 'tab_provider.dart';

enum TabStatus {Loading, Success, Failure}
class TabState extends Equatable {
  final int tabindex;
  final TabStatus status;

  const TabState({
    this.tabindex = 0,
    this.status = TabStatus.Loading,
  });

  TabState copyWith({
    int? tabindex,
    TabStatus? status,
  }) {
    return TabState(
      tabindex: tabindex ?? this.tabindex,
      status: status ?? this.status,
    );
  }
  @override
  List<Object> get props => [ tabindex, status ];
}