import 'package:flutter/material.dart';

class ViewDetailCarPage extends StatelessWidget {
  final Map<String, String> carData;

  const ViewDetailCarPage({super.key, required this.carData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Manage Car"),
        leading: const BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '* Vehicle data must match the actual data',
              style: TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  carData['plate'] ?? '',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Last 4 digits of chassis number"),
            ),
            const SizedBox(height: 6),
            const TextField(
              decoration: InputDecoration(
                hintText: '9999',
                border: OutlineInputBorder(),
              ),
            ),
            const Divider(height: 32, thickness: 1),
            _buildDetailItem("Registration Number", carData["plate"]),
            _buildDetailItem("Name of Owner", carData["owner"]),
            _buildDetailItem("Brand", carData["brand"]),
            _buildDetailItem("Type", carData["type"]),
            _buildDetailItem("Category", carData["category"]),
            _buildDetailItem("Color", carData["color"]),
            _buildDetailItem("Manufacture Year", carData["year"]),
            _buildDetailItem("Cylinder Capacity", carData["capacity"]),
            _buildDetailItem("Energy Source", carData["energy"]),
            _buildDetailItem("Licence Plate Color", carData["plateColor"]),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: handle remove
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Remove Car"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Expanded(
            child: Text(
              value?.toUpperCase() ?? '-',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
