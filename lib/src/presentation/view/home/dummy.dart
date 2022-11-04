import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DummyView extends StatelessWidget {
  DummyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    print(width / 20);
    return SafeArea(
        child: Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      print(constraints.maxWidth);
      return Column(
        children: [
          SizedBox(
            height: width / 3,
            width: width / 2,
            child: Card(
              color: Colors.amber,
              child: Column(
                children: [
                  Text(
                    'means that the file ended, while the parser expected that there was more.  , ',
                    style: TextStyle(fontSize: width / 25),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.white,
                      shadowColor: Colors.greenAccent,
                      elevation: 3,

                      minimumSize: Size(width / 4, width / 10), //////// HERE
                    ),
                    onPressed: () {},
                    child: Text(
                      'Hey bro',
                      style: TextStyle(fontSize: width / 25),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      );
    })));
  }
}
