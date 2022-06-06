import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:group_button/group_button.dart';
import 'package:searchfield/searchfield.dart';

import '../../../../../store/recepcionista_page/new_appointment/especialidades_store.dart';
import '../../../../../store/recepcionista_page/new_appointment/marcar_consulta_store.dart';
import '../../../../../store/recepcionista_page/new_appointment/users_store.dart';

class SelectUsers extends StatelessWidget {
  final MarcarConsultaStore marcarConsultaStore = GetIt.I<MarcarConsultaStore>();
  final UsersStore usersStore =  GetIt.I<UsersStore>();

  SelectUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    usersStore.fetchUsers();
    return Observer(
      builder: (_){
        return ConstrainedBox(
          constraints: BoxConstraints(maxWidth: marcarConsultaStore.maxWidth),
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
                        usersStore.listUser.map((e) => SearchFieldListItem(e)).toList(),
                        textInputAction: TextInputAction.next,
                        controller: marcarConsultaStore.userController,
                        hint: 'Selecione o Paciente',
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