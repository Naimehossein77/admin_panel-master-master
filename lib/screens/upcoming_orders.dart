import 'package:admin_panel/Config/config.dart';
import 'package:admin_panel/widgets/order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpcomingOrders extends StatefulWidget {
  @override
  _UpcomingOrdersState createState() => _UpcomingOrdersState();
}

class _UpcomingOrdersState extends State<UpcomingOrders> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("orders")
            .where('isCompleted', isEqualTo: false)
            .snapshots(),
        builder: (context, dataSnapshot) {
          return dataSnapshot == null
              ? Center(
                  child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.teal),
                ))
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return OrderCard(
                        total: dataSnapshot
                            .data.docs[index]['totalAmount'],
                        adressId: dataSnapshot
                            .data.docs[index]['addressID'],
                        orderTime: dataSnapshot
                            .data.docs[index]['orderTime'],
                        userUId:
                            dataSnapshot.data.docs[index]['orderBy'],
                        url: dataSnapshot
                            .data.docs[index]['invoiceUrl'],
                        products: dataSnapshot
                            .data.docs[index]['productIDs']
                            .cast<String>(),
                        quantity: dataSnapshot
                            .data.docs[index]['userCartQuantity']
                            .cast<String>(),
                        status: dataSnapshot
                            .data.docs[index]['isCompleted']);
                  },
                  itemCount: dataSnapshot.data.docs.length,
                );
        },
      ),
    );
  }

  circularProgress() {}
}
