import 'package:flutter/material.dart';
import 'package:homework_28/my_text.dart';
import 'registor.dart';

void main(List<String> args) {
  runApp(const MyForm());
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final formKey = GlobalKey<FormState>();
  final ismController = TextEditingController();
  final sharifController = TextEditingController();
  bool _isObscure = true;

  @override
  void dispose() {
    ismController.dispose();
    sharifController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0xFF353535),
        body: Padding(
          padding: const EdgeInsets.only(top: 200),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 150),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Welcome back",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Please login to enjoy full feature",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText1(
                          label: "Username or Email",
                          icon: const Icon(Icons.person, color: Colors.white),
                          controller: ismController,
                          icon1: const Icon(
                            Icons.check,
                            color: Colors.transparent,
                          ),
                        ),
                        MyText1(
                          label: "Password",
                          icon: const Icon(
                            Icons.lock_outline,
                            color: Colors.white,
                          ),
                          controller: sharifController,
                          icon1: IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                          obscureText: _isObscure,
                        ),

                        const Padding(
                          padding: EdgeInsets.only(left: 220),
                          child: Text(
                            "Forgot password",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 50),
                        SizedBox(
                          width: 336,
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Login',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF00A3B7),
                            ),
                            child: const Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text("Or login with", style: TextStyle(color: Colors.white)),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Color(0xFF404040),
                      ),
                      child: Image.asset("assets/image2.png"),
                    ),
                    SizedBox(width: 40),
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Color(0xFF404040),
                      ),
                      child: Image.asset("assets/image1.png"),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80, top: 60),
                  child: Row(
                    children: [
                      const Text(
                        "Not have an account?",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(width: 5),
                      Builder(
                        builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Registor1(),
                                ),
                              );
                            },
                            child: const Text(
                              "Register now",
                              style: TextStyle(
                                color: Color.fromARGB(255, 37, 164, 189),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
