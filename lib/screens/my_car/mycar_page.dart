import 'package:flutter/material.dart';
import 'package:parkirtime/screens/my_car/view_detail_car.dart';
import 'package:parkirtime/screens/my_car/add_car.dart';

class ManageVehiclePage extends StatefulWidget {
  @override
  _ManageVehiclePageState createState() => _ManageVehiclePageState();
}

class _ManageVehiclePageState extends State<ManageVehiclePage> {
  final scrollController = ScrollController();

  List<Map<String, String>> vehicleList = [
    {
      "plate": "BP1234YY",
      "brand": "TOYOTA",
      "type": "GR86/AT",
      "category": "Sedan",
      "color": "BIRU",
      "year": "2024",
      "plateColor": "Putih",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child:
                  vehicleList.isEmpty
                      ? _buildEmptyState()
                      : ListView.builder(
                        controller: scrollController,
                        itemCount: vehicleList.length,
                        itemBuilder: (context, index) {
                          final vehicle = vehicleList[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: _buildVehicleCard(
                              plate: vehicle["plate"]!,
                              brand: vehicle["brand"]!,
                              type: vehicle["type"]!,
                              category: vehicle["category"] ?? "-",
                              color: vehicle["color"]!,
                              year: vehicle["year"]!,
                              plateColor: vehicle["plateColor"] ?? "-",
                            ),
                          );
                        },
                      ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 120,
      padding: EdgeInsets.only(top: 40, left: 16, right: 16),
      decoration: BoxDecoration(color: Color(0xFF2ECC40)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          Text(
            "My Car",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () async {
              final newVehicle = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddCarScreen()),
              );
              if (newVehicle != null && newVehicle is Map<String, String>) {
                setState(() {
                  vehicleList.add(newVehicle);
                  scrollController.animateTo(
                    0.0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                  );
                });
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleCard({
    required String plate,
    required String brand,
    required String type,
    required String category,
    required String color,
    required String year,
    required String plateColor,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            plate,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Divider(height: 24, color: Colors.grey.shade300),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/mobil.png", width: 80, height: 80),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow("Brand", brand),
                    _buildDetailRow("Type", type),
                    _buildDetailRow("Category", category),
                    _buildDetailRow("Color", color),
                    _buildDetailRow("Manufacture Year", year),
                    _buildDetailRow("License Plate Color", plateColor),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => ViewDetailCarPage(
                          carData: {
                            "plate": plate,
                            "brand": brand,
                            "type": type,
                            "color": color,
                            "year": year,
                            "owner": "Ayang",
                            "category": category,
                            "capacity": "2000",
                            "energy": "Bensin",
                            "plateColor": plateColor,
                          },
                        ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2ECC40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(vertical: 14),
              ),
              child: Text(
                "View Detail",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 12, // Ukuran diperkecil
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              value.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12, // Ukuran diperkecil
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.directions_car_filled, size: 100, color: Colors.grey[400]),
          SizedBox(height: 16),
          Text(
            "No cars added yet",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
