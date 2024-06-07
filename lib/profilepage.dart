import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? myKey}) : super(key: myKey);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isEditing = false;
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController(text: 'Ahad Hashmi');
  final _phoneController = TextEditingController(text: '03107085816');
  final _addressController = TextEditingController(text: 'abc address, xyz city');
  final _emailController = TextEditingController(text: 'ahadhashmideveloper@gmail.com');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/throne.jpg'),
              backgroundColor: Colors.red,
            ),
            const SizedBox(height: 20,),
            itemProfile('Name', _nameController, CupertinoIcons.person, _isEditing),
            const SizedBox(height: 10),
            itemProfile('Phone', _phoneController, CupertinoIcons.phone, _isEditing),
            const SizedBox(height: 10),
            itemProfile('Address', _addressController, CupertinoIcons.location, _isEditing),
            const SizedBox(height: 10),
            itemProfile('Email', _emailController, CupertinoIcons.mail, _isEditing),
            const SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: _isEditing
                 ? ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isEditing = false;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Add this line
                        padding: const EdgeInsets.all(15),
                      ),
                      child: const Text('Save')
                  )
                  : ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isEditing = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Add this line
                        padding: const EdgeInsets.all(15),
                      ),
                      child: const Text('Edit Profile')
                  ),
            )
          ],
        ),
      ),
    );
  }

  Widget itemProfile(String title, TextEditingController controller, IconData iconData, bool isEditing) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Colors.grey.withOpacity(.2),
                spreadRadius: 1.5,
                blurRadius: 10
            )
          ]
      ),
      child: ListTile(
        title: isEditing
           ? TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: title,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter $title';
                  }
                  return null;
                },
              )
            : Text(title),
        subtitle: isEditing
           ? null
            : Text(controller.text),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }
}
