import 'package:flutter/material.dart';

class AddCarScreen extends StatefulWidget {
  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  final TextEditingController _plateController = TextEditingController();
  final TextEditingController _chassisController = TextEditingController();

  Map<String, String>? _vehicleData;

  void _fetchVehicleData() {
    // Simulasi data berdasarkan plat & nomor rangka
    if (_plateController.text.isNotEmpty &&
        _chassisController.text.length == 4) {
      setState(() {
        _vehicleData = {
          "Registration Number": _plateController.text.toUpperCase(),
          "Name of Owner": "Ayang",
          "Brand": "TOYOTA",
          "Type": "GR86/AT",
          "Category": "Sedan",
          "Color": "BIRU",
          "Manufacture Year": "2024",
          "Cylinder Capacity": "2000",
          "Energy Source": "Bensin",
          "License Plate Color": "Putih",
        };
      });
    } else {
      setState(() {
        _vehicleData = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Add Car",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "* Vehicle data must match the actual data",
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
            const SizedBox(height: 16),

            // Input Plat Nomor
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Center(
                child: TextField(
                  controller: _plateController,
                  onChanged: (_) => _fetchVehicleData(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "BP1234YY",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text("Last 4 digits of chassis number"),
            const SizedBox(height: 8),
            TextField(
              controller: _chassisController,
              onChanged: (_) => _fetchVehicleData(),
              keyboardType: TextInputType.number,
              maxLength: 4,
              decoration: InputDecoration(
                counterText: '',
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: "9999",
              ),
            ),

            const SizedBox(height: 20),

            // Data Mobil Muncul
            if (_vehicleData != null)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      _vehicleData!.entries.map((entry) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Text(
                                  "${entry.key}:",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Text(
                                  entry.value,
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                ),
              ),

            const SizedBox(height: 30),

            // Tombol Add Car
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed:
                    _vehicleData != null
                        ? () {
                          // Simpan mobil ke backend
                        }
                        : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Add Car", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
