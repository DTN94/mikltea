import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'tab_state.dart';

final tabProvider =
StateNotifierProvider<TabController, TabState>(
      (ref) => TabController(ref),
);

class TabController extends StateNotifier<TabState> {
  final Ref ref;

  TabController(this.ref) : super(const TabState()){ }
  void TabClick(int tabIndex) async {
    state = state.copyWith(status: TabStatus.Loading);
    try {
      state = state.copyWith(tabindex:tabIndex ,status: TabStatus.Success);
    } catch (e) {
      state = state.copyWith(status:  TabStatus.Failure);
    }
  }

}