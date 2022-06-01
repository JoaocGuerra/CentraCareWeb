import 'package:centralcareweb/master/tabs/employess_tab/components/list/employees_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../store/master_page/tabs/employees_tab/employees_tab_store.dart';
import 'components/text/employee_text.dart';

class EmployeesTab extends StatelessWidget {
  final EmployeesTabStore employeesTabStore =  GetIt.I<EmployeesTabStore>();

  EmployeesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    employeesTabStore.fetchEmployees();
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(100,50,100,50),
                child: Observer(
                    builder: (_) {
                      return employeesTabStore.loading ?
                      const CircularProgressIndicator()
                        :
                      Column(
                        children: [
                          EmployeeText(),
                          const SizedBox(height: 40,),
                          EmployeesList(listEmployees: employeesTabStore.listEmployees,)
                        ],
                      );
                }
              )
            ),
          ),
        ),
      ),
    );
  }
}
