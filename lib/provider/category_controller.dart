import 'package:milktea/model/category_model.dart';
import 'package:milktea/repository/category_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_state.g.dart';

@riverpod
Future<List<CategoryModel>> allCategories(AllCategoriesRef ref) async {
  final CategoryRepository categoryRepository = ref.watch(categoryRepositoryProvider);
  return categoryRepository.getCategories();
}

@riverpod
class SelectedCategory extends _$SelectedCategory {
  @override
  CategoryModel? build() {
    return null;
  }

  void setSelectedCategory(CategoryModel? selectedCategory) async {
    if (state == selectedCategory) {
      state = null;
    } else {
      state = selectedCategory;
    }
  }
}
