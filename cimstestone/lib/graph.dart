import 'package:flutter/material.dart';



class graphPage extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 173, 105, 128),
        appBar: AppBar(
          title: Text("NOTIFICATIONS"),
          backgroundColor: const Color.fromARGB(255, 173, 105, 128),
        ),
        body: Center(
            child: Container(
          color: const Color.fromARGB(255, 173, 105, 128),
          padding: const EdgeInsets.all(8),
          child: ListView(
            children: [
              Container(
                  height: 60,
                  color: Colors.white10,
                 
                  child: Text(
                    "Anne's health is at 60%" ,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w200),
                    textScaleFactor: 1.4,
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                  height: 60,
                  color: Colors.white10,
                  child: Text(
                    "Rodney's health is at 60%" ,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w200),
                    textScaleFactor: 1.4,
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                  height: 60,
                  color: Colors.white10,
                  child: Text(
                    "Sarah's health is at 60%" ,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w200),
                    textScaleFactor: 1.4,
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                color: Colors.white10,
                child: Text(
                  "Abraham's health is at 50%" ,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w200),
                  textScaleFactor: 1.4,
                ),
              )]))));
              }


}
