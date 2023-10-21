import 'package:flutter/material.dart';


class ContactDetail extends StatelessWidget {
  const ContactDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Scaffold(appBar:AppBar(title: Text('Detail'),

      backgroundColor: Colors.brown,
      elevation: 0,
      
      
 ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(child: CircleAvatar(
            maxRadius: 60,
            backgroundColor: Colors.brown,
          
          )),

          Expanded(child: ListView(children: [

         SizedBox(height: 70,),
    
            Card(
              child: const Text('John Doe',style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,

              
                color: Colors.brown
              ),
              textAlign: TextAlign.center,
              
              ),
              
            ),

           

            SizedBox(height: 50,),

            Card(
              
              
              child: const Text('07065378',
          
            
            style: TextStyle(fontSize: 30,color: Colors.brown,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),
            
            textAlign: TextAlign.center,

            ),
            
            ),
            SizedBox(height: 30,),
       
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    TextButton(onPressed: () {}, child: Icon(Icons.edit)),
                          TextButton(
                              onPressed: () {}, child: Icon(Icons.delete,
                              color: Colors.red,
                              
                              )),
         
  ],
)

          ],),)

          



        ],
      )     
    )      
    );                         
  }
} 