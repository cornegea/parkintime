import 'package:flutter/material.dart';

class InformationSpotPage extends StatefulWidget {
  @override
  _InformationSpotPageState createState() => _InformationSpotPageState();
}

class _InformationSpotPageState extends State<InformationSpotPage> {
  int selectedFloor = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color(0xFF2ECC40),
        title: Text(
          'Information Spot',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Floor selector
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildFloorButton(1, "1st Floor"),
                SizedBox(width: 8),
                _buildFloorButton(2, "2nd Floor"),
                SizedBox(width: 8),
                _buildFloorButton(3, "3rd Floor"),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildParkingRow(['', 'A-06'], [true, false]),
                  _buildParkingRow(['A-02', ''], [false, true]),
                  _buildParkingRow(['', 'A-04'], [true, false]),
                  Divider(thickness: 1),
                  _buildParkingRow(['B-01', ''], [false, true]),
                  _buildParkingRow(['', 'B-05'], [true, false]),
                  _buildParkingRow(['B-03', 'B-04'], [false, false]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloorButton(int floor, String label) {
    final isSelected = floor == selectedFloor;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedFloor = floor;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Color(0xFF2ECC40) : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Color(0xFF2ECC40)),
        ),
      ),
      child: Text(label),
    );
  }

  Widget _buildParkingRow(List<String> labels, List<bool> hasCar) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: List.generate(2, (index) {
          return Expanded(
            child: Container(
              height: 80,
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color:
                    labels[index] == 'A-06'
                        ? Colors.green.shade50
                        : Colors.transparent,
                border: Border.all(
                  color: Colors.black26,
                  style: BorderStyle.solid,
                  width: labels[index].isNotEmpty ? 1 : 0,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child:
                  hasCar[index]
                      ? Image.asset(
                        'assets/car.png',
                      ) // Gambar mobil tampak atas
                      : Center(
                        child: Text(
                          labels[index],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
            ),
          );
        }),
      ),
    );
  }
}
