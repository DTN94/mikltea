import 'package:milktea/repository/slide_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'slide_state.g.dart';

@riverpod
Future<List<String>> allSlides(AllSlidesRef ref) async {
  final SlideRepository slideRepository = ref.watch(slideRepositoryProvider);
  return slideRepository.getSlides();
}
