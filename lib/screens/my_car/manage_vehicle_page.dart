import 'package:flutter/material.dart';
import 'package:parkirtime/screens/manage_car.dart';

class ManageVehiclePage extends StatefulWidget {
  @override
  _ManageVehiclePageState createState() => _ManageVehiclePageState();
}

class _ManageVehiclePageState extends State<ManageVehiclePage> {
  bool showForm = false;
  bool showValidationError = false;

  final plateController = TextEditingController();
  final brandController = TextEditingController();
  final typeController = TextEditingController();
  final colorController = TextEditingController();
  final yearController = TextEditingController();

  final scrollController = ScrollController();

  List<Map<String, String>> vehicleList = [];

  void _addVehicle() {
    if (plateController.text.isEmpty ||
        brandController.text.isEmpty ||
        typeController.text.isEmpty ||
        colorController.text.isEmpty ||
        yearController.text.isEmpty) {
      setState(() {
        showValidationError = true;
      });
      return;
    }

    setState(() {
      vehicleList.add({
        "plate": plateController.text,
        "brand": brandController.text,
        "type": typeController.text,
        "color": colorController.text,
        "year": yearController.text,
      });

      plateController.clear();
      brandController.clear();
      typeController.clear();
      colorController.clear();
      yearController.clear();
      showValidationError = false;
      showForm = false;

      scrollController.animateTo(
        0.0,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
  }

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
                    SizedBox(height: 10),
                    Text(
                      showForm ? "Add Vehicle" : "Choose a Car",
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
                  if (!showForm) ...[
                    _buildVehicleCard(
                      plate: "BP1234YY",
                      brand: "TOYOTA",
                      type: "GTR86",
                      color: "BIRU",
                      year: "2024",
                    ),
                    SizedBox(height: 16),
                    _buildEmptyCard(),
                  ] else
                    _buildAddVehicleForm(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            right: 24,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  showForm = !showForm;
                  showValidationError = false;
                });
              },
              backgroundColor: Colors.green,
              child: Icon(
                showForm ? Icons.close : Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddVehicleForm() {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Add Vehicle",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              InkWell(
                onTap: () => setState(() => showForm = false),
                child: Icon(Icons.close, color: Colors.red),
              ),
            ],
          ),
          SizedBox(height: 8),
          if (showValidationError)
            Text(
              "* Vehicle data must match the actual data",
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          SizedBox(height: 8),
          _buildInput("Plate Number", plateController),
          _buildInput("Brand", brandController),
          _buildInput("Type", typeController),
          _buildInput("Colour", colorController),
          _buildInput("Year", yearController),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _addVehicle,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              padding: EdgeInsets.symmetric(vertical: 14),
            ),
            child: Center(
              child: Text("Add", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInput(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: EdgeInsets.symmetric(horizontal: 12),
        ),
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
                  builder:
                      (context) => ManageCarPage(
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
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
