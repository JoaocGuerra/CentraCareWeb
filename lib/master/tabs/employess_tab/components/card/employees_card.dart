import 'package:centralcareweb/store/master_page/tabs/employees_tab/employees_tab_store.dart';
import 'package:centralcareweb/store/show_pages/show_store.dart';
import 'package:centralcareweb/utils/utils_string.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../store/master_page/tabs/employees_tab/edit_employees/edit_employees_store.dart';

class EmployeesCard extends StatelessWidget {
  final ShowStore showStore =  GetIt.I<ShowStore>();
  final EditEmployeesStore editEmployeesStore =  GetIt.I<EditEmployeesStore>();
  final dynamic data;

  EmployeesCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String titleCard = data['nome']+" "+data['sobrenome']+" - "+UtilsString.capitalize(data['funcao']);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
          child: Row(
            children: [
              IconButton(
                  onPressed: (){
                    editEmployeesStore.fetchDataEmployee(data.id);
                    showStore.setShowInEmployeesRegister(2);
                  },
                  icon: Icon(Icons.edit, color: Colors.white,)
              ),
              IconButton(
                  onPressed: (){
                    editEmployeesStore.deleteEmployee(data.id);
                  },
                  icon: Icon(Icons.delete, color: Colors.redAccent,)
              ),
              Text(
                titleCard,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}