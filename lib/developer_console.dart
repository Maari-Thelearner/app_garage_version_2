import 'package:appgarage/developer_console_homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Developerconsole extends StatefulWidget {
  @override
  _DeveloperconsoleState createState() => _DeveloperconsoleState();
}

class _DeveloperconsoleState extends State<Developerconsole> {
  final GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  final TextEditingController email = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  bool _obscureText = true;

  String _password;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0.0,),
      body: Center(
        child: Form(
          key: _formkey,
          child: Container(
            height: MediaQuery.of(context).size.height*0.6,
            width: MediaQuery.of(context).size.width*0.7,
            child: Card(
              color:  Color(0xffdfe3ee),
              elevation: 16.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text('Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40.0,fontStyle: FontStyle.italic),),),
                  SizedBox(height: 40.0,),
                  Container(
                    width: 500.0,
                    child: TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(FontAwesomeIcons.userAlt),
                        filled: true,
                        labelText: 'UserEmail',
                        hintText: 'Enter the Email ID',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(30)),

                        ),
                      ),
                      validator: (value){
                        if(value.isEmpty){
                          return 'Please enter email';
                        }
                        else if(!value.contains('@'))
                          {
                            return 'Please enter valid email';
                          }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    width: 500.0,
                    child: TextFormField(
                      controller: password,
                      obscureText: _obscureText,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(icon: _obscureText ? Icon(FontAwesomeIcons.lock) :  Icon(FontAwesomeIcons.lockOpen),onPressed: _toggle,),
                        prefixIcon: Icon(FontAwesomeIcons.key),
                        filled: true,
                        labelText: 'Password',
                        hintText: 'Enter password',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(30)),

                        ),
                      ),
                      validator: (value){
                        if(value.isEmpty){
                          return 'Please enter email';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    height: 50.0,
                    width: 200.0,
                    child: RaisedButton(
                      color: Colors.blue[800],
                      onPressed: () async{
                      if(_formkey.currentState.validate()){
                        try {
                          UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: email.text.trim().toString(),
                              password: password.text.trim().toString()
                          ).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context){
                            return Developer_console_homepage();
                          })));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('user-not-found'),elevation: 16.0,backgroundColor: Colors.red,));
                          } else if (e.code == 'wrong-password') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('wrong-password'),elevation: 16.0,backgroundColor: Colors.red[900],));
                          }
                        }
                      }
                      email.clear();
                      password.clear();
                    },child: Text('Login',style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 20.0,color: Color(0xffdfe3ee)),),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
