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
          color: Colors.red,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Safe To Eat',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Align(
                  alignment: Alignment(-1, -1),
                  child: Text(
                  'About Us',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),)
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 60, 0),
                child: Text(
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
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                        ),
                        child: const Text(
                          'Restaurants',
                          style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
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
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                        ),
                        child: const Text(
                          'User',
                          style: TextStyle(color: Colors.red, fontSize: 20,fontWeight: FontWeight.bold),
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
