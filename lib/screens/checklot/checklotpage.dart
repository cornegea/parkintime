import 'package:flutter/material.dart';
import 'package:parkirtime/screens/checklot/information_spot_page.dart';

class CheckLotPage extends StatelessWidget {
  final List<Map<String, dynamic>> parkingData = [
    {
      "name": "Grand Batam Mall",
      "address": "Jl. Pembangunan, Batu Selicin, Lubuk Baja",
      "price": "Rp 5.000",
      "capacity": "80/100",
      "status": "Tersedia",
    },
    {
      "name": "Mega Mall Batam Center",
      "address": "Jl. Engku Putri No.1, Belian, Kec. Batam Kota",
      "price": "Rp 5.000",
      "capacity": "95/100",
      "status": "Hampir Penuh",
    },
    {
      "name": "Nagoya Hill Mall",
      "address": "Jl. Nagoya Hill, Lubuk Baja Kota, Kec. Lubuk Baja",
      "price": "Rp 5.000",
      "capacity": "100/100",
      "status": "Penuh",
    },
  ];

  Color _statusColor(String status) {
    switch (status) {
      case "Tersedia":
        return Colors.green.shade100;
      case "Hampir Penuh":
        return Colors.orange.shade100;
      case "Penuh":
        return Colors.red.shade100;
      default:
        return Colors.grey.shade200;
    }
  }

  Color _statusTextColor(String status) {
    switch (status) {
      case "Tersedia":
        return Colors.green;
      case "Hampir Penuh":
        return Colors.orange;
      case "Penuh":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: Color(0xFF2ECC40),
        elevation: 0,
        title: const Text(
          'Check Lot',
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
          Container(
            padding: const EdgeInsets.all(16),
            color: Color(0xFF2ECC40),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search parking location..',
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: parkingData.length,
              itemBuilder: (context, index) {
                final item = parkingData[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item["name"],
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                              color: _statusColor(item["status"]),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              item["status"],
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: _statusTextColor(item["status"]),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item["address"],
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tarif per jam\n${item["price"]}",
                            style: TextStyle(fontSize: 13),
                          ),
                          Text(
                            "Kapasitas\n${item["capacity"]}",
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => InformationSpotPage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF2ECC40),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              child: Text("Select"),
                            ),
                          ),
                          const SizedBox(width: 12),
                          IconButton(
                            icon: Icon(Icons.navigation, color: Colors.green),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.share, color: Colors.green),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
