import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List a = [
    'images/aditya.jfif',
    'images/chandrayaan_3.jpg',
    'images/mangal.png'
  ];

  List b = [
    'India \'s first space-based solar observatory.It is also going to be ISRO\'s first mission to the L1 point!',
    'With this, the lunar bound maneuvres are completed.Separation of the Lander Module from the Propulsion Module is planned for August 17, 2023.',
    'MOM arrived at Mars in time to observe Comet Siding Spring when it flew by the planet at a distance of 132,000 km (82,000 miles) on October 19, 2014.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Space technology in the service of mankind',
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Image.asset('images/logo.png'))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/space.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'page3');
              },
              child: Text(
                ' need more info?',
                style: TextStyle(color: Colors.white60),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2)),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Image.asset(a[index]),
                        Container(
                          decoration: BoxDecoration(color: Colors.white),
                          child: Text(
                            b[index],
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 5)
                      ],
                    ),
                  );
                },
                itemCount: a.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
