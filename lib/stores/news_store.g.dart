// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsStore on _NewsStoreBase, Store {
  final _$_newsResultAtom = Atom(name: '_NewsStoreBase._newsResult');

  @override
  Result<bool> get _newsResult {
    _$_newsResultAtom.reportRead();
    return super._newsResult;
  }

  @override
  set _newsResult(Result<bool> value) {
    _$_newsResultAtom.reportWrite(value, super._newsResult, () {
      super._newsResult = value;
    });
  }

  final _$_newsResponseAtom = Atom(name: '_NewsStoreBase._newsResponse');

  @override
  NewsResponse get _newsResponse {
    _$_newsResponseAtom.reportRead();
    return super._newsResponse;
  }

  @override
  set _newsResponse(NewsResponse value) {
    _$_newsResponseAtom.reportWrite(value, super._newsResponse, () {
      super._newsResponse = value;
    });
  }

  final _$_syncDateAtom = Atom(name: '_NewsStoreBase._syncDate');

  @override
  DateTime get _syncDate {
    _$_syncDateAtom.reportRead();
    return super._syncDate;
  }

  @override
  set _syncDate(DateTime value) {
    _$_syncDateAtom.reportWrite(value, super._syncDate, () {
      super._syncDate = value;
    });
  }

  final _$_updateNewsAsyncAction = AsyncAction('_NewsStoreBase._updateNews');

  @override
  Future<void> _updateNews() {
    return _$_updateNewsAsyncAction.run(() => super._updateNews());
  }

  final _$_NewsStoreBaseActionController =
      ActionController(name: '_NewsStoreBase');

  @override
  void refresh() {
    final _$actionInfo = _$_NewsStoreBaseActionController.startAction(
        name: '_NewsStoreBase.refresh');
    try {
      return super.refresh();
    } finally {
      _$_NewsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
