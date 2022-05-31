import 'package:flutter/material.dart';

import '../card/employees_card.dart';

class EmployeesList extends StatelessWidget {
  final listEmployees;

  const EmployeesList({Key? key, this.listEmployees}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: ListView.builder(
        itemCount: listEmployees.length,
        itemBuilder: (context, index){
          return EmployeesCard(data: listEmployees[index],);
        },
      ),
    );
  }
}
