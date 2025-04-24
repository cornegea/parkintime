import 'package:flutter/material.dart';
import 'package:parkirtime/screens/reservation/book_parking.dart';

class SelectVehiclePage extends StatefulWidget {
  @override
  _SelectVehiclePageState createState() => _SelectVehiclePageState();
}

class _SelectVehiclePageState extends State<SelectVehiclePage> {
  int? selectedVehicleIndex;

  final List<Map<String, String>> vehicles = [
    {"brand": "Daihatsu", "plate": "BP 1234 AA", "image": "assets/car.png"},
    {"brand": "Toyota", "plate": "BP 2341 AA", "image": "assets/car.png"},
    {"brand": "Honda Civic", "plate": "BP 3412 AA", "image": "assets/car.png"},
    {"brand": "Hyundai", "plate": "BP 4123 AA", "image": "assets/car.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Select Your Vehicle"),
        leading: BackButton(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: vehicles.length,
              itemBuilder: (context, index) {
                final vehicle = vehicles[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedVehicleIndex = index;
                    });
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Image.asset(vehicle['image']!, width: 50),
                      title: Text(vehicle['brand']!),
                      subtitle: Text(vehicle['plate']!),
                      trailing: Radio<int>(
                        value: index,
                        groupValue: selectedVehicleIndex,
                        onChanged: (value) {
                          setState(() {
                            selectedVehicleIndex = value;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed:
                  selectedVehicleIndex != null
                      ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) =>
                                    BookParkingDetailsPage(pricePerHour: 5000),
                          ),
                        );
                      }
                      : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text("Continue"),
            ),
          ),
        ],
      ),
    );
  }
}
  