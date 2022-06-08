import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:mobx/mobx.dart';

part 'html_editor_store.g.dart';

class HtmlEditorStore = _HtmlEditorStore with _$HtmlEditorStore;

abstract class _HtmlEditorStore with Store {

  @observable
  HtmlEditorController htmlEditorController = HtmlEditorController();

}