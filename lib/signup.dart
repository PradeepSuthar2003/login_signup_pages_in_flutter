import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<StatefulWidget> createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  child: Column(
                    children: [
                      _CustomTextBox(
                          icon: Icons.abc_outlined,
                          text: "Name",
                          onSubmit: (value) {
                            if ((value.length) < 3) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "name must me 3 character long")));
                            }
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      _CustomTextBox(
                          keyboardtype: TextInputType.emailAddress,
                          icon: Icons.email_outlined,
                          text: "Email",
                          onSubmit: (value) {
                            String email = "@";
                            String email2 = ".com";
                            if ((!value.contains(email)) &&
                                (!value.contains(email2))) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "email must be contain @ & .com")));
                            }
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      _CustomTextBox(
                          icon: Icons.lock_outline,
                          text: "Password",
                          onSubmit: (value) {}),
                      const SizedBox(
                        height: 30,
                      ),
                      _CustomTextBox(
                          icon: Icons.lock_outline,
                          text: "Confirm Password",
                          onSubmit: (value) {}),
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
                          const CircleAvatar(
                            backgroundColor: Color(0x8AFFFFFF),
                            child: IconButton(
                                icon: Icon(Icons.arrow_forward),
                                onPressed: null),
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
      required Function(String) onSubmit,
      required IconData icon,
      var text,
      bool obscureText = false}) {
    return TextField(
      keyboardType: keyboardtype,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(height: 1.5),
      cursorColor: Colors.white54,
      onSubmitted: onSubmit,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.white54)),
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
