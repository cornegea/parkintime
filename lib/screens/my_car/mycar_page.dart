import 'package:flutter/material.dart';
import 'package:parkirtime/screens/my_car/manage_car.dart';
import 'package:parkirtime/screens/my_car/add_car.dart';

class ManageVehiclePage extends StatefulWidget {
  @override
  _ManageVehiclePageState createState() => _ManageVehiclePageState();
}

class _ManageVehiclePageState extends State<ManageVehiclePage> {
  final scrollController = ScrollController();
  List<Map<String, String>> vehicleList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 180,
                width: double.infinity,
                color: Colors.green,
                padding: EdgeInsets.only(top: 10, left: 16),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Choose a Car",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
          Positioned(
            top: 120,
            left: 16,
            right: 16,
            bottom: 100,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  if (vehicleList.isEmpty)
                    _buildEmptyCard()
                  else
                    ...vehicleList.map((vehicle) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _buildVehicleCard(
                        plate: vehicle["plate"]!,
                        brand: vehicle["brand"]!,
                        type: vehicle["type"]!,
                        color: vehicle["color"]!,
                        year: vehicle["year"]!,
                      ),
                    )),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            right: 24,
            child: FloatingActionButton(
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
              backgroundColor: Colors.green,
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleCard({
    required String plate,
    required String brand,
    required String type,
    required String color,
    required String year,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            plate,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Divider(),
          Row(
            children: [
              Image.asset("assets/car.png", height: 60),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  children: [
                    _buildDetail("Brand", brand),
                    _buildDetail("Type", type),
                    _buildDetail("Colour", color),
                    _buildDetail("Year", year),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ManageCarPage(
                    plate: plate,
                    brand: brand,
                    type: type,
                    color: color,
                    year: year,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Text("Manage", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Text(label, style: TextStyle(color: Colors.grey[600])),
          Spacer(),
          Text(
            value.toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyCard() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Center(
        child: Text(
          "No vehicles added yet",
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      ),
    );
  }
}
