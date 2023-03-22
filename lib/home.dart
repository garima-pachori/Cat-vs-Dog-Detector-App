import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bool _loading =true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x004242),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  <Widget>[
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Coding Cafe',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Cats and Dogs detector App',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 30
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: _loading ? 
              SizedBox(
                width: 400,
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/cat_dog_icon.png'),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ) :
              Container()
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: MediaQuery.of(context).size.width-250,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 18
                        ),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: const Text(
                          'Capture a photo',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: MediaQuery.of(context).size.width-250,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 18
                        ),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: const Text(
                          ' Select a photo',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      ),
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