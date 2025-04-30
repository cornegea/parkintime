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
        backgroundColor: const Color.fromARGB(255, 31, 172, 85),
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey.shade300,
              ),
            ),
            const SizedBox(height: 40),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Name", style: TextStyle(fontSize: 14)),
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(border: UnderlineInputBorder()),
            ),
            const SizedBox(height: 20),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Email", style: TextStyle(fontSize: 14)),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(border: UnderlineInputBorder()),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 40), // Jarak antara input field dan tombol

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF02A944),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
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
