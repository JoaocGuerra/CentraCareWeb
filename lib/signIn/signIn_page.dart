import 'package:centralcareweb/master/master_page.dart';
import 'package:flutter/material.dart';
import '../components/custom_text.dart';

class SignInPage extends StatefulWidget {
  static const routeName = '/auth';

  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // Future singIn(BuildContext context) async {
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: textControllerEmail.text.trim(),
  //       password: textControllerPassword.text.trim(),
  //     );
  //   } catch (e) {
  //     print(e.toString());
  //     const snackBar = SnackBar(
  //       content: CustomText(text: 'Email ou senha incorreto.'),
  //       backgroundColor: Colors.red,
  //     );
  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //   }
  // }

  @override
  void initState() {
    textControllerEmail = TextEditingController();
    textControllerPassword = TextEditingController();
    textControllerEmail.text = '';
    textControllerPassword.text = '';
    textFocusNodeEmail = FocusNode();
    textFocusNodePassword = FocusNode();
    super.initState();
  }

  late TextEditingController textControllerEmail;
  late FocusNode textFocusNodeEmail;
  bool _isEditingEmail = false;

  late TextEditingController textControllerPassword;
  late FocusNode textFocusNodePassword;
  bool _isEditingPassword = false;
  bool _isLoggingIn = false;

  String? loginStatus;
  Color loginStringColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    String? _validateEmail(String value) {
      value = value.trim();

      if (value.isNotEmpty) {
        if (!value.contains(RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
          return 'Digite um endereço de e-mail válido.';
        }
      }
      return null;
    }

    String? _validatePassword(String value) {
      value = value.trim();

      if (value.isNotEmpty) {
        if (value.length < 6) {
          return 'O tamanho da senha deve ser maior que 6.';
        }
      }
      return null;
    }

    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  width: 325,
                  height: 325,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            CustomText(
                              text: 'Central Care',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              corText: Colors.blueAccent,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20,
                        ),
                        child: TextField(
                          cursorColor: Colors.red,
                          focusNode: textFocusNodeEmail,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          controller: textControllerEmail,
                          autofocus: false,
                          onChanged: (value) {
                            setState(() {
                              _isEditingEmail = true;
                            });
                          },
                          onSubmitted: (value) {
                            textFocusNodeEmail.unfocus();
                            FocusScope.of(context)
                                .requestFocus(textFocusNodePassword);
                          },
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.blueGrey[800]!,
                                width: 3,
                              ),
                            ),
                            filled: true,
                            hintStyle: TextStyle(
                              color: Colors.blueGrey[300],
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 2),
                            ),
                            hintText: "Email",
                            fillColor: Colors.white,
                            errorText: _isEditingEmail
                                ? _validateEmail(textControllerEmail.text)
                                : null,
                            errorStyle: const TextStyle(
                              fontSize: 12,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20,
                        ),
                        child: TextField(
                          cursorColor: Colors.red,
                          focusNode: textFocusNodePassword,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          controller: textControllerPassword,
                          obscureText: true,
                          autofocus: false,
                          onChanged: (value) {
                            setState(() {
                              _isEditingPassword = true;
                            });
                          },
                          onSubmitted: (value) {
                            textFocusNodePassword.unfocus();
                            FocusScope.of(context)
                                .requestFocus(textFocusNodePassword);
                          },
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 2),
                            ),
                            prefixIcon: const Icon(
                              Icons.lock_sharp,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.blueGrey[800]!,
                                width: 3,
                              ),
                            ),
                            filled: true,
                            hintStyle: TextStyle(
                              color: Colors.blueGrey[300],
                            ),
                            hintText: "Senha",
                            fillColor: Colors.white,
                            errorText: _isEditingPassword
                                ? _validatePassword(textControllerPassword.text)
                                : null,
                            errorStyle: const TextStyle(
                              fontSize: 12,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(
                              flex: 1,
                              child: SizedBox(
                                width: double.maxFinite,
                                child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.blueAccent),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ))),
                                  onPressed: () async {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const Center(
                                            child: CircularProgressIndicator(
                                              //backgroundColor: Colors.green,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Colors.white),
                                            ),
                                          );
                                        });
                                    // await loginAction();
                                    // Navigator.pop(context);
                                    setState(() {
                                      _isLoggingIn = true;
                                      textFocusNodeEmail.unfocus();
                                      textFocusNodePassword.unfocus();
                                    });
                                    if (_validateEmail(
                                                textControllerEmail.text) ==
                                            null &&
                                        _validatePassword(
                                                textControllerPassword.text) ==
                                            null) {
                                      // singIn(context);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MasterPage()));
                                    } else {
                                      const snackBar = SnackBar(
                                        content: CustomText(
                                            text:
                                                'Preencha os dados da forma correta.'),
                                        backgroundColor: Colors.red,
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                    setState(() {
                                      _isLoggingIn = false;
                                      textControllerEmail.text = '';
                                      textControllerPassword.text = '';
                                      _isEditingEmail = false;
                                      _isEditingPassword = false;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 15.0,
                                      bottom: 15.0,
                                    ),
                                    child: _isLoggingIn
                                        ? const SizedBox(
                                            height: 16,
                                            width: 16,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                Colors.white,
                                              ),
                                            ),
                                          )
                                        : const Text(
                                            'Entrar',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Future<bool> loginAction() async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
}
