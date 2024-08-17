import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GridStudentDetails extends StatelessWidget {
  const GridStudentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemBuilder: (context, index) {
            return  Container(
              color: Colors.blue,
              child:const Column(
                children: [
                  CircleAvatar(radius: 40,
                    backgroundImage: AssetImage('Asset/person.jpg'),
                  ),
                  
  

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
