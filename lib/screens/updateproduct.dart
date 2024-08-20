// ignore_for_file: use_build_context_synchronously, sort_child_properties_last

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybuyseller/routers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Updateproduct extends StatefulWidget {
  const Updateproduct({super.key});

  @override
  State<Updateproduct> createState() => _UpdateproductState();
}

class _UpdateproductState extends State<Updateproduct> {
  final category = ["fashion", "appliances", "eletronics", "mobiles"];
  String? selectedcategory;
  File? profile;

  TextEditingController pricecontroller = TextEditingController();
  TextEditingController productnamecontroller = TextEditingController();

  void updateProductdetails() async {}

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map?;

    productnamecontroller.text = args?["productname"];
    pricecontroller.text = args?["price"];
    selectedcategory = args?["productcategory"];

    return Scaffold(
      appBar: AppBar(
        title: const Text("update your product"),
        backgroundColor: const Color.fromARGB(255, 164, 142, 203),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.pushNamed(context, Routers.loginpage);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () async {
              XFile? image =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              File cfile = File(image!.path);
              setState(() {
                profile = cfile;
              });
            },
            child: CircleAvatar(
                radius: 50,
                backgroundColor: const Color.fromARGB(67, 157, 130, 161),
                backgroundImage: profile != null ? FileImage(profile!) : null),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: productnamecontroller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("product name")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: pricecontroller,
              keyboardType: TextInputType.number,
              maxLength: 5,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("price")),
            ),
          ),
          // drop down list
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField(
                value: selectedcategory,
                decoration:
                    const InputDecoration(label: Text("product category")),
                items: category
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (val) {
                  selectedcategory = val;
                }),
          ),

          TextButton(
              onPressed: () {
                
                
                
                

              
              },
              child: const Text("update")),
        ],
      ),
    );
  }
}
