import 'package:centralcareweb/store/medico_page/html_editor_store.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class EditorText extends StatelessWidget {
  EditorText({Key? key}) : super(key: key);
  final HtmlEditorStore htmlEditorStore =  GetIt.I<HtmlEditorStore>();

  @override
  Widget build(BuildContext context) {
    return HtmlEditor(
      controller: htmlEditorStore.htmlEditorController,
      htmlEditorOptions: const HtmlEditorOptions(
        hint: '',
        shouldEnsureVisible: false,
      ),
      htmlToolbarOptions: HtmlToolbarOptions(
        defaultToolbarButtons: const [
          StyleButtons(),
          FontSettingButtons(fontSizeUnit: false),
          FontButtons(clearAll: false),
          ListButtons(listStyles: false),
          ParagraphButtons(
              textDirection: false, lineHeight: false, caseConverter: false),
          InsertButtons(
              link: false,
              picture: false,
              video: false,
              audio: false,
              table: false,
              hr: true,
              otherFile: false),
        ],
        toolbarPosition: ToolbarPosition.aboveEditor, //by default
        toolbarType: ToolbarType.nativeGrid, //by default
        onButtonPressed:
            (ButtonType type, bool? status, Function? updateStatus) {
          return true;
        },
        onDropdownChanged: (DropdownType type, dynamic changed,
            Function(dynamic)? updateSelectedItem) {
          return true;
        },
        mediaLinkInsertInterceptor:
            (String url, InsertFileType type) {
          return true;
        },
        mediaUploadInterceptor:
            (PlatformFile file, InsertFileType type) async {
          return true;
        },
      ),
      otherOptions: OtherOptions(height: 400),
      plugins: [
        SummernoteAtMention(
            getSuggestionsMobile: (String value) {
              var mentions = <String>['test1', 'test2', 'test3'];
              return mentions
                  .where((element) => element.contains(value))
                  .toList();
            },
            mentionsWeb: ['test1', 'test2', 'test3'],
            onSelect: (String value) {

            }),
      ],
    );
  }
}
