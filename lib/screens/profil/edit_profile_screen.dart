import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController(
    text: "Ayang",
  );
  final TextEditingController emailController = TextEditingController(
    text: "user123@email.com",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
        title: Text("Edit Profile", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            // Foto profil
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey.shade300,
              ),
            ),
            SizedBox(height: 40),

            // Nama
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Name", style: TextStyle(fontSize: 14)),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(border: UnderlineInputBorder()),
            ),
            SizedBox(height: 20),

            // Email
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Email", style: TextStyle(fontSize: 14)),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(border: UnderlineInputBorder()),
              keyboardType: TextInputType.emailAddress,
            ),
            Spacer(),

            // Tombol Save
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF02A944),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  // Simpan data di sini (opsional)
                  Navigator.pop(context);
                },
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
