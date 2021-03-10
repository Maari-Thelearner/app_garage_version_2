import 'dart:html';
import 'package:appgarage/developer_console.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
class indexpage extends StatefulWidget {
  @override
  _indexpageState createState() => _indexpageState();
}

class _indexpageState extends State<indexpage> {
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: new DecorationImage(image: NetworkImage('https://i.pinimg.com/originals/0e/9e/88/0e9e8812f01f82650833264673bf51ed.jpg',
          ),fit: BoxFit.cover)
      ),
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.black87,
          height: 50.0,
          width: MediaQuery.of(context).size.width,
          child: Center(child: Text('Developer-console is only for Developer of the Website(Admin Community)'
              'If you want to join our community please contact us : bs.mari100@gmail.com',style: TextStyle(decoration: TextDecoration.none,fontSize: 10.0,color: Colors.white,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),)),
        ),
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          physics: ClampingScrollPhysics(),
          controller: controller,
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.orange,
              expandedHeight: 200.0,
              pinned: false,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text('Apps Garage'),
                background: Image.network('https://i.pinimg.com/originals/0e/9e/88/0e9e8812f01f82650833264673bf51ed.jpg',
                  fit: BoxFit.fitWidth,),
              ),
              actions: [
                FlatButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Developerconsole();
                  }));
                }, child: Text('Developer-console',),),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                List.generate(
                  3,
                      (index) => Column(
                   children: [
                       SizedBox(height: 30.0,),
                     if (index == 0) Container(
                       decoration: new BoxDecoration(
                         borderRadius: BorderRadius.circular(30.0),
                           image: DecorationImage(
                             image: NetworkImage("https://wallpaperaccess.com/full/43911.jpg"), fit: BoxFit.cover,),
                       ),
                    height: 500.0,
                   width: MediaQuery.of(context).size.width*0.8,
                          child: Center(
                            child: Container(
                              width: 300.0,
                              height: 80.0,
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.white60)
                                ),
                                hoverColor: Color(0xff1D4B6C),
                                hoverElevation: 100.0,
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return App();
                                  }));
                                },
                                child: Text('APP',style: TextStyle(decoration: TextDecoration.none,fontSize: 40.0,fontWeight: FontWeight.bold,color: Colors.white60),),
                              ),
                            ),
                          ),
                       ) else  index==1 ? Container(
                       height: 500.0,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(30.0),
                           image: DecorationImage(
                               image: NetworkImage(
                                   "https://www.jncreative.com/wp-content/uploads/2013/09/jn-creative-portfolio-background-1.jpg"), fit: BoxFit.cover,)),
                       width: MediaQuery.of(context).size.width*0.8,
                        child: Column(
                          children: [
                           ListTile(
                             leading: ClipOval(child: Image.network('https://i.ibb.co/XYtvmrr/b3afd95a-73fe-4e7f-bffb-ae00be8a7748.jpg',fit: BoxFit.cover,)),
                             title: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text('Developer Info',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.white60),),
                               ],
                             ),
                           ),
                            SizedBox(height: 80.0,),
                            ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(FontAwesomeIcons.userAlt,color: Colors.white70,),
                                  SizedBox(width: 20.0,),
                                  Text('Maari Flutter Developer',style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontSize: 20.0,color: Colors.white70),),
                                ],
                              ),
                            ),
                            SizedBox(height: 30.0,),
                            ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(FontAwesomeIcons.appStore,color: Colors.black87,),
                                  SizedBox(width: 20.0,),
                                  Text('App Garage Website',style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontSize: 20.0,color: Colors.black87),),
                                ],
                              ),
                            ),
                            SizedBox(height: 30.0,),
                            ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(FontAwesomeIcons.angleUp,color: Colors.white60,),
                                  SizedBox(width: 20.0,),
                                  Text('Path for Apps..',style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontSize: 20.0,color: Colors.white70),),
                                ],
                              ),
                            ),
                          ],
                        ),
                     ) : SizedBox(height: 30.0,)

                      ],
                ),
              ),
            )
            ),
          ],
        ),

      ),
    );
  }
}

/*CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xffD88836),
            expandedHeight: 200.0,
            pinned: true,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
                title: Text('Apps Garage'),
                background: Image.network('https://i.pinimg.com/originals/0e/9e/88/0e9e8812f01f82650833264673bf51ed.jpg',
                fit: BoxFit.fitWidth,),
            ),
            actions: [
             FlatButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                 return Developerconsole();
               }));
             }, child: Text('Developer-console',),),
            ],
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                SizedBox(height: 30.0,),
                Container(
                  color: Colors.blue,
                  height: 500.0,
                  width: MediaQuery.of(context).size.width*0.8,

                ),
              ],
            ),
            ),
        ],
      ) */

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  CollectionReference ref = FirebaseFirestore.instance.collection('users');
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: new DecorationImage(image: NetworkImage('https://wallpaperaccess.com/full/43911.jpg',
        ),fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: StreamBuilder(
          stream: ref.snapshots(),
      builder: (context,AsyncSnapshot<QuerySnapshot> snapshot ){
            if(snapshot.hasData){
              return CustomScrollView(
                physics: ClampingScrollPhysics(),
                controller: controller,
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.blue[800],
                    expandedHeight: 200.0,
                    pinned: false,
                    floating: false,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: false,
                      title: Text('Apps Store'),
                      background: Image.network('https://wallpaperaccess.com/full/43911.jpg',
                        fit: BoxFit.fitWidth,),
                    ),
                    actions: [
                      FlatButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Developerconsole();
                        }));
                      }, child: Text('Developer-console',style: TextStyle(color: Colors.white),),),
                    ],
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate.fixed(
                        List.generate(
                          snapshot.data.docs.length,
                              (index) => Column(
                                children: [
                                  index==0 ? SizedBox(height: 30.0,) : SizedBox(height: 10.0,),
                                  Card(
                                    color: Colors.transparent,
                                    borderOnForeground: true,
                                    child: ListTile(
                                      onTap: (){},
                                      leading: Icon(snapshot.data.docs[index].data()['ios'] == 'yes' ? FontAwesomeIcons.apple : FontAwesomeIcons.android,color: Colors.white,),
                                      title: Text(snapshot.data.docs[index].data()['appname'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                      trailing: RaisedButton(
                                        onPressed: () {
                                          launch(snapshot.data.docs[index].data()['apklink'].toString());
                                        },
                                        color: Colors.blue[800],
                                        child: Text(snapshot.data.docs[index].data()['appstate'],style: TextStyle(color: Color(0xffdfe3ee) ),),
                                      ),
                                    ),
                                  ),
                                  Divider(color: Colors.white60,thickness: 2.0,),
                                  index == snapshot.data.docs.length-1 ? SizedBox(height: 30.0,) : SizedBox(),
                                 ],
                              ),
                        ),
                      )
                  ),
                ],
              );
            }
            else
              {
                return Center(child: CircularProgressIndicator(),);
              }
      }
        ),
      ),
    );
  }
}


//CollectionReference ref = FirebaseFirestore.instance.collection('users');

/* StreamBuilder(
                    stream: ref.snapshots(),
                    builder: (context,AsyncSnapshot<QuerySnapshot> snapshot ){
    if(snapshot!=null){
    return ListView.builder(itemCount: snapshot.hasData ? snapshot.data.docs.length : 0,
    itemBuilder: (_,index){
    return Card(
    child: ListTile(
      leading: Icon(snapshot.data.docs[index].data()['ios'] == 'yes' ? FontAwesomeIcons.apple : FontAwesomeIcons.android),
    title: Text(snapshot.data.docs[index].data()['appname']),
      trailing: RaisedButton(
        onPressed: () {
        launch(snapshot.data.docs[index].data()['apklink'].toString());
        },
        color: Colors.blue[800],
        child: Text('install',style: TextStyle(color: Color(0xffdfe3ee) ),),
      ),
    ),
    );
    });
    }else{return Center(child: CircularProgressIndicator(),);}
                    }) */