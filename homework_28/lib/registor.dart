import 'package:flutter/material.dart';
import 'package:homework_28/my_text.dart';
import 'main.dart';

class Registor1 extends StatefulWidget {
  const Registor1({super.key});

  @override
  State<Registor1> createState() => _RegistorState();
}

class _RegistorState extends State<Registor1> {
  final formKey = GlobalKey<FormState>();
  final ismController = TextEditingController();
  final sharifController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _isObscure = true;

  @override
  void dispose() {
    ismController.dispose();
    sharifController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFF353535),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 45),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Welcome toNowTV",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Create an account to explore amazing feature",
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
                        label: "Email",
                        icon: const Icon(Icons.message, color: Colors.white),
                        controller: ismController,
                        icon1: const Icon(
                          Icons.check,
                          color: Colors.transparent,
                        ),
                      ),

                      MyText1(
                        label: "Password",
                        icon: const Icon(Icons.key, color: Colors.white),
                        controller: passwordController,
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
                      MyText1(
                        label: "Confirm Password",
                        icon: const Icon(Icons.key, color: Colors.white),
                        controller: confirmPasswordController,
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
                            "Registor",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text("Or rigister with", style: TextStyle(color: Colors.white)),
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
                padding: const EdgeInsets.only(left: 100, top: 40),
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
                            Navigator.pop(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MyForm(),
                              ),
                            );
                          },
                          child: const Text(
                            "Login",
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
    );
  }
}
