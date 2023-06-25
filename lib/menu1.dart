import 'package:flutter/material.dart';

class MenuPage1 extends StatelessWidget {
  const MenuPage1({super.key});

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
                _buildDishTile('Chicken 65', '150'),
                _buildDishTile('Dosa', '10'),
                _buildDishTile('Idli', '5'),
                _buildDishTile('Butter Paneer', '180'),
                _buildDishTile('Shrimp', '120'),
                _buildDishTile('Chicken Manchurian', '100'),
                _buildDishTile('Shawarma', '90'),
                _buildDishTile('Lime Juice', '30'),
                _buildDishTile('Fried Rice', '110'),
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
                    'Food Inspection Review:',
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
                          'Dr. Prasad R P',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '4.5',
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
                      '"The food inspection of the food truck showed a commendable adherence to food safety standards. The operators maintained a clean and organized workspace, with regular handwashing and glove usage."',
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
                          'Dr. Jissy P',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '4.3',
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
                      '"The food truck also had proper waste disposal measures in place. The inspector commended the owners for their dedication to maintaining high food safety standards."',
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
                          'Dhananjay S K',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '4.0',
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
                      '"The food truck had a clean workspace, with regular handwashing. The refrigeration units were operating at the appropriate temperatures, ensuring the freshness of the ingredients."',
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
          child: Row(
            children: [
              const Icon(
                Icons.check_box_outline_blank,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              Text(
                dishName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
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
