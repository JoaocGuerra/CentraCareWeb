import 'package:flutter/material.dart';

class EmployeesCard extends StatelessWidget {
  final dynamic data;

  const EmployeesCard({Key? key, required this.data}) : super(key: key);

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