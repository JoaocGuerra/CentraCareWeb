import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../store/master_page/tabs/employees_tab/employees_tab_store.dart';
import '../../../../store/show_pages/show_store.dart';
import 'form_edit/form_edit.dart';

class EditEmployees extends StatelessWidget {
  final EmployeesTabStore employeesTabStore =  GetIt.I<EmployeesTabStore>();
  final ShowStore showStore =  GetIt.I<ShowStore>();

  EditEmployees({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    employeesTabStore.fetchEmployees();
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: (){
            showStore.setShowInEmployeesRegister(1);
          },
        ),
        title: const Text("Editar funcionário",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(100,50,100,50),
                child: FormEditEmployee(),
            ),
          ),
        ),
      ),
    );
  }
}