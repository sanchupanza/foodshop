
import 'dart:async';

import 'package:shopping_app/constants.dart';

class CartItemsBloc{


  final shopStreamController = StreamController.broadcast();
  final cartStreamController = StreamController.broadcast();

  Stream get getShopItemStream => shopStreamController.stream;
  Stream get getCartItemStream => cartStreamController.stream;
  
  
  List<Items> shopItems = getData();
  List<Items> cartItems = [];
  
  void addToCart(Items item,int i) {
    cartItems.add(item);
    shopItems[i].isInCart = true;
    cartStreamController.sink.add(cartItems);
    shopStreamController.sink.add(shopItems);
  }

  void removeFromCart(Items item,int i) {
    cartItems.remove(item);
    shopItems[i].isInCart = false;
    cartStreamController.sink.add(cartItems);
    shopStreamController.sink.add(shopItems);
  }


  void dispose() {
    cartStreamController.close();
    shopStreamController.close();// close our StreamController
  }
}
final bloc = CartItemsBloc();
