import 'package:flutter/material.dart';
import 'package:log/models/shoe.dart';

class ShoeTile extends StatelessWidget {
  Shoe shoe;
  void Function()? onTap;
  ShoeTile({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
          color: Color.fromARGB(204, 170, 170, 172),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // shoe pic
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(shoe.imagePath)),
          //description
          Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(shoe.description),
          )),

          //price + details
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //show name
                    Text(
                      shoe.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "\₹" + shoe.price,
                    ),

                    //price
                  ],
                ),
                //plus button
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(12),
                          )),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          )

          //button to add to cart
        ],
      ),
    );
  }
}
