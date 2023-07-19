// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class HomePage extends StatelessWidget {
//   HomePage({super.key});
//
//   final user = FirebaseAuth.instance.currentUser!;
//   void signUserOut(){
//     FirebaseAuth.instance.signOut();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         actions: [
//           IconButton(
//               onPressed: signUserOut,
//               icon: const Icon(Icons.logout),
//           )
//         ],
//       ),
//       body: Center(
//           child: Text(
//               "Logged In as: ${user.email!}",
//             style:TextStyle(fontSize: 20),
//           )
//       ),
//     );
//   }
// }

// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, deprecated_member_use

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Uint8List? _imageBytes;
  String? _apiResponse = ''; // Response from the API

  final user = FirebaseAuth.instance.currentUser!;
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  final picker = ImagePicker();

  Future<void> getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
        _apiResponse =
            null; // Reset the API response when a new image is selected
      });
    } else {
      // ignore: avoid_print
      print('No image selected.');
    }
  }

  Future<void> saveImage() async {
    if (_imageBytes != null) {
      // Create a MultipartRequest
      var request = http.MultipartRequest('POST',
          Uri.parse('https://tanujbordikar.pythonanywhere.com/predict'));

      // Create a MultipartFile from _imageBytes
      var file = http.MultipartFile.fromBytes('image', _imageBytes as List<int>,
          filename: 'image.jpg');

      // Add the file to the request
      request.files.add(file);

      // Send the request and get the response
      var response = await request.send();

      // Read the response
      var responseBody = await response.stream.bytesToString();

      // Update the state with the API response
      setState(() {
        _apiResponse = responseBody;
      });

      // ignore: avoid_print
      print('API Response: $_apiResponse'); // Print the API response
    } else {
      // ignore: avoid_print
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Plant Disease Detection'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Container(
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          // ignore: prefer_const_constructors
          gradient: LinearGradient(
            // ignore: prefer_const_literals_to_create_immutables
            colors: [Colors.white60, Colors.white24],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 100, horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        // ignore: prefer_const_constructors
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: _imageBytes == null
                        ? Text(
                            'No image selected.',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.grey[400],
                            ),
                          )
                        : Image.memory(
                            _imageBytes!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                  ),
                ),
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(height: 20),
            // Container to display API response
            Container(
              width: 200,
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              child: Padding(
                // ignore: prefer_const_constructors
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    _apiResponse ?? 'No disease',
                    textAlign: TextAlign.center,
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            // ignore: prefer_const_constructors
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: getImage,
                // ignore: prefer_const_constructors, sort_child_properties_last
                child: Text('Select Image'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  textStyle:
                      // ignore: prefer_const_constructors
                      TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  // ignore: prefer_const_constructors
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: saveImage,
                // ignore: prefer_const_constructors, sort_child_properties_last
                child: Text('Predict'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  // ignore: prefer_const_constructors
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  // ignore: prefer_const_constructors
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
