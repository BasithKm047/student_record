import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_record/displaystudent.dart';
import 'package:student_record/model/datamodel.dart';

class USeraddScreen extends StatefulWidget {
  const USeraddScreen({super.key});

  @override
  State<USeraddScreen> createState() => _USeraddScreenState();
}

class _USeraddScreenState extends State<USeraddScreen> {
  // final _formKey=GlobalKey<FormState>();
  final _nameController=TextEditingController();
  final _ageController=TextEditingController();
  final _ClassController=TextEditingController();
  final _mobileNumberController=TextEditingController();
  final _guardianNameController=TextEditingController();

   File? _image;
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(33.0),
        child: Align(
          alignment: Alignment.center,
          child: ListView(
            // physics: const NeverScrollableScrollPhysics(),
            children:[
              Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    getimage();
                  },
                  child: Container(
                    width:100,
                    height:100,
                  
                    decoration:  BoxDecoration(
                      color: Colors.amber,
                      borderRadius: const BorderRadius.all(Radius.circular(100)),
                      image:DecorationImage(
                        fit: BoxFit.cover,
                        image: _image==null? const AssetImage('Asset/person.jpg'):FileImage(
                        
                          _image!
                          ),
                        
                        
                        ),
                      
                    ),
                    
                   
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: '',
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if(value==null||value.isEmpty){
                        return 'Enter a Name';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Age',
                      hintText: '',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if(value==null||value.isEmpty){
                        return 'Enter a Age';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Class',
                      hintText: '',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if(value==null||value.isEmpty){
                        return 'Enter a Class';
                      }
                      return null;
                    },
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    
                      labelText: 'Guardian Name',
                    ),
                  
                    
                    validator: (value){
                      
                      if(value==null||value.isEmpty){
                        return 'Enter Guardian Name';

                      }
                      return null;
                      
                    
                    }
                    ,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Mobile Number',
                      hintText: '',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if(value==null||value.isEmpty){
                        return 'Enter a Mobile number';
                      }
                      return null;
                    },
                  ),
                
                ),
               
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: (){
                    adduser();
                  }, 
                child: const Text('Submit'),
                ),
              ],
            ),
          
            ] 
          ),
        ),
      ),
    );
  }


  Future<void>adduser()async{
final name=_nameController.text.trim();
final age=int.tryParse(_ageController.text.trim()) ;
final Class=int.tryParse(_ClassController.text.trim());
final guardian=_guardianNameController.text.trim();
final mobileNumber=int.tryParse(_mobileNumberController.text.trim()) ;

if(name.isEmpty||age==null||Class==null||guardian.isEmpty||mobileNumber==null){
    return ;

}else{

final userDetials= studentdata(name: name, age: age, Class: Class, mobileNumber: mobileNumber, Guardian: guardian);
addStudent(userDetials);

  
}

  

  }

  Future<void>getimage()async{
    final selectedimage=await ImagePicker().pickImage(source: ImageSource.gallery);
    if (selectedimage==null) return ;
      final imageTemborory=File(selectedimage.path);

      setState(() {
        _image=imageTemborory;
      });


  }
}
