// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductDetailStore on _ProductDetailStore, Store {
  late final _$subLoaderShowAtom =
      Atom(name: '_ProductDetailStore.subLoaderShow', context: context);

  @override
  bool get subLoaderShow {
    _$subLoaderShowAtom.reportRead();
    return super.subLoaderShow;
  }

  @override
  set subLoaderShow(bool value) {
    _$subLoaderShowAtom.reportWrite(value, super.subLoaderShow, () {
      super.subLoaderShow = value;
    });
  }

  late final _$productCountAtom =
      Atom(name: '_ProductDetailStore.productCount', context: context);

  @override
  int get productCount {
    _$productCountAtom.reportRead();
    return super.productCount;
  }

  @override
  set productCount(int value) {
    _$productCountAtom.reportWrite(value, super.productCount, () {
      super.productCount = value;
    });
  }

  late final _$loadInitDataAsyncAction =
      AsyncAction('_ProductDetailStore.loadInitData', context: context);

  @override
  Future loadInitData(ProductData productData) {
    return _$loadInitDataAsyncAction.run(() => super.loadInitData(productData));
  }

  late final _$_ProductDetailStoreActionController =
      ActionController(name: '_ProductDetailStore', context: context);

  @override
  dynamic addToCart() {
    final _$actionInfo = _$_ProductDetailStoreActionController.startAction(
        name: '_ProductDetailStore.addToCart');
    try {
      return super.addToCart();
    } finally {
      _$_ProductDetailStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeToCart() {
    final _$actionInfo = _$_ProductDetailStoreActionController.startAction(
        name: '_ProductDetailStore.removeToCart');
    try {
      return super.removeToCart();
    } finally {
      _$_ProductDetailStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
subLoaderShow: ${subLoaderShow},
productCount: ${productCount}
    ''';
  }
}
