import 'package:flutter/material.dart';
import 'item_bloc.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: StreamBuilder(
          initialData: bloc.cartItems,
          stream: bloc.getCartItemStream,
          builder: (context,snapshot){
            return Text(
              'Total: ₹ ${getTotal(snapshot.data)}',
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
            );
        }
        ),
      ),
      appBar: AppBar(
        title: Text('Cart Page'),
      ),
      body: StreamBuilder(
        initialData: bloc.cartItems,
        stream: bloc.getCartItemStream,
        builder: (context, snapshot) {
          return buildCartItemListView(snapshot.data);
        },
      ),
    );
  }

  Widget buildCartItemListView(data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, i) {
        return Card(
          elevation: 3,
          child: ListTile(
            title: Text(data[i].name),
            subtitle: Text('₹ '+data[i].price.toString()),
            ),
        );
      },
    );
  }

  String getTotal(snapshot) {
    int total = 0;
    for(int i =0; i<snapshot.length; i++){
      total = total+ snapshot[i].price;
    }
    return total.toString();
  }
}
