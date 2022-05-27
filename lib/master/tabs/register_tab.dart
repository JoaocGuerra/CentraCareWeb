import 'package:brasil_fields/brasil_fields.dart';
import 'package:centralcareweb/components/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RegisterTab extends StatefulWidget {
  const RegisterTab({Key? key}) : super(key: key);

  @override
  _RegisterTab createState() => _RegisterTab();
}


enum Menu { MASCULINO, FEMININO, OUTRO }
enum Function { SECRETARIA, MEDICO }

class _RegisterTab extends State<RegisterTab> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _numberController = TextEditingController();
  final _cpfController = TextEditingController();
  final _emailController = TextEditingController();
  final _birthdayController = TextEditingController();
  var _gender = "Gênero";
  var _function = "Função";
  final Color _genderColor = Colors.white.withOpacity(0.9);
  final Color _functionColor = Colors.white.withOpacity(0.9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height*0.125, 20, MediaQuery.of(context).size.height*0.125),
              child: Observer(builder: (_) {
                return Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          width: (MediaQuery.of(context).size.width) / 1.8,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Cadastro de Funcionário",
                                style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.blueAccent.withOpacity(0.7),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 80),
                        Column(
                          children: [
                            SizedBox(
                              width: (MediaQuery.of(context).size.width) / 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: CustomTextFormField(
                                      list: const [],
                                      textEditingController: _nameController,
                                      isPasswordType: false,
                                      icon: Icons.person,
                                      text: 'Nome',
                                      textInputType: TextInputType.text,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Email Inválido";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: CustomTextFormField(
                                      list: const [],
                                      textEditingController: _lastNameController,
                                      isPasswordType: false,
                                      icon: Icons.person,
                                      text: 'Sobrenome',
                                      textInputType: TextInputType.text,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Email Inválido";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: (MediaQuery.of(context).size.width) / 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: CustomTextFormField(
                                      list: const [],
                                      textEditingController: _emailController,
                                      isPasswordType: false,
                                      icon: Icons.mail,
                                      text: 'Email',
                                      textInputType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Email Inválido";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: CustomTextFormField(
                                      list: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        CpfInputFormatter()
                                      ],
                                      textEditingController: _cpfController,
                                      isPasswordType: false,
                                      icon: Icons.numbers,
                                      text: 'CPF',
                                      textInputType: TextInputType.number,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "CPF Inválido";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: (MediaQuery.of(context).size.width) / 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: CustomTextFormField(
                                      textEditingController: _birthdayController,
                                      isPasswordType: false,
                                      icon: Icons.calendar_today,
                                      text: 'Data de Nascimento',
                                      textInputType: TextInputType.datetime,
                                      validator: (value) {
                                        if (value == null ||
                                            value.isEmpty ||
                                            value.length != 10) {
                                          return "Data Inválida. Formtato: DD/MM/AAAA";
                                        } else {
                                          int _dia = int.parse(value[0] + value[1]);
                                          int _mes = int.parse(value[3] + value[4]);
                                          int _ano = int.parse(value[6] +
                                              value[7] +
                                              value[8] +
                                              value[9]);
                                          if (!((_dia.compareTo(0) == 1 &&
                                              _dia.compareTo(32) == -1) &&
                                              (_mes.compareTo(0) == 1 &&
                                                  _mes.compareTo(13) == -1) &&
                                              (_ano.compareTo(DateTime.now().year) !=
                                                  1 &&
                                                  _ano.compareTo(1900) != -1))) {
                                            return "Data Inválida.";
                                          }
                                        }
                                        return null;
                                      },
                                      list: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        DataInputFormatter()
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Column(children: [
                                      Container(
                                        padding:
                                        const EdgeInsets.only(right: 10, left: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.blueAccent.withOpacity(0.7),
                                            borderRadius: BorderRadius.circular(90)),
                                        height: 51,
                                        child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    _gender,
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color: _genderColor),
                                                  ),
                                                ],
                                              ),
                                              PopupMenuButton<Menu>(
                                                  icon: const Icon(
                                                    Icons.arrow_drop_down,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),

                                                  onSelected: (Menu item) {
                                                    setState(() {
                                                      _gender = item.name;
                                                    });
                                                  },
                                                  itemBuilder: (BuildContext context) =>
                                                  <PopupMenuEntry<Menu>>[
                                                    const PopupMenuItem<Menu>(
                                                      value: Menu.MASCULINO,
                                                      child: Text('MASCULINO'),
                                                    ),
                                                    const PopupMenuItem<Menu>(
                                                      value: Menu.FEMININO,
                                                      child: Text('FEMININO'),
                                                    ),
                                                    const PopupMenuItem<Menu>(
                                                      value: Menu.OUTRO,
                                                      child: Text('OUTRO'),
                                                    ),
                                                  ])
                                            ]),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: (MediaQuery.of(context).size.width) / 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(children: [
                                      Container(
                                        padding:
                                        const EdgeInsets.only(right: 10, left: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.blueAccent.withOpacity(0.7),
                                            borderRadius: BorderRadius.circular(90)),
                                        height: 51,
                                        child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    _function,
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color: _functionColor),
                                                  ),
                                                ],
                                              ),
                                              PopupMenuButton<Function>(
                                                  icon: const Icon(
                                                    Icons.arrow_drop_down,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),

                                                  onSelected: (Function item) {
                                                    setState(() {
                                                      _function = item.name;
                                                    });
                                                  },
                                                  itemBuilder: (BuildContext context) =>
                                                  <PopupMenuEntry<Function>>[
                                                    const PopupMenuItem<Function>(
                                                      value: Function.SECRETARIA,
                                                      child: Text('SECRETÁRIA'),
                                                    ),
                                                    const PopupMenuItem<Function>(
                                                      value: Function.MEDICO,
                                                      child: Text('MÉDICO'),
                                                    ),
                                                  ])
                                            ]),
                                      ),
                                    ]),
                                  ),
                                  const Visibility(
                                      visible: true,
                                      child: SizedBox(width: 20)),
                                  Visibility(
                                    visible: true,
                                    child: Expanded(
                                      child: CustomTextFormField(
                                        list: const [],
                                        textEditingController: _emailController,
                                        isPasswordType: false,
                                        icon: Icons.wallet_travel,
                                        text: 'Especialidade',
                                        textInputType: TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Email Inválido";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 80),
                        Center(
                          child: Container(
                            height: 50,
                            width: 300 ,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(25)),
                            child: TextButton(
                              onPressed: () {},
                              child: const Center(
                                child: Text(
                                  "Clique aqui",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                );
              })),
        ),
      ),
    );
  }
}
