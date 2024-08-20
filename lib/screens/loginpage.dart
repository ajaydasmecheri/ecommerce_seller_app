// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:easybuyseller/routers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController remail = TextEditingController();
  TextEditingController rpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login now"),
        backgroundColor: const Color.fromARGB(255, 164, 142, 203),
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.55,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: TextField(
                  controller: remail,
                  decoration: InputDecoration(
                      hintText: "enter email",
                      icon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: TextField(
                  controller: rpassword,
                  decoration: InputDecoration(
                      hintText: "password",
                      icon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),

              // start login button
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.45,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 164, 142, 203),
                  borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
                ),
                child: TextButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: remail.text.trim(),
                          password: rpassword.text.trim());
                          Navigator.pushNamed(context, Routers.homepage);
                          
                    } on FirebaseAuthException catch (e) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(e.toString()),
                              actions: [
                                Center(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("ok")))
                              ],
                            );
                          });
                    }

                    
                  },
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        letterSpacing: 5,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routers.registerpage);
                  },
                  child: const Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(color: Colors.black),
                  ))

              // end
            ],
          ),
        ),
      ),
    );
  }
}
