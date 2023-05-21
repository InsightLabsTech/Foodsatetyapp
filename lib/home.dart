import 'package:flutter/material.dart';
import 'package:google_mao/map.dart';
import 'package:google_mao/user.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ 
              Image.asset(
                'assets/safetoeat.png', // Replace with your image path
                width: 400, // Adjust the width as needed
              ),
              Container(
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: const Color.fromARGB(255, 0, 151, 178),
                ),
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(5,5,10,10),
                      child: Align(
                        alignment: Alignment(-1, -1),
                        child: Text(
                        'About Us',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 5, 10, 10),
                      child: 
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                        'Praesent vestibulum justo in convallis consequat. '
                        'Vestibulum tristique semper lorem, id tincidunt tellus facilisis vitae.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: ElevatedButton(
                        onPressed: () {
                          restmap();
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(const Size.fromHeight(48)),
                          backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 151, 178)),
                        ),
                        child: const Text(
                          'Restaurants',
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: ElevatedButton(
                        onPressed: () {
                          userProfile();
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(const Size.fromHeight(48)),
                          backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 151, 178)),
                        ),
                        child: const Text(
                          'User',
                          style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),),
            ],
          ),
        ),
      )
    );
  }
}
