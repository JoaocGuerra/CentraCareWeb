import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../store/master_page/tabs/employees_tab/edit_employees/edit_employees_store.dart';
import '../card/employees_card.dart';

class EmployeesList extends StatelessWidget {
  final listEmployees;
  final EditEmployeesStore editEmployeesStore =  GetIt.I<EditEmployeesStore>();

  EmployeesList({Key? key, this.listEmployees}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: editEmployeesStore.loading?
      const Center(
        child: CircularProgressIndicator(),
      )
        :
      ListView.builder(
        itemCount: listEmployees.length,
        itemBuilder: (context, index){
          return EmployeesCard(data: listEmployees[index],);
        },
      ),
    );
  }
}
