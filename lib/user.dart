import 'package:flutter/material.dart';
import 'package:google_mao/map.dart';
import 'package:google_mao/userData.dart';

void userProfile() => runApp(const Profile());
String username = UserData.username;

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
          backgroundColor: Colors.white, //change here
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 0, 151, 178),
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
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(
                                    "https://icons.veryicon.com/png/o/internet--web/55-common-web-icons/person-4.png"),
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(width: 20),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                           username,
                           style: const TextStyle(
                             color: Color.fromARGB(255, 0, 151, 178),
                             fontSize: 26,
                             fontWeight: FontWeight.bold
                           ),
                         ),
                      ),
                    ],
                  ),
                ],
              ),  
              Column(
                children: [
                  SizedBox(
                    height: 555,
                    child: ListView(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                ],
              ),
              Column(
                children: [
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
                        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 151, 178),),
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
                        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(219, 17, 94, 108),),
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
          ],
        ),
    )
    );
  }

  Widget _buildDishTile(String factor, String value) {
      return Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 203, 247, 255),
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


