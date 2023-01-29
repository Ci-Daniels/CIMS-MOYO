
//import 'package:cimstestone/graph.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


void main() => runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: const Color.fromARGB(255, 173, 105, 128),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 173, 105, 128),
        
        ),
        body: historypage())));

class historypage extends StatefulWidget {
  const historypage({Key? key}) : super(key: key);

  @override
  State<historypage> createState() => _historypageState();
}

var isShow = false;
var getdata = Diohelper.getdata();

class _historypageState extends State<historypage> {
  @override
  Widget build(BuildContext context) {
    List mwidge = [];
    int index = 0;
    getdata.forEach((element) {
      element.index = index;
      mwidge.add(ListTile(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DetailPage(element)));
        },
        hoverColor: const Color.fromARGB(255, 173, 105, 128),
        title: Text(element.name.toString()),
        trailing: element.isShow
            ? SizedBox(
                width: 100,
                height: 70,
                child: OutlinedButton(
                    onPressed: () {
                      //Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text(element.name.toString()));
                    },
                    child: Text("Show")),
              )
            : Container(
                width: 100,
              ),
      ));
      index++;
    });
    return GestureDetector(
      child: Center(
        child: ListView(
          children: [...mwidge],
        ),
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  productModel model;

  DetailPage(this.model, {Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 173, 105, 128),
        appBar: AppBar(
          title: Text("PATIENTS PROGRESS REPORT"),
          backgroundColor: const Color.fromARGB(255, 173, 105, 128),
        ),
        body: Center(
            child: Container(
          color: const Color.fromARGB(255, 173, 105, 128),
          padding: const EdgeInsets.all(8),
          child: ListView(
            children: [
              Image.asset(
                'assets/images/page1.png',
                height: 200,
                width: 200,
                alignment: Alignment.center,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: _makingPhoneCall,
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                      const Color.fromARGB(255, 161, 18, 66)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )),
                  padding:
                      MaterialStateProperty.all(const EdgeInsets.all(20.0)),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(color: Colors.black),
                  ),
                ),
                child: const Text('CALL NEXT OF KIN'),
              ), // ElevatedButton
              const SizedBox(
                height: 20,
              ),
              Container(
                  height: 60,
                  color: Colors.white10,
                  child: Text(
                    "Name:" + widget.model.name.toString(),
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
                  "Body Temperature:" + widget.model.bodytemperature.toString(),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w200),
                  textScaleFactor: 1.4,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  height: 60,
                  color: Colors.white10,
                  child: Text(
                    "Heart Rate:" + widget.model.heartrate.toString(),
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
                  "P wave:" + widget.model.pwave.toString(),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w200),
                  textScaleFactor: 1.4,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                color: Colors.white10,
                child: Text(
                  "PR Interval:" + widget.model.printerval.toString(),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w200),
                  textScaleFactor: 1.4,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                color: Colors.white10,
                child: Text(
                  "QRS Complex:" + widget.model.qrscomplex.toString(),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w200),
                  textScaleFactor: 1.4,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  height: 60,
                  color: Colors.white10,
                  child: Text(
                    "Time and Date:" + widget.model.timeanddate.toString(),
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w200),
                    textScaleFactor: 1.4,
                  )),
              ],
          ),
        )));
  }
}

//making a phone call
_makingPhoneCall() async {
  var url = Uri.parse("tel:0716485040");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

class productModel {
  String? name;
  String? bodytemperature;
  String? heartrate;
  String? pwave;
  String? printerval;
  String? qrscomplex;
  String? timeanddate;
  bool isShow = false;
  int index = 0;

  productModel(
      {this.name,
      this.bodytemperature,
      this.heartrate,
      this.pwave,
      this.printerval,
      this.qrscomplex,
      this.timeanddate,
      this.isShow = false});

  productModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    bodytemperature = json['bodytemperature'];
    heartrate = json['heartrate'];
    pwave = json['pwave'];
    printerval = json['printerval'];
    qrscomplex = json['qrscomplex'];
    timeanddate = json['timeanddate'];
    isShow = json['isShow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['bodytemperature'] = this.bodytemperature;
    data['heartrate'] = this.heartrate;
    data['pwave'] = this.pwave;
    data['printerval'] = this.printerval;
    data['qrscomplex'] = this.qrscomplex;
    data['timeanddate'] = this.timeanddate;
    data['isShow'] = this.isShow;
    return data;
  }
}

class Diohelper {
  static List<productModel> getdata() {
    List<productModel> list = [];
    list.add(productModel(
        name: "Kariithi Anne",
        bodytemperature: "35 C",
        heartrate: "70 BPM",
        pwave: "80 ms",
        printerval: "150ms",
        qrscomplex: "80 ms",
        timeanddate: "9:22 Wenesday, 16 Nov, 2022"));
    list.add(productModel(
        name: "Rodeny Osodo",
        bodytemperature: "45 C",
        heartrate: "90 BPM",
        pwave: "70 ms",
        printerval: "170ms",
        qrscomplex: "60 ms",
        timeanddate: "9:35 Wenesday, 16 Nov, 2022"));
    list.add(productModel(
        name: "Sarah Nungari",
        bodytemperature: "25 C",
        heartrate: "80 BPM",
        pwave: "20 ms",
        printerval: "120ms",
        qrscomplex: "90 ms",
        timeanddate: "9:40 Wenesday, 16 Nov, 2022"));
    list.add(productModel(
        name: "Abraham M",
        bodytemperature: "65 C",
        heartrate: "60 BPM",
        pwave: "50 ms",
        printerval: "160ms",
        qrscomplex: "70 ms",
        timeanddate: "9:55 Wenesday, 16 Nov, 2022"));
    list.add(productModel(
        name: "Melvin Kibet",
        bodytemperature: "37 C",
        heartrate: "70 BPM",
        pwave: "50 ms",
        printerval: "140ms",
        qrscomplex: "60 ms",
        timeanddate: "10:05 Thursday, 18 Nov, 2022"));
    return list;
  }
}
