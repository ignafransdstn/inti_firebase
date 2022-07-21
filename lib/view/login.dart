import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'dart:async';
// import 'dart:ui';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:inti_firebase/controller/auth_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inti_firebase/utils/svg_pic.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailCont = TextEditingController();
  final passwordCont = TextEditingController();

  final authCon = Get.find<AuthController>();

  bool _showPassword = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 98, 99, 194),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(child: SizedBox()),
              SvgPicture.string(SvgStrings.warehouse),
              const SizedBox(
                height: 18,
              ),
              const Text(
                "INTI\nWarehouse\nManagement",
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: "Nunito",
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SvgPicture.string(
                    SvgStrings.location,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Melak, West Kutai",
                    style: TextStyle(
                        fontFamily: "Open_Sans",
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 3),
                      blurRadius: 6,
                      color: const Color.fromARGB(0, 0, 0, 0).withOpacity(0.16),
                    ),
                  ],
                ),
                height: 50,
                child: TextField(
                  textInputAction: TextInputAction.next,
                  key: UniqueKey(),
                  controller: emailCont,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 16,
                      color: Colors.lightBlue),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                    filled: true,
                    fillColor: Colors.transparent,
                    hintStyle: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 16,
                        color: Colors.blueAccent.withOpacity(0.58)),
                  ),
                  cursorColor: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 3),
                      blurRadius: 6,
                      color: const Color.fromARGB(0, 0, 0, 0).withOpacity(0.16),
                    ),
                  ],
                ),
                height: 50,
                child: TextField(
                  obscureText: _showPassword,
                  textInputAction: TextInputAction.done,
                  key: UniqueKey(),
                  controller: passwordCont,
                  keyboardType: TextInputType.visiblePassword,
                  style: const TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 16,
                      color: Colors.lightBlue),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                    filled: true,
                    fillColor: Colors.transparent,
                    suffixIcon: GestureDetector(
                      onTap: _passVisibility,
                      child: _showPassword ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                    ),
                    hintStyle: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 16,
                        color: Colors.blueAccent.withOpacity(0.58)),
                  ),
                  cursorColor: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => authCon.login(emailCont.text, passwordCont.text),
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(192, 74, 195, 185),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 5),
                            blurRadius: 6, 
                            color: const Color.fromARGB(0, 0, 0, 0)
                                .withOpacity(0.16),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Nunito",
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const Expanded(child: SizedBox())
            ],
          ),
        ),
      ),
    );
  }
  void _passVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
}
