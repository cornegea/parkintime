import 'package:flutter/material.dart';

class AddCarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Add Car", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "* Vehicle data must match the actual data",
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
            SizedBox(height: 10),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text("Upload STNK Image")),
            ),
            SizedBox(height: 20),
            Text("Last 4 digits of chassis number"),
            SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "XXXX",
              ),
            ),
            SizedBox(height: 20),
            ..._buildFieldList([
              "Registration Number",
              "Name of Owner",
              "Brand",
              "Type",
              "Category",
              "Color",
              "Manufacture Year",
              "Cylinder Capacity",
              "Energy Source",
              "License Plate Color",
            ]),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // simpan data mobil
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text("Add Car", style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildFieldList(List<String> fields) {
    return fields.map((label) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label),
            SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(border: UnderlineInputBorder()),
            ),
          ],
        ),
      );
    }).toList();
  }
}
