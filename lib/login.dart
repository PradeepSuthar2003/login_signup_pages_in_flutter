import 'package:flutter/material.dart';
import 'package:login_signup/LoginModel.dart';
import 'package:login_signup/validation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LoginPage> {
  FocusNode emailfocusNode = FocusNode();
  FocusNode passfocusNode = FocusNode();
  final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var email = TextEditingController();
    var password = TextEditingController();
    emailfocusNode.unfocus();
    passfocusNode.unfocus();
    return SafeArea(
      child: Scaffold(
          body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF09201F),
              Color(0xFF09202F),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              RichText(
                text: TextSpan(
                    text: "Welcome ",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                          text: "back",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(fontSize: 15))
                    ]),
              ),
              RichText(
                text: TextSpan(
                    text: "Login ",
                    style: Theme.of(context).textTheme.labelSmall,
                    children: [
                      TextSpan(
                          text: "now",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontSize: 15))
                    ]),
              ),
              const SizedBox(
                height: 65,
              ),
              Container(
                child: Column(
                  children: const [
                    CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage("assets/images/pog.jpg"),
                    ),
                    //Padding(padding: EdgeInsets.all(10),child: Text("welcome back",style: TextStyle(color: Colors.white54),))
                  ],
                ),
              ),
              const SizedBox(
                height: 65,
              ),
              Form(
                key: _formState,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1),
                  child: Column(
                    children: [
                      _CustomTextBox(
                          focusNode: emailfocusNode,
                          inputType: TextInputType.emailAddress,
                          controller: email,
                          validate: (value) {
                            if (!value!.isValidEmail) {
                              return "Enter valid email";
                            }
                          },
                          icon: Icons.email_outlined,
                          text: "Email"),
                      const SizedBox(
                        height: 30,
                      ),
                      _CustomTextBox(
                          focusNode: passfocusNode,
                          controller: password,
                          validate: (value) {
                            if (!value!.isValidPassword) {
                              return "Enter valid password";
                            }
                          },
                          icon: Icons.lock_outline,
                          text: "Password",
                          obscureText: true),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'signup');
                                emailfocusNode.unfocus();
                                passfocusNode.unfocus();
                              },
                              child: Text(
                                "Signup",
                                style: Theme.of(context).textTheme.labelSmall,
                              )),
                          CircleAvatar(
                            backgroundColor: const Color(0x8AFFFFFF),
                            child: IconButton(
                                icon: const Icon(Icons.arrow_forward),
                                onPressed: () {
                                  _formState.currentState?.validate();
                                  if (password.text.toString() == "123") {
                                    Navigator.pushNamed(context, 'home',
                                        arguments: LoginData(
                                            email: email.text.toString(),
                                            password:
                                                password.text.toString()));
                                    emailfocusNode.unfocus();
                                    passfocusNode.unfocus();
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Incorrect password or username")));
                                  }
                                }),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget _CustomTextBox(
      {FocusNode? focusNode,
      TextInputType? inputType = TextInputType.name,
      TextEditingController? controller,
      required String? Function(String?)? validate,
      required IconData icon,
      var text,
      bool obscureText = false}) {
    return TextFormField(
      keyboardType: inputType,
      focusNode: focusNode,
      controller: controller,
      validator: validate,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(height: 1.5),
      cursorColor: Colors.white54,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.white54)),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.redAccent)),
        focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.red)),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.white54)),
        hintText: "$text",
        hintStyle: const TextStyle(color: Colors.white54, fontSize: 15),
        prefixIcon: Icon(
          icon,
          color: Colors.white54,
        ),
        focusColor: Colors.black,
      ),
    );
  }
}
