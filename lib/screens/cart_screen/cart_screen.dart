import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kit_kart/consts/colors.dart';

import '../../consts/firebase_const.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var itemController = TextEditingController();
  var priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CRUD operation')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: itemController,
              decoration: InputDecoration(label: Text('Item')),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(label: Text('price')),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  firestore.collection('items').doc().set({
                    'item': itemController.text,
                    'price': priceController.text,
                  });
                  itemController.clear();
                  priceController.clear();
                },
                child: const Text('Add')),
            Expanded(
              child: StreamBuilder(
                  stream: firestore.collection('items').snapshots(),
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data!.docs.isEmpty
                          ? Text('No record')
                          : ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: ((context, index) {
                                return Card(
                                  child: ListTile(
                                    title: Text(
                                        snapshot.data!.docs[index]['item']),
                                    subtitle: Text(
                                        snapshot.data!.docs[index]['price']),
                                    trailing: SizedBox(
                                      width: 100,
                                      child: Row(
                                        children: [
                                          // delete
                                          IconButton(
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                            onPressed: () {
                                              var docID =
                                                  snapshot.data!.docs[index].id;
                                              firestore
                                                  .collection('items')
                                                  .doc(docID)
                                                  .delete();
                                            },
                                          ),
                                          // update
                                          IconButton(
                                            icon: const Icon(
                                              Icons.edit,
                                              color: Colors.black,
                                            ),
                                            onPressed: () {
                                              var docID =
                                                  snapshot.data!.docs[index].id;
                                              update(
                                                  icontroller: itemController,
                                                  pcontroller: priceController,
                                                  context: context,
                                                  docid: docID,
                                                  lebalI: snapshot
                                                      .data!.docs[index]['item']
                                                      .toString(),
                                                  lebalP: snapshot.data!
                                                      .docs[index]['price']
                                                      .toString());
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }));
                    }
                    return const SizedBox(
                      width: 50,
                      height: 40,
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                      ),
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }

  update({icontroller, pcontroller, context, docid, lebalI, lebalP}) {
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            content: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.hide_source))
                  ],
                ),
                TextField(
                  controller: icontroller,
                  decoration: InputDecoration(
                    hintText: lebalI,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: pcontroller,
                  decoration: InputDecoration(
                    hintText: lebalP,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      firestore.collection('items').doc(docid).set({
                        'item': itemController.text,
                        'price': priceController.text,
                      });
                      itemController.clear();
                      priceController.clear();
                    },
                    child: const Text('Add')),
              ],
            ),
          );
        }));
  }
}
