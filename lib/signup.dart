import 'package:flutter/material.dart';
import 'package:login_signup/validation.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<StatefulWidget> createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
            child: Column(children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      backgroundColor: const Color(0x4DFFFFFF),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white54,
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              RichText(
                text: TextSpan(
                    text: "Sign",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                          text: "up ",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(fontSize: 32)),
                      TextSpan(
                          text: "Now",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(fontSize: 15))
                    ]),
              ),
              const SizedBox(
                height: 85,
              ),
              Form(
                key: _formState,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1),
                  child: Column(
                    children: [
                      _CustomTextBox(
                          icon: Icons.abc_outlined,
                          text: "Name",
                          validate: (value) {
                            if (!value!.isValidName) {
                              return "Enter valid name";
                            }
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      _CustomTextBox(
                          keyboardtype: TextInputType.emailAddress,
                          icon: Icons.email_outlined,
                          text: "Email",
                          validate: (value) {
                            if (!value!.isValidEmail) {
                              return "Enter valid email";
                            }
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      _CustomTextBox(
                          icon: Icons.lock_outline,
                          text: "Password",
                          validate: (value) {
                            if (!value!.isValidPassword) {
                              return "Enter valid password";
                            }
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      _CustomTextBox(
                          icon: Icons.lock_outline,
                          text: "Confirm Password",
                          validate: (value) {
                            if (!value!.isValidPassword) {
                              return "Enter valid password";
                            }
                          }),
                      const SizedBox(
                        height: 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Login",
                                style: Theme.of(context).textTheme.labelSmall,
                              )),
                          CircleAvatar(
                            backgroundColor: const Color(0x8AFFFFFF),
                            child: IconButton(
                              icon: const Icon(Icons.arrow_forward),
                              onPressed: () {
                                _formState.currentState!.validate();
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _CustomTextBox(
      {TextInputType? keyboardtype = TextInputType.name,
      required String? Function(String?)? validate,
      required IconData icon,
      var text,
      bool obscureText = false}) {
    return TextFormField(
      keyboardType: keyboardtype,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(height: 1.5),
      cursorColor: Colors.white54,
      validator: validate,
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
            borderSide: BorderSide(color: Colors.redAccent)),
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
