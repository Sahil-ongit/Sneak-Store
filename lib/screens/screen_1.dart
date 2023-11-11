import 'package:flutter/material.dart';
import 'package:log/components/shoe_tile.dart';
import 'package:log/models/cart.dart';
import 'package:log/models/shoe.dart';
import 'package:provider/provider.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  //add shoe to cart
  addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
    //Alert the user, shoe successfully added
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Successfully added!"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Consumer<Cart>(
            builder: (context, value, child) => Column(
                  children: [
                   
                    //A message

                    SizedBox(
                      height: 20,
                    ),

                    //Trending
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Trending ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.white),
                          ),
                          Container(
                              margin: EdgeInsets.only(right: 210),
                              child: Image.asset(
                                'lib/images/fire.png',
                                height: 20,
                              )),
                          Icon(                           
                            Icons.arrow_forward,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    

                    //list of shoes for sale
                    Expanded(
                        child: ListView.builder(
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        //get a shoe from shop list
                        Shoe shoe = value.getShoeList()[index];
                        //return the shoe
                        return ShoeTile(
                          shoe: shoe,
                          onTap: () => addShoeToCart(shoe),
                        );
                      },
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50.0),
                      child: Divider(),
                    ),
                    
                  ],
                )));
  }
}
