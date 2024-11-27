
import 'package:flutter/material.dart';
import 'EditProfileScreen.dart';
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "Sam";
  String email = "SAM@gmail.com";
  String phone = "+775567890";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("images/person.jpg"),
            ),
            SizedBox(height: 20),
            Text(
              "Name: $name",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Email: $email",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Phone: $phone",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileScreen(
                      initialName: name,
                      initialEmail: email,
                      initialPhone: phone,
                    ),
                  ),
                );

                if (result != null) {
                  setState(() {
                    name = result['name'];
                    email = result['email'];
                    phone = result['phone'];
                  });
                }
              },
              child: Text("Edit"),
            ),
          ],
        ),
      ),
    );
  }
}
