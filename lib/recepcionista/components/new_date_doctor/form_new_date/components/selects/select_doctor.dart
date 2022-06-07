import 'package:centralcareweb/store/recepcionista_page/new_date_doctor/doctor_store.dart';
import 'package:centralcareweb/store/recepcionista_page/new_date_doctor/new_date_doctor_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:searchfield/searchfield.dart';

class SelectDoctorNewDate extends StatelessWidget {
  final NewDateDoctorStore newDateDoctorStore =  GetIt.I<NewDateDoctorStore>();
  final DoctorsStoreNewDate doctorsStoreNewDate =  GetIt.I<DoctorsStoreNewDate>();

  SelectDoctorNewDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    doctorsStoreNewDate.fetchDoctors();
    return Observer(
      builder: (_){
        return ConstrainedBox(
          constraints: BoxConstraints(maxWidth: newDateDoctorStore.maxWidth),
          child: Column(
            children: [
              SizedBox(
                height: 135,
                child: ListView(
                  children: [
                    SearchField(
                      suggestionState: Suggestion.expand,
                      suggestionAction: SuggestionAction.next,
                      suggestions:
                      doctorsStoreNewDate.doctorNames.map((e) => SearchFieldListItem(e)).toList(),
                      textInputAction: TextInputAction.next,
                      controller: newDateDoctorStore.doctorController,
                      hint: 'Selecione o Médico',
                      searchInputDecoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                      maxSuggestionsInViewPort: 2,
                      itemHeight: 45,
                      onSuggestionTap: (x) {},
                    ),
                  ],
                ),
              ),
              const Divider(height: 5)
            ],
          ),
        );
      },
    );
  }
}