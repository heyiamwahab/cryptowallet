import 'package:crypto_wallet/screens/homeview.dart';
import 'package:flutter/material.dart';
import 'package:crypto_wallet/services/firebase.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController _emailText = TextEditingController();
  TextEditingController _passwordText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.blue[200],
          ),
          child: Column(
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: 140, left: 30, right: 30, bottom: 60),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'please enter email',
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          )),
                      controller: _emailText,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: _passwordText,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.4,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent),
                child: MaterialButton(
                  onPressed: () async {
                    bool signup =
                        await signUp(_emailText.text, _passwordText.text);

                    if (signup) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Homeview(),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.4,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.greenAccent),
                child: MaterialButton(
                  onPressed: () async {
                    bool canNavigate = await signIn(
                        email: _emailText.text, password: _passwordText.text);
                    if (canNavigate) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Homeview()));
                    }
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
