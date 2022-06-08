// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'html_editor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HtmlEditorStore on _HtmlEditorStore, Store {
  late final _$htmlEditorControllerAtom =
      Atom(name: '_HtmlEditorStore.htmlEditorController', context: context);

  @override
  HtmlEditorController get htmlEditorController {
    _$htmlEditorControllerAtom.reportRead();
    return super.htmlEditorController;
  }

  @override
  set htmlEditorController(HtmlEditorController value) {
    _$htmlEditorControllerAtom.reportWrite(value, super.htmlEditorController,
        () {
      super.htmlEditorController = value;
    });
  }

  @override
  String toString() {
    return '''
htmlEditorController: ${htmlEditorController}
    ''';
  }
}
