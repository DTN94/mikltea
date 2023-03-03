// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$allCategoriesHash() => r'0e06a6682c6a2180e8646ad602171b970c5de8e5';

/// See also [allCategories].
@ProviderFor(allCategories)
final allCategoriesProvider = AutoDisposeFutureProvider<List<CategoryModel>>.internal(
  allCategories,
  name: r'allCategoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$allCategoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllCategoriesRef = AutoDisposeFutureProviderRef<List<CategoryModel>>;

String _$selectedCategoryHash() => r'7407909c73062a02a8cd4a01d12df126bab06bb6';

/// See also [SelectedCategory].
@ProviderFor(SelectedCategory)
final selectedCategoryProvider = AutoDisposeNotifierProvider<SelectedCategory, CategoryModel?>.internal(
  SelectedCategory.new,
  name: r'selectedCategoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$selectedCategoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedCategory = AutoDisposeNotifier<CategoryModel?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
