
import 'package:flutter/material.dart';
import 'package:student_record/model/datamodel.dart';

ValueNotifier<List<studentdata>> studentList=ValueNotifier([]);

void addStudent(studentdata value) {
  studentList.value.add(value);
  print(value.toString());
}
