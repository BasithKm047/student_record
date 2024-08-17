import 'package:flutter/material.dart';
import 'package:student_record/grid_student_details.dart';
import 'package:student_record/listed_student_details.dart';
import 'package:student_record/useradd.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _StudentdetailsScreenState();
}

class _StudentdetailsScreenState extends State<HomeScreen> {
  int _currentindex = 0;
  List onTapWidgets = [
    const ListedStudentDetails(),
    const GridStudentDetails()
  ];
  var isVisble = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Align(
          alignment: Alignment.center,
          child: Text(
              style: TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 223, 217, 217)),
              textAlign: TextAlign.center,
              'Student Details'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 33),
            child: IconButton(
              alignment: Alignment.center,
              onPressed: () {
                setState(() {
                  isVisble = !isVisble;
                });
              },
              icon: const Icon(size: 30, Icons.search),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          isVisble
              ? Expanded(
                flex: 1,
                child: onTapWidgets.elementAt(_currentindex),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        label: Text('Search'),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                  ),
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => USeraddScreen()));
        },
        child: const Icon(Icons.person_add_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color.fromARGB(255, 182, 180, 180),
          backgroundColor: Colors.blue,
          showUnselectedLabels: false,
          currentIndex: _currentindex,
          onTap: (int index) {
            setState(() {
              _currentindex = index;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_4x4),
              label: 'Grid',
            ),
          ]),
    );
  }
}
