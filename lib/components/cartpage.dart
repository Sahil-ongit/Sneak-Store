import 'package:flutter/material.dart';
import 'package:log/components/mybutton.dart';
import 'package:log/models/cart.dart';
import 'package:log/models/shoe.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove from cart
  void removeFromCart(Shoe shoe, BuildContext context)
  {
    final cart = context.read<Cart>();
    cart.removeItemFromCart(shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Scaffold(
              appBar: AppBar(
                title: Center(child: Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: Text("My Cart"),
                )),
                backgroundColor: Colors.black,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.userCart.length,
                      itemBuilder: (context, index) {
                        //get shoe from cart
                        final Shoe shoe = value.userCart[index];
                        //get shoe name
                        final String shoename = shoe.name;
                        //get shoe price
                        final String shoeprice = shoe.price;
                        //return list tile
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[500],
                              borderRadius: BorderRadius.circular(15)),
                          margin: EdgeInsets.all(15),
                          child: ListTile(
                            title: Text(shoename),
                            subtitle: Text(
                              shoeprice,
                            ),
                            trailing: IconButton(
                                onPressed: () => removeFromCart(shoe,context),
                                icon: Icon(
                                  Icons.delete,
                                )),
                          ),
                        );
                      },
                    ),
                  ),
                  //Pay button
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: MyButton(onTap: () {}, text: "Pay Now "),
                  )
                ],
              ),
            ));
  }
}
