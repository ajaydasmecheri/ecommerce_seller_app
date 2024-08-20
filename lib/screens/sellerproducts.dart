import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybuyseller/routers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Sellerproducts extends StatelessWidget {
  const Sellerproducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  BackButton(
          onPressed: (){
            Navigator.pushNamed(context, Routers.homepage);
          },
          color: Colors.white, // Change the color here
        ),
        title: const Text("product details"),
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("products")
            .where("selleremail",
                isEqualTo: FirebaseAuth.instance.currentUser?.email)
            .snapshots(),
        builder: (BuildContext context, snapshot) {
          final data = snapshot.data?.docs;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (data!.isEmpty) {
            return const Center(child: Text("there are no products"));
          } else {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                final productmap = data[index].data();

                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Image.network(productmap["image"]),
                        title: Text(productmap["productname"]),
                        subtitle: Text('price : ${productmap["price"]}'),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () async {
                                    await FirebaseStorage.instance
                                        .refFromURL(productmap["image"])
                                        .delete();
                                    await FirebaseFirestore.instance
                                        .doc("products/${data[index].id}")
                                        .delete();
                                  },
                                  icon: const Icon(Icons.delete)),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, Routers.updateproduct,
                                        arguments: {
                                          "image": productmap["image"],
                                          "productname":
                                              productmap["productname"],
                                          "price": productmap["price"],
                                          "productcategory":
                                              productmap["category"],
                                          "id": productmap["selleremail"],
                                        });
                                  },
                                  icon: const Icon(Icons.edit)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
