import 'package:centralcareweb/store/show_pages/show_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../utils/utils_datetime.dart';
import '../new_date_doctor/details_date_doctor/details_date_doctor_store.dart';
import 'details_appointments/details_appointments_doctor_store.dart';

part 'appointments_doctor_store.g.dart';

class AppointmentsDoctorStore = _AppointmentsDoctorStore with _$AppointmentsDoctorStore;

abstract class _AppointmentsDoctorStore with Store {

  final DetailsAppointmentsDoctorStore detailsAppointmentsDoctorStore =  GetIt.I<DetailsAppointmentsDoctorStore>();
  final DetailsDateDoctorStore detailsDateDoctorStore =  GetIt.I<DetailsDateDoctorStore>();
  final ShowStore showHomeStore =  GetIt.I<ShowStore>();

  @observable
  bool loading = false;

  @observable
  List<String> doctorNames = [];

  @observable
  Map<String, dynamic> dataAppointments = Map<String, dynamic>();

  @action
  Future<void> fetchAppointmentsDoctors() async {

    FirebaseFirestore.instance.collection('funcionarios').snapshots().listen((snapshot) async {

      loading = true;
      doctorNames = [];
      int lengthEmployee = snapshot.size;

      for(int i=0; i<lengthEmployee; i++){
        if(snapshot.docs[i].get('funcao') == "medico"){
          String name = snapshot.docs[i].get('nome') + " " + snapshot.docs[i].get('sobrenome')+" - "+snapshot.docs[i].get('especialidade');
          doctorNames.add(name);
          snapshot.docs[i].reference.collection('atendimentos').snapshots().listen((snapshotAppointment) {
            loading = true;
            List<TreeNode> listTreeNodeDate = [];
            int lengthAppointments = snapshotAppointment.size;

            for(int j=0; j<lengthAppointments;j++){

              List<TreeNode> listTreeNodePatients = [];
              if(snapshotAppointment.docs[j].get('disponivel')){
                List<dynamic> patients = snapshotAppointment.docs[j].get('pacientes');
                int lengthPatients = patients.length;

                for(int k=0; k<lengthPatients;k++){
                  if(patients[k]!=""){
                    listTreeNodePatients.add(
                        TreeNode(
                            content: TextButton(
                              child: Text(patients[k],overflow: TextOverflow.ellipsis,),
                              onPressed: () {
                                showHomeStore.setShowInHomeReceptionist(2);
                                detailsAppointmentsDoctorStore.codigoPaciente = patients[k];
                                detailsAppointmentsDoctorStore.codigoMedico =  snapshot.docs[i].id;
                                detailsAppointmentsDoctorStore.diaMesAno = snapshotAppointment.docs[j].id;
                              },
                            )
                        )
                    );
                  }
                }
                listTreeNodeDate.add(
                    TreeNode(
                      content: TextButton(
                        onPressed: () {
                          showHomeStore.setShowInHomeReceptionist(5);
                          detailsDateDoctorStore.codigoMedico = snapshot.docs[i].id;
                          detailsDateDoctorStore.diaMesAno = snapshotAppointment.docs[j].id;
                        },
                        child: Text(UtilsDateTime.convertFormatDate(snapshotAppointment.docs[j].id)),
                      ),
                      children: listTreeNodePatients,
                    )
                );
              }

            }
            dataAppointments[name] = listTreeNodeDate;
            loading = false;
          });
        }
      }
      loading = false;
    });
  }
}