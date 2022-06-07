// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_date_doctor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailsDateDoctorStore on _DetailsDateDoctorStore, Store {
  late final _$loadingAtom =
      Atom(name: '_DetailsDateDoctorStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$dateDetailsModelAtom =
      Atom(name: '_DetailsDateDoctorStore.dateDetailsModel', context: context);

  @override
  DateDetailsModel? get dateDetailsModel {
    _$dateDetailsModelAtom.reportRead();
    return super.dateDetailsModel;
  }

  @override
  set dateDetailsModel(DateDetailsModel? value) {
    _$dateDetailsModelAtom.reportWrite(value, super.dateDetailsModel, () {
      super.dateDetailsModel = value;
    });
  }

  late final _$fetchDetailsDateAsyncAction =
      AsyncAction('_DetailsDateDoctorStore.fetchDetailsDate', context: context);

  @override
  Future<void> fetchDetailsDate() {
    return _$fetchDetailsDateAsyncAction.run(() => super.fetchDetailsDate());
  }

  late final _$deselectDateAsyncAction =
      AsyncAction('_DetailsDateDoctorStore.deselectDate', context: context);

  @override
  Future<void> deselectDate() {
    return _$deselectDateAsyncAction.run(() => super.deselectDate());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
dateDetailsModel: ${dateDetailsModel}
    ''';
  }
}
