import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  bool isSelected = false;
  List<bool> isClicked = [true, false, false, false];
  List keyValue = [];
  int indexValue = 0;
  List<Map<String, dynamic>> foodItems = [
    {"id": 0, "item": "Pizza"},
    {"id": 1, "item": "Chicken"},
    {"id": 2, "item": "Shawarma"},
    {"id": 3, "item": "Chops"},
  ];
  void handleItemClick(int value) {
    setState(() {
      indexValue = value;
      if (indexValue.toString() == foodItems[indexValue]["id"].toString()) {
        isSelected = !isSelected;
        print("yes");
      } else {
        print("nah");
      }
    });
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(
                  Icons.shopping_basket,
                  color: Color.fromRGBO(66, 66, 66, 1),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Food Delivery",
              style: TextStyle(
                color: Color.fromRGBO(33, 33, 33, 1),
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    child: ToggleButtons(
                      selectedColor: Colors.white,
                      color: Colors.grey,
                      disabledColor: Colors.grey[300],
                      fillColor: Color.fromRGBO(252, 192, 45, 1),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width / 4.4,
                      ),
                      borderRadius: BorderRadius.circular(50),
                      children: <Widget>[
                        ...this.foodItems.map((item) {
                          return foodOptions(
                            availableItem: item["item"].toString(),
                          );
                        })
                      ],
                      onPressed: (int index) {
                        setState(() {
                          for (int buttonIndex = 0;
                              buttonIndex < isClicked.length;
                              buttonIndex++) {
                            if (buttonIndex == index) {
                              isClicked[buttonIndex] = true;
                            } else {
                              isClicked[buttonIndex] = false;
                            }
                          }
                        });
                      },
                      isSelected: isClicked,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Free delivery",
              style: TextStyle(
                color: Color.fromRGBO(66, 66, 66, 1),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  displayAvailableFoods(
                    image: "assets/images/one.jpg",
                    amount: 13.00,
                    foodName: "Vegetarian Pizza",
                  ),
                  displayAvailableFoods(
                    image: "assets/images/two.jpg",
                    amount: 24.00,
                    foodName: "Cocoa Pizza",
                  ),
                  displayAvailableFoods(
                    image: "assets/images/three.jpg",
                    amount: 20.00,
                    foodName: "Vege-Pepper Pizza",
                  ),
                  displayAvailableFoods(
                    image: "assets/images/one.jpg",
                    amount: 14.00,
                    foodName: "Onion Roll Pizza",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget foodOptions({String availableItem}) {
    return Center(
      child: Text(
        availableItem,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget displayAvailableFoods({String image, double amount, String foodName}) {
    return AspectRatio(
      aspectRatio: 4 / 5,
      child: Container(
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              blurRadius: 10,
            )
          ],
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: [0.3, 0.9],
            colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.3),
            ],
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              stops: [0.3, 0.9],
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.3),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Colors.white,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "\$",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          amount.toStringAsPrecision(4),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      foodName,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
