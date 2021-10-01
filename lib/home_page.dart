
import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'item_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CartPage()));
            },
          )
        ],
      ),
      body: StreamBuilder(
        initialData: bloc.shopItems,
        stream: bloc.getShopItemStream,
        builder: (context, snapshot) {
          return buildShopItemsList(snapshot.data);
        },
      ),
    );
  }

  Widget buildShopItemsList(data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, i) {
        return Card(
          elevation: 3,
          child: ListTile(
            title: Text(data[i].name),
            subtitle: Text('₹ '+data[i].price.toString()),
            trailing: (data[i].isInCart)
                ? IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  bloc.removeFromCart(data[i], i);
                  var snackBar = SnackBar(
                      content: Text('${data[i].name} Removed from Cart'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                })
                : IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  bloc.addToCart(data[i], i);
                  var snackBar = SnackBar(
                      content: Text('${data[i].name} Added to Cart'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }),
          ),
        );
      },
    );
  }
}