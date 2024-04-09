// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, implementation_imports

import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/src/widgets/framework.dart';

class DrawerPage extends StatefulWidget {
  
  const DrawerPage({super.key, required this.high});

  final int high;
  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


    void shoWSoon(){
    showDialog(context: this.context, builder: (context) => AlertDialog(
      backgroundColor: const Color.fromARGB(255, 51, 49, 44),
      
      content: Container(
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
        ),
        
        child:Center(child: Text("Comming Soon",style: TextStyle(color: Colors.white,fontSize: 20),)),
      ),
      
      
    ));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Container(
            padding: EdgeInsets.symmetric(vertical: 40,horizontal: 5),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(43, 35, 39, 1),
                  Color.fromRGBO(74, 22, 38, 1)
                ]
              )
            ),
            
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white24,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        ),
                    
                    title: Text("User",style: TextStyle(color: Colors.white,fontSize: 18),),
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: () {
                        shoWSoon();
                      },
                      child: ListTile(   
                      leading: Icon(Icons.leaderboard,color: Colors.white,size: 24,),
                      title: Text("Leaderboard",style: TextStyle(color: Colors.white,fontSize: 18),),
                      ),
                    ),
                  ],
                )
              )
            
          ),
      
    );
    
  }
}