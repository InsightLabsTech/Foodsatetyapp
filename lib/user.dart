import 'package:flutter/material.dart';
import 'package:google_mao/map.dart';
void userProfile() => runApp(const Profile());

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: const Color.fromARGB(224, 244, 67, 54), //change here
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(224, 244, 67, 54),
            title: const Text(
              "User",
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            // centerTitle: true,
          ),
          body: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: const [
                          Padding(
                            padding:  EdgeInsets.fromLTRB(30, 20, 20, 0),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                    "https://images.unsplash.com/photo-1678188575046-4cad367dd8df?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(width: 20),
                      Column(
                        children: const [
                         Padding(
                           padding: EdgeInsets.only(top: 10),
                           child: Text(
                              'Nicole Watson',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                         ), 
                        ],
                      ),
                    ],
                  ),
                ],
              ),  
              SizedBox(
                height: 555,
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                  children: [
                    _buildDishTile('Age', '20'),
                    _buildDishTile('Height(cm)', '170'),
                    _buildDishTile('Weight(kg)', '85'),
                    _buildDishTile('Target Height(cm)', '180'),
                    _buildDishTile('Target Weight(kg)', '70'),
                    _buildDishTile('Last Calorie Intake(kcal)', '100'),
                    _buildDishTile('Avg Calorie Intake(kcal)', '90'),
                    _buildDishTile('Target Calorie Intake(kcal)', '40'),
                    // Add more data here...
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    restmap(); // Handle Restaurants button tap
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size.fromHeight(48)),
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(224, 244, 67, 54),),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0), // Remove rounded borders
                      ),
                    ),
                  ),
                  child: const Icon(
                    Icons.local_restaurant,
                    color: Colors.white,
                  ),
                ),
                ),
                Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle User button tap
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size.fromHeight(48)),
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(223, 134, 36, 29),),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0), // Remove rounded borders
                      ),
                    ),
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                ),
              ],
              ),
              ),
          ],
        ),
    )
    );
  }

  Widget _buildDishTile(String factor, String value) {
      return Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 249, 242, 242),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              factor,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
          ),
        ),
      );
    }
}

