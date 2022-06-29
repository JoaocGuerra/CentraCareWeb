import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import '../../store/recepcionista_page/register_patient/register_patient_store.dart';

class InsertPatientRepository{

  final _db = FirebaseFirestore.instance;
  final RegisterPatientStore registerPatientStore =  GetIt.I<RegisterPatientStore>();

  Future<void> insertPatient()async {

    FirebaseApp app = await Firebase.initializeApp(
        name: registerPatientStore.phoneController.text+registerPatientStore.birthdayController.text, options: Firebase.app().options);
    UserCredential result = await FirebaseAuth.instanceFor(app: app)
        .createUserWithEmailAndPassword(
        email: registerPatientStore.emailController.text.trim(),
        password: registerPatientStore.passwordController.text.trim());

    app.delete();

    Map<String, dynamic> mapInsert = <String, dynamic>{};

    String genero = registerPatientStore.gender.toLowerCase();

    mapInsert["email"] = registerPatientStore.emailController.text;
    mapInsert["nome"] = registerPatientStore.nameController.text;
    mapInsert["sobrenome"] = registerPatientStore.lastNameController.text;
    mapInsert["cpf"] = registerPatientStore.cpfController.text;
    mapInsert["sexo"] = genero;
    mapInsert["telefone"] = registerPatientStore.phoneController.text;
    mapInsert["data_nascimento"] = registerPatientStore.birthdayController.text;
    mapInsert["id"] = result.user?.uid;

    if(genero == "masculino") {
      mapInsert['foto'] = "http://cdn-icons-png.flaticon.com/512/1373/1373255.png";
    } else if (genero == "feminino") {
      mapInsert['foto'] = "https://cdn.icon-icons.com/icons2/1999/PNG/512/avatar_people_person_profile_user_woman_icon_123359.png";
    } else {
      mapInsert['foto'] = "https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Person_icon_%28the_Noun_Project_2817719%29.svg/1200px-Person_icon_%28the_Noun_Project_2817719%29.svg.png";
    }

    await _db.collection('pacientes').doc(result.user?.uid).set(mapInsert);

  }


}