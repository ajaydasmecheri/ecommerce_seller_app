// ignore_for_file: sort_child_properties_last

import 'package:easybuyseller/routers.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser?.email);
    //  product row widget

    return Scaffold(
        appBar: AppBar(
          title: const Text("welcome seller"),
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
        body:Column(children: [
           Padding(
             padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
             child: Center(
               child: GestureDetector(
                onTap: () {
                  Navigator.popAndPushNamed(context, Routers.sellerproducts);
                },
                 child: LottieBuilder.asset(
                   'assets/images/allproduct.json',
                   height: MediaQuery.of(context).size.height*0.25,
                   width: MediaQuery.of(context).size.width*0.45,
                   fit: BoxFit.fill,
                 ),
               ),
             ),
           ),
                const Text(
                  "seller products",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                 Center(
             child: GestureDetector(
              onTap: (){
                 Navigator.popAndPushNamed(context, Routers.orderedproduct);

              },
               child: LottieBuilder.asset(
                 'assets/images/orderlist.json',
                 height: MediaQuery.of(context).size.height*0.25,
                   width: MediaQuery.of(context).size.width*0.45,
                 fit: BoxFit.fill,
               ),
             ),
           ),
                const Text(
                  "ordered products",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
         
        ],),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.pushNamed(context, Routers.addproduct);
        },
        child: const Icon(Icons.add, size: 40,),
        backgroundColor: const Color.fromARGB(255, 164, 142, 203),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        
        );
  }
}
