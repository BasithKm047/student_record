import 'package:flutter/material.dart';

class ListedStudentDetails extends StatelessWidget {
   const ListedStudentDetails({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      body: Center(
        child: Expanded(
          child: ListView.separated(itemBuilder: (context, index) {
            return  ListTile(
              leading: Image.asset('Asset/person.jpg'),
            
              subtitle: Text(''),

            );
            
          },
           separatorBuilder: (context, index) => const Divider(),
            itemCount: 50)

        )
      ),
    );
  }


}