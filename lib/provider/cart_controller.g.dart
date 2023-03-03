// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$allCartsHash() => r'079817dd52e1d1713546cd0efc514829fa2cd8ee';

/// See also [allCarts].
@ProviderFor(allCarts)
final allCartsProvider = AutoDisposeFutureProvider<List<CartModel>>.internal(
  allCarts,
  name: r'allCartsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allCartsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllCartsRef = AutoDisposeFutureProviderRef<List<CartModel>>;
String _$addToCartHash() => r'6eaa02c0b893fc48993971c114352a35db3a44d4';

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

typedef AddToCartRef = AutoDisposeFutureProviderRef<void>;

/// See also [addToCart].
@ProviderFor(addToCart)
const addToCartProvider = AddToCartFamily();

/// See also [addToCart].
class AddToCartFamily extends Family<AsyncValue<void>> {
  /// See also [addToCart].
  const AddToCartFamily();

  /// See also [addToCart].
  AddToCartProvider call(
    CartModel cart,
  ) {
    return AddToCartProvider(
      cart,
    );
  }

  @override
  AddToCartProvider getProviderOverride(
    covariant AddToCartProvider provider,
  ) {
    return call(
      provider.cart,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'addToCartProvider';
}

/// See also [addToCart].
class AddToCartProvider extends AutoDisposeFutureProvider<void> {
  /// See also [addToCart].
  AddToCartProvider(
    this.cart,
  ) : super.internal(
          (ref) => addToCart(
            ref,
            cart,
          ),
          from: addToCartProvider,
          name: r'addToCartProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addToCartHash,
          dependencies: AddToCartFamily._dependencies,
          allTransitiveDependencies: AddToCartFamily._allTransitiveDependencies,
        );

  final CartModel cart;

  @override
  bool operator ==(Object other) {
    return other is AddToCartProvider && other.cart == cart;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cart.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$deleteFromCartHash() => r'17742fa1b14824fe73f86b5bd55fc2a811e2e691';
typedef DeleteFromCartRef = AutoDisposeFutureProviderRef<void>;

/// See also [deleteFromCart].
@ProviderFor(deleteFromCart)
const deleteFromCartProvider = DeleteFromCartFamily();

/// See also [deleteFromCart].
class DeleteFromCartFamily extends Family<AsyncValue<void>> {
  /// See also [deleteFromCart].
  const DeleteFromCartFamily();

  /// See also [deleteFromCart].
  DeleteFromCartProvider call(
    CartModel cart,
  ) {
    return DeleteFromCartProvider(
      cart,
    );
  }

  @override
  DeleteFromCartProvider getProviderOverride(
    covariant DeleteFromCartProvider provider,
  ) {
    return call(
      provider.cart,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteFromCartProvider';
}

/// See also [deleteFromCart].
class DeleteFromCartProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteFromCart].
  DeleteFromCartProvider(
    this.cart,
  ) : super.internal(
          (ref) => deleteFromCart(
            ref,
            cart,
          ),
          from: deleteFromCartProvider,
          name: r'deleteFromCartProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteFromCartHash,
          dependencies: DeleteFromCartFamily._dependencies,
          allTransitiveDependencies:
              DeleteFromCartFamily._allTransitiveDependencies,
        );

  final CartModel cart;

  @override
  bool operator ==(Object other) {
    return other is DeleteFromCartProvider && other.cart == cart;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cart.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
