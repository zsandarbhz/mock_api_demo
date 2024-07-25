// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DashboardStore on _DashboardStore, Store {
  late final _$currentIndexAtom =
      Atom(name: '_DashboardStore.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$categoryIdAtom =
      Atom(name: '_DashboardStore.categoryId', context: context);

  @override
  int get categoryId {
    _$categoryIdAtom.reportRead();
    return super.categoryId;
  }

  @override
  set categoryId(int value) {
    _$categoryIdAtom.reportWrite(value, super.categoryId, () {
      super.categoryId = value;
    });
  }

  late final _$_DashboardStoreActionController =
      ActionController(name: '_DashboardStore', context: context);

  @override
  dynamic setCurrentIndex(int ind, int? catId) {
    final _$actionInfo = _$_DashboardStoreActionController.startAction(
        name: '_DashboardStore.setCurrentIndex');
    try {
      return super.setCurrentIndex(ind, catId);
    } finally {
      _$_DashboardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
categoryId: ${categoryId}
    ''';
  }
}
