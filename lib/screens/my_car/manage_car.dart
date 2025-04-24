import 'package:flutter/material.dart';

class ManageCarPage extends StatelessWidget {
  final String plate;
  final String brand;
  final String type;
  final String color;
  final String year;

  const ManageCarPage({
    required this.plate,
    required this.brand,
    required this.type,
    required this.color,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Manage Car'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),

          // Warning merah
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "* Vehicle data must match the actual data",
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Plat nomor tampilan seperti desain
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                plate,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Info Kendaraan
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _infoBox(brand),
                _infoBox(type),
                _infoBox(color),
                _infoBox(year),
              ],
            ),
          ),

          const Spacer(),

          // Tombol Aksi
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            color: Colors.grey[100],
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Hapus mobil
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("Remove Car"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Edit mobil
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("Edit Car"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoBox(String value) {
    return Container(
      width: 160,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        value.toUpperCase(),
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
