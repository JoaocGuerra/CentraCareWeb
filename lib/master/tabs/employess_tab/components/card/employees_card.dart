import 'package:centralcareweb/store/master_page/tabs/employees_tab/employees_tab_store.dart';
import 'package:centralcareweb/store/show_pages/show_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class EmployeesCard extends StatelessWidget {
  final ShowStore showStore =  GetIt.I<ShowStore>();
  final EmployeesTabStore employeesTabStore =  GetIt.I<EmployeesTabStore>();
  final dynamic data;

  EmployeesCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String titleCard = data['nome']+" "+data['sobrenome']+" - "+data['funcao'];
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
                    employeesTabStore.fetchDataEmployee(data.id);
                    showStore.setShowInEmployeesRegister(2);
                  },
                  icon: Icon(Icons.edit, color: Colors.white,)
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
        // child: TextButton(
        //   style: ButtonStyle(
        //     padding: MaterialStateProperty.all<EdgeInsets>(
        //       const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
        //     ),
        //   ),
        //   onPressed: () {
        //     // Navigator.pushReplacement(
        //     //     context,
        //     //     MaterialPageRoute(
        //     //         builder: (context) => UAppointmentPage(
        //     //           codigoPaciente: data['codigo_paciente'],
        //     //           codigoMedico: data['codigo_medico'],
        //     //           diaMesAno: data['dia_mes_ano'],
        //     //         )));
        //   },
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Expanded(
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text(
        //               titleCard,
        //               style: const TextStyle(
        //                 color: Colors.white,
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 16,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}