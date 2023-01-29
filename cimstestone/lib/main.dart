// ignore_for_file: unnecessary_const
// ignore: unused_import
import 'package:string_validator/string_validator.dart';
import 'package:flutter/material.dart';
import 'login.dart';

void main() => runApp(CimsApp());

class CimsApp extends StatelessWidget {
  //const CimsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'login': (context) => MyLogin(),
        'register new patient': (context) => MyRegister(),
      },
      home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 173, 105, 128),
          body: SplashPage()),
    );
  }
}

class SplashPage extends StatelessWidget {
  //const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Center(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Image.asset(
              'assets/images/page1.png',
              height: 300,
              width: 300,
              alignment: Alignment.centerRight,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                textAlign: TextAlign.center,
                "Welcome to",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
                textScaleFactor: 3,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              textAlign: TextAlign.center,
              "CIMS MOYO",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              textScaleFactor: 4,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 161, 18, 66),
                  padding: const EdgeInsets.all(10)),
              child: const Text('Get Started'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CimsSignUpPage()),
                );
              },
            )
          ]),
        ),
      ),
    );
  }
}

//SignUpPage
class CimsSignUpPage extends StatelessWidget {
  const CimsSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 173, 105, 128),
        body: CimsSignPage(),
      ),
    );
  }
}

class CimsSignPage extends StatelessWidget {
  //const CimsSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                'assets/images/page2.png',
                height: 300,
                width: 300,
              ),
              const Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Check your patients cardiac health with us',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    textScaleFactor: 2,
                    softWrap: true,
                  )),
              const SizedBox(
                height: 20,
              ),
              const Text(
                textAlign: TextAlign.center,
                'We are your new cardiac health advisors',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
                textScaleFactor: 1,
                softWrap: true,
              ),
              const Text(
                textAlign: TextAlign.center,
                'to help you identify possible threats on your health.',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
                textScaleFactor: 1,
                softWrap: true,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      backgroundColor: const Color.fromARGB(255, 161, 18, 66)),
                  child: const Text('Create an Account'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AccountCreate()),
                    );
                  },
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 161, 18, 66),
                        padding: const EdgeInsets.all(10)),
                    child: const Text('Login'),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => MyLogin(),
                        ),
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

//create account
class AccountCreate extends StatelessWidget {
  //const CimsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 173, 105, 128),
        body: CreateAccountForm(),
      ),
    );
  }
}

// Create a Form widget.
class CreateAccountForm extends StatefulWidget {
  //const CreateAccountForm({super.key});

  @override
  CreateAccountFormState createState() {
    return CreateAccountFormState();
  }
}

// Create a corresponding State class, which holds data related to the form.
class CreateAccountFormState extends State<CreateAccountForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 320,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //text
                Container(
                  padding: const EdgeInsets.all(1),
                  child: const Text(
                    textAlign: TextAlign.center,
                    'Create Account',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(1),
                  child: const Text(
                    textAlign: TextAlign.center,
                    ' Save and Invest on your motor Expenses',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                //end of text
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        errorStyle: TextStyle(color: Colors.white),
                        //icon: const Icon(Icons.person),
                        hintText: 'Enter your full name',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 25, 25, 26)),
                        labelText: 'Full Name',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 25, 25, 26)),
                        filled: true,
                        fillColor: Color.fromARGB(179, 187, 182, 182),
                        //boarder
                        border: const OutlineInputBorder(
                            // borderSide: BorderSide(color: Colors.grey, width: 67),
                            borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        errorStyle: TextStyle(color: Colors.white),
                        //icon: const Icon(Icons.phone),
                        hintText: 'Enter a phone number',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 25, 25, 26)),
                        labelText: 'Phone Number',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 25, 25, 26)),
                        filled: true,
                        fillColor: Color.fromARGB(179, 187, 182, 182),
                        border: const OutlineInputBorder(
                            // borderSide: BorderSide(color: Colors.grey, width: 67),
                            borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      } else if (value.length < 10) {
                        return 'Please enter a VALID phone number';
                      }
                      return null;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        errorStyle: TextStyle(color: Colors.white),
                        //icon: const Icon(Icons.calendar_today),
                        hintText: 'Enter your email address',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 25, 25, 26)),
                        labelText: 'Email',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 25, 25, 26)),
                        filled: true,
                        fillColor: Color.fromARGB(179, 187, 182, 182),
                        border: const OutlineInputBorder(
                            // borderSide: BorderSide(color: Colors.grey, width: 67),
                            borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ))),
                    validator: (value) {
                      //(value) =>
                      // !value.contains("@") ? "Email Id is not Valid" : null;
                      //return null;
                      if (value == null || !value.contains("@")) {
                        return 'Please enter valid email';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        errorStyle: TextStyle(color: Colors.white),
                        //icon: const Icon(Icons.calendar_today),
                        hintText: 'Enter your password',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 25, 25, 26)),
                        labelText: 'Password',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 25, 25, 26)),
                        filled: true,
                        fillColor: Color.fromARGB(179, 187, 182, 182),
                        border: const OutlineInputBorder(
                            // borderSide: BorderSide(color: Colors.grey, width: 67),
                            borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ))),
                    validator: (value) {
                      if (value != null && value.length < 4) {
                        return 'Please enter valid password';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 161, 18, 66),
                            padding: const EdgeInsets.all(10)),
                        child: const Text('Create Account'),
                        onPressed: () {
                          // It returns true if the form is valid, otherwise returns false
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => MyLogin(),
                              ),
                            );
                            //}
                          }
                        })),
                Container(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 161, 18, 66),
                          padding: const EdgeInsets.all(10)),
                      child: const Text('Already have an Account'),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => MyRegister(),
                          ),
                        );
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
