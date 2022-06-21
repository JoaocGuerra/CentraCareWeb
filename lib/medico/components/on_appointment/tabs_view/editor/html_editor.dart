import 'package:centralcareweb/store/medico_page/next_patients/patient_on_appointment/patient_on_appointment_store.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class EditorText extends StatelessWidget {
  EditorText({Key? key}) : super(key: key);
  final PatientOnAppointmentStore patientOnAppointmentStore =  GetIt.I<PatientOnAppointmentStore>();

  @override
  Widget build(BuildContext context) {
    return HtmlEditor(
      controller: patientOnAppointmentStore.htmlEditorController,
      htmlEditorOptions: const HtmlEditorOptions(
        hint: '',
        shouldEnsureVisible: false,
      ),
      htmlToolbarOptions: const HtmlToolbarOptions(
        defaultToolbarButtons: [
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
      ),
      otherOptions: OtherOptions(height: 400),
    );
  }
}
