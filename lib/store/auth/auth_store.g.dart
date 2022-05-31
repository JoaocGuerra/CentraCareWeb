// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStore, Store {
  late final _$userAtom = Atom(name: '_AuthStore.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$hasUserAtom = Atom(name: '_AuthStore.hasUser', context: context);

  @override
  bool get hasUser {
    _$hasUserAtom.reportRead();
    return super.hasUser;
  }

  @override
  set hasUser(bool value) {
    _$hasUserAtom.reportWrite(value, super.hasUser, () {
      super.hasUser = value;
    });
  }

  late final _$functionAtom =
      Atom(name: '_AuthStore.function', context: context);

  @override
  String get function {
    _$functionAtom.reportRead();
    return super.function;
  }

  @override
  set function(String value) {
    _$functionAtom.reportWrite(value, super.function, () {
      super.function = value;
    });
  }

  late final _$fetchUserAsyncAction =
      AsyncAction('_AuthStore.fetchUser', context: context);

  @override
  Future<void> fetchUser() {
    return _$fetchUserAsyncAction.run(() => super.fetchUser());
  }

  late final _$userSignOutAsyncAction =
      AsyncAction('_AuthStore.userSignOut', context: context);

  @override
  Future<void> userSignOut() {
    return _$userSignOutAsyncAction.run(() => super.userSignOut());
  }

  late final _$_AuthStoreActionController =
      ActionController(name: '_AuthStore', context: context);

  @override
  dynamic setUser(User user) {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.setUser');
    try {
      return super.setUser(user);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
hasUser: ${hasUser},
function: ${function}
    ''';
  }
}
