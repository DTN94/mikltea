// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$allProductsHash() => r'3f0e89692ff8fccd8cf56691f4c65173cb2a52ca';

/// See also [allProducts].
@ProviderFor(allProducts)
final allProductsProvider = AutoDisposeFutureProvider<List<ProductModel>>.internal(
  allProducts,
  name: r'allProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$allProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllProductsRef = AutoDisposeFutureProviderRef<List<ProductModel>>;
String _$getProductHash() => r'ee55700477cd913acca20971631549ee9daba251';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef GetProductRef = AutoDisposeFutureProviderRef<ProductModel>;

/// See also [getProduct].
@ProviderFor(getProduct)
const getProductProvider = GetProductFamily();

/// See also [getProduct].
class GetProductFamily extends Family<AsyncValue<ProductModel>> {
  /// See also [getProduct].
  const GetProductFamily();

  /// See also [getProduct].
  GetProductProvider call(
    int id,
  ) {
    return GetProductProvider(
      id,
    );
  }

  @override
  GetProductProvider getProviderOverride(
    covariant GetProductProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'getProductProvider';
}

/// See also [getProduct].
class GetProductProvider extends AutoDisposeFutureProvider<ProductModel> {
  /// See also [getProduct].
  GetProductProvider(
    this.id,
  ) : super.internal(
          (ref) => getProduct(
            ref,
            id,
          ),
          from: getProductProvider,
          name: r'getProductProvider',
          debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$getProductHash,
          dependencies: GetProductFamily._dependencies,
          allTransitiveDependencies: GetProductFamily._allTransitiveDependencies,
        );

  final int id;

  @override
  bool operator ==(Object other) {
    return other is GetProductProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
