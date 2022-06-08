import 'package:centralcareweb/components/responsive_builder.dart';
import 'package:centralcareweb/medico/components/on_appointment/buttons/end_appointment_button.dart';
import 'package:centralcareweb/medico/components/on_appointment/texts/patient_felling.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../../../components/header_text.dart';
import '../../../constans/app_constants.dart';

class BuildOnAppointmentCard extends StatelessWidget {
  BuildOnAppointmentCard({Key? key}) : super(key: key);

  HtmlEditorController controller = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: kSpacing),
            Row(
              children: const [
                Expanded(child: HeaderText("Em Atendimento")),
                Icon(
                  EvaIcons.calendarOutline,
                )
              ],
            ),
            const SizedBox(
              height: kSpacing ,
            ),
            const PatientFelling(),
            const SizedBox(
              height: kSpacing,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(kSpacing),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  HtmlEditor(
                    controller: controller,
                    htmlEditorOptions: const HtmlEditorOptions(
                      hint: 'Your text here...',
                      shouldEnsureVisible: true,
                      //initialText: "<p>text content initial, if any</p>",
                    ),
                    htmlToolbarOptions: HtmlToolbarOptions(
                      toolbarPosition: ToolbarPosition.aboveEditor,
                      //by default
                      toolbarType: ToolbarType.nativeGrid,
                      //by default
                      onButtonPressed: (ButtonType type, bool? status,
                          Function? updateStatus) {
                        print(
                            "button '${describeEnum(type)}' pressed, the current selected status is $status");
                        return true;
                      },
                      onDropdownChanged: (DropdownType type, dynamic changed,
                          Function(dynamic)? updateSelectedItem) {
                        print(
                            "dropdown '${describeEnum(type)}' changed to $changed");
                        return true;
                      },
                      mediaLinkInsertInterceptor:
                          (String url, InsertFileType type) {
                        print(url);
                        return true;
                      },
                      mediaUploadInterceptor:
                          (PlatformFile file, InsertFileType type) async {
                        print(file.name); //filename
                        print(file.size); //size in bytes
                        print(file.extension); //file extension (eg jpeg or mp4)
                        return true;
                      },
                    ),
                    otherOptions: OtherOptions(height: 300),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: kSpacing,
                  ),
                  const EndAppointmentButton()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isMobile(context) {
    if (ResponsiveBuilder.isMobile(context)) return true;
    return false;
  }
}
