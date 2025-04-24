import 'package:flutter/material.dart';
import 'package:parkirtime/screens/profil/edit_profile_screen.dart';
import 'package:parkirtime/screens/profil/change_password_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F3F3),
      body: Column(
        children: [
          // Header hijau
          Container(
            width: double.infinity,
            color: Color(0xFF2ECC40),
            padding: const EdgeInsets.only(top: 60, bottom: 20),
            child: Column(
              children: [
                CircleAvatar(radius: 40, backgroundColor: Colors.grey.shade300),
                const SizedBox(height: 10),
                Text(
                  "Ayang",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "6281234567890",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),

          // Card menu
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildMenuItem(Icons.edit, "Edit Profile", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfileScreen(),
                      ),
                    );
                  }),
                  Divider(height: 1),
                  _buildMenuItem(Icons.lock_outline, "Change Password", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangePasswordScreen(),
                      ),
                    );
                  }),

                  Divider(height: 1),
                  _buildMenuItem(Icons.directions_car_filled, "My Car", () {}),
                ],
              ),
            ),
          ),

          Spacer(),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String text, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(text),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
