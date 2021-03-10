import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
class Developer_console_homepage extends StatefulWidget {
  @override
  _Developer_console_homepageState createState() => _Developer_console_homepageState();
}

class _Developer_console_homepageState extends State<Developer_console_homepage> {
  final GlobalKey<FormState> formkey =new GlobalKey<FormState>();
  final GlobalKey<FormState> iosformkey =new GlobalKey<FormState>();
  final Dbreference = FirebaseFirestore.instance.collection('users');
  final TextEditingController appnamecontroller = new TextEditingController();
  final TextEditingController apklinkcontroller = new TextEditingController();
  final TextEditingController iosappnamecontroller = new TextEditingController();
  final TextEditingController dmglinkcontroller = new TextEditingController();
  String androidvaluechoose;
  List androiditemlist = [
    'Install' , 'Update'
  ];
  String iosvaluechoose;
  List iositemlist = [
    'Install' , 'Update'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xffdfe3ee),
      appBar: AppBar(
        toolbarHeight: 150.0,
        title: Text('App details',style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 35.0,color: Color(0xffdfe3ee)),),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30.0,),
            Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text('Android app details',style: TextStyle(fontSize: 20.0,)
                  ),],),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.6,
                    child: TextFormField(
                      controller: appnamecontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(FontAwesomeIcons.android),
                        filled: true,
                        labelText: 'App Name',
                        hintText: 'Enter your app name',
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
                          return 'please enter Android app name';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(width: MediaQuery.of(context).size.width*0.6,
                    child: TextFormField(
                      controller: apklinkcontroller,decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.link),
                      filled: true,
                      labelText: 'apk Link',
                      hintText: 'Enter the downloading apk link',
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
                          return 'please enter app link';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Select the app state'),
                      SizedBox(width: 50.0,),
                      DropdownButton(
                        hint: Text('Select'),
                        icon: Icon(FontAwesomeIcons.angleDown),
                        value: androidvaluechoose,
                        onChanged: (newvalue){
                          setState(() {
                            androidvaluechoose = newvalue;
                          });
                        },
                        items: androiditemlist.map((valueItem){
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width*0.6,
                    child: FlatButton(
                      color: Colors.blue[800],
                      onPressed: () async{
                        if(formkey.currentState.validate()){
                          Dbreference.add({
                            'appname' : appnamecontroller.text.trim().toString(),
                            'apklink' : apklinkcontroller.text.trim().toString(),
                            'ios' : 'no',
                            'appstate' : androidvaluechoose.toString(),
                          }).then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Your app is Register to our page'),))).catchError((error)=>ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Something error like this $error'))));
                        }
                        appnamecontroller.clear();
                        apklinkcontroller.clear();
                      },child: Text('Create',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Color(0xffdfe3ee) ),),),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0,),
            Row(children: [
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 2.0,
                    )),
              ),
              Text("OR"),
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 2.0,
                    )),
              ),
            ]),
            SizedBox(height: 30.0,),
            Form(
              key: iosformkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('IOS app details',style: TextStyle(fontSize: 20.0,)
                      ),],),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.6,
                    child: TextFormField(
                      controller: iosappnamecontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(FontAwesomeIcons.apple),
                        filled: true,
                        labelText: 'App Name',
                        hintText: 'Enter your app name',
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
                          return 'please enter IOS app name';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(width: MediaQuery.of(context).size.width*0.6,
                    child: TextFormField(
                      controller: dmglinkcontroller,decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.link),
                      filled: true,
                      labelText: 'ios app Link',
                      hintText: 'Enter the downloading iosapp link',
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
                          return 'please enter IOS app name';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Select the app state'),
                      SizedBox(width: 50.0,),
                      DropdownButton(
                        hint: Text('Select'),
                        icon: Icon(FontAwesomeIcons.angleDown),
                        value: iosvaluechoose,
                        onChanged: (newvalue){
                          setState(() {
                            iosvaluechoose = newvalue;
                          });
                        },
                        items: iositemlist.map((valueItem){
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width*0.6,
                    child: FlatButton(
                      color: Colors.blue[800],
                      onPressed: () async{
                        if(iosformkey.currentState.validate()){
                          Dbreference.add({
                            'appname' : iosappnamecontroller.text.trim().toString(),
                            'apklink' : dmglinkcontroller.text.trim().toString(),
                            'ios' : 'yes',
                            'appstate' : iosvaluechoose.toString(),
                          }).then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Your app is Register to our page'),))).catchError((error)=>ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Something error like this $error'))));
                        }
                        iosappnamecontroller.clear();
                        dmglinkcontroller.clear();
                      },child: Text('Create',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Color(0xffdfe3ee) ),),),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0,),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[800],
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return Edit();
          }));
        },
        child: Icon(FontAwesomeIcons.edit),
      ),
    );
  }
}
class Edit extends StatefulWidget {
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  CollectionReference ref = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150.0,
        title: Text('Manage App details',style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 35.0,color: Color(0xffdfe3ee)),),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white60,
        onPressed: (){
          ref.getDocuments().then((snapshot){
            for(DocumentSnapshot doc in snapshot.documents){
              doc.reference.delete();
            }
          }).then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('All Data is deleted')))).catchError((error) =>
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error message $error')))
          );
        },
        child: Icon(FontAwesomeIcons.solidTrashAlt,color: Colors.red[900],),
      ),
      body: StreamBuilder(
        stream: ref.snapshots(),
        builder:(context,AsyncSnapshot<QuerySnapshot> snapshot ){
         if(snapshot!=null)
           {
             return ListView.builder(
               itemCount: snapshot.hasData ? snapshot.data.docs.length : 0,
           itemBuilder: (_,index){
                 return Card(
                   child: ListTile(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context){
                         return Editpage(docToEdit: snapshot.data.docs[index],);
                       }));
                     },
                     leading: Icon(snapshot.data.docs[index].data()['ios'] == 'yes' ? FontAwesomeIcons.apple : FontAwesomeIcons.android),
                     title: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text(snapshot.data.docs[index].data()['appname']),
                         RaisedButton(
                           onPressed: () {
                             launch(snapshot.data.docs[index].data()['apklink'].toString());
                           },
                           color: Colors.blue[800],
                           child: Text(snapshot.data.docs[index].data()['appstate']=='null' ? 'Install' : snapshot.data.docs[index].data()['appstate'],style: TextStyle(color: Color(0xffdfe3ee) ),),
                         ),
                       ],
                     ),
                     trailing: IconButton(icon: Icon(FontAwesomeIcons.trash,color: Colors.red,), onPressed: (){
                         String id  = snapshot.data.docs[index].id;
                         ref.doc(id).delete().then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Content Deleted.'))))
                             .catchError((error) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to delete .. Error : $error'))));
                       })
                   ),
                 );
           }
             );
           }
         else
           {
            return Center(child: CircularProgressIndicator(),);
           }
        },
      ),
    );
  }
}

class Editpage extends StatefulWidget {
  DocumentSnapshot docToEdit;
  Editpage({this.docToEdit});
  @override
  _EditpageState createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {
  TextEditingController editname = TextEditingController();
  TextEditingController editlink = TextEditingController();
  String valuechoose;
  List itemlist = ['Install', 'Update'];
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();
  @override
  void initState() {
    editname = TextEditingController(text: widget.docToEdit.data()['appname']);
    editlink = TextEditingController(text: widget.docToEdit.data()['apklink']);
    valuechoose = widget.docToEdit.data()['appstate'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150.0,
        title: Text('Edit ${editname.text} app details',style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 35.0,color: Color(0xffdfe3ee)),),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30.0,),
            Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.6,
                    child: TextFormField(
                      controller: editname,
                      decoration: InputDecoration(
                        prefixIcon: Icon(FontAwesomeIcons.android),
                        filled: true,
                        labelText: 'App Name',
                        hintText: 'Enter your app name',
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
                          return 'please enter Android app name';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(width: MediaQuery.of(context).size.width*0.6,
                    child: TextFormField(
                      controller: editlink,decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.link),
                      filled: true,
                      labelText: 'apk Link',
                      hintText: 'Enter the downloading apk link',
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
                          return 'please enter app link';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Select the app state'),
                      SizedBox(width: 50.0,),
                      DropdownButton(
                        hint: Text('Select'),
                        icon: Icon(FontAwesomeIcons.angleDown),
                        value: valuechoose,
                        onChanged: (newvalue){
                          setState(() {
                            valuechoose = newvalue;
                          });
                        },
                        items: itemlist.map((valueItem){
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width*0.6,
                    child: FlatButton(
                      color: Colors.blue[800],onPressed: (){
                        if(formkey.currentState.validate()){
                          widget.docToEdit.reference.update({
                            'appname' : editname.text,
                            'apklink' : editlink.text,
                            'appstate' : valuechoose,
                          }).then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('App Details is updated..')))).catchError((error) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Something error like this $error'))));
                        }
                    },
                      child: Text('Save',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Color(0xffdfe3ee) ),),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
