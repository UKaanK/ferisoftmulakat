import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left:40.0),
              child: Row(
                
                children: [
                 Image.network(
                      'https://picsum.photos/200/300',
                      width: 150,
                      height: 250,
                    ),
                  Column(
                    
                    children: [
                      Text(" Merhaba Emirhan ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
              
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}