// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'user_provider.dart';

class HomePage extends StatelessWidget {

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(BuildContext context) async {
   
    final newImage = await _picker.pickImage(source: ImageSource.gallery); 
   
    if (newImage != null) {
      final image = File(newImage.path);
      context.read<UserProvider>().updateAvatar(FileImage(image));
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();

    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: userProvider.avatar,
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: Icon(Icons.edit, color: Colors.white),
                          onPressed: () => _pickImage(context),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(userProvider.name, style: TextStyle(color: Colors.white, fontSize: 18)),
                  Text(userProvider.email, style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: Center(child: Text('Welcome ${userProvider.name}!')),
    );
  }
}
