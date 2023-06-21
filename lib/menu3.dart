import 'package:flutter/material.dart';

class MenuPage3 extends StatelessWidget {
  const MenuPage3({super.key});

  @override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 151, 178),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "About",
          style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        // centerTitle: true,
      ),
      body: 
      ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Menu',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 151, 178)),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                _buildDishTile('Lamb 65', '150'),
                _buildDishTile('Idiyappam', '10'),
                _buildDishTile('Idli', '5'),
                _buildDishTile('Mushroom Masala', '180'),
                _buildDishTile('Beef Fry', '120'),
                _buildDishTile('Fish Manchurian', '100'),
                _buildDishTile('Shawarma', '90'),
                _buildDishTile('Apple Juice', '30'),
                _buildDishTile('Biriyani', '110'),
              ],
            ),
          ),
          // Add more dishes here...

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 8),
            child: 
            Row(
              children: const [
                Text('more',
                  style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 151, 178), decoration: TextDecoration.underline)
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Color.fromARGB(255, 0, 151, 178),
                ),
              ],
            )
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ElevatedButton(
              onPressed: () {
                // Action to be performed when the button is pressed
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 15, 178, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Order',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          // Review section
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: const Color.fromARGB(255, 0, 151, 178),
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                    'Reviews',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,
                    color: Colors.white),
                  ),)
                ),      
              Container(
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'RoanMark',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '3.9',
                          style: TextStyle(fontSize: 16, color: Colors.amber),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 18,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '"The restaurant appeared generally clean, but there were a few areas that needed better attention. The floors could benefit from more frequent cleaning, and some surfaces had noticeable grease buildup."',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'BasheerK',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '3.9',
                          style: TextStyle(fontSize: 16, color: Colors.amber),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 18,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '"The staff followed basic food handling procedures, but there were a few instances where gloves were not consistently used when handling ready-to-eat items. It is important to reinforce proper hygiene practices and the importance of wearing gloves at all times."',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'FoodNisha',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '3.8',
                          style: TextStyle(fontSize: 16, color: Colors.amber),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 18,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '"The storage areas were organized, but there were a few cases where food items were not properly sealed or labeled. It is crucial to ensure that containers are tightly sealed to prevent contamination and that labels are accurate and easy to read."',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: const [
                    Text('more',
                      style: TextStyle(fontSize: 15, color: Colors.white, decoration: TextDecoration.underline)
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
        ],
      ),
    ),
  );
}


  Widget _buildDishTile(String dishName, String price) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 203, 247, 255),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            dishName,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        trailing: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text(
            '\u20B9$price',
            style: const TextStyle(
              color: Color.fromARGB(255, 12, 209, 19),
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
        ),
      ),
    );
  }
}
