import 'package:centralcareweb/store/master_page/tabs/employees_tab/edit_employees/edit_employees_store.dart';
import 'package:centralcareweb/store/master_page/tabs/employees_tab/employees_tab_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ButtonUpdateEmployee extends StatelessWidget {
  final EditEmployeesStore editEmployeesStore =  GetIt.I<EditEmployeesStore>();

  ButtonUpdateEmployee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: editEmployeesStore.maxWidthBoxConstrains),
      child: Container(
        height: 50,
        width: 300 ,
        decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.7),
            borderRadius: BorderRadius.circular(25)),
        child: TextButton(
          onPressed: () {
            editEmployeesStore.updateEmployee();
          },
          child: const Center(
            child: Text(
              "Atualizar Dados",
              style: TextStyle(
                  color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}