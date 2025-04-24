import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int _selectedIndex = 0;

  final List<String> filters = ["Valid", "Complete", "Canceled"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        children: [
          // AppBar Hijau
          Container(
            height: 170,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            color: Colors.green,
            child: Column(
              children: [
                SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(filters.length, (index) {
                    final isSelected = _selectedIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 14,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.green : Colors.white,
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          filters[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 25),
              ],
            ),
          ),

          // Konten berdasarkan tab
          Expanded(child: _buildContentForTab()),
        ],
      ),
    );
  }

  Widget _buildContentForTab() {
    switch (_selectedIndex) {
      case 0:
        return _buildValidHistory();
      case 1:
        return _buildCompleteHistory();
      case 2:
        return _buildCanceledHistory();
      default:
        return Container();
    }
  }

  Widget _buildValidHistory() {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        _buildHistoryCard(
          invoice: "INVOICE-1",
          date: "7 June 2025 - 10.00",
          location: "Mega Mall Batam",
          floor: "1st Floor",
          slot: "4A",
          duration: "3 Hours",
          statusWidget: _buildStatusBox(
            "Valid until\n7 June 2025\n13.00",
            Colors.blue,
            Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildCompleteHistory() {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        _buildHistoryCard(
          invoice: "INVOICE-1",
          date: "1 April 2025 - 10.00",
          location: "Mega Mall Batam",
          floor: "1st Floor",
          slot: "4A",
          duration: "3 Hours",
          statusWidget: _buildStatusBox(
            "Completed",
            Colors.green,
            Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildCanceledHistory() {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        _buildHistoryCard(
          invoice: "INVOICE-1",
          date: "7 June 2025 - 10.00",
          location: "Mega Mall Batam",
          floor: "1st Floor",
          slot: "4A",
          duration: "3 Hours",
          statusWidget: _buildStatusBox("Canceled", Colors.red, Colors.white),
        ),
      ],
    );
  }

  Widget _buildStatusBox(String text, Color bgColor, Color textColor) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildHistoryCard({
    required String invoice,
    required String date,
    required String location,
    required String floor,
    required String slot,
    required String duration,
    required Widget statusWidget,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: invoice & date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(invoice, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(date, style: TextStyle(fontSize: 12, color: Colors.black)),
            ],
          ),
          SizedBox(height: 10),

          // Location
          Text(location, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(floor),
          Text(slot),
          Text(duration),

          SizedBox(height: 10),
          Align(alignment: Alignment.centerRight, child: statusWidget),
        ],
      ),
    );
  }
}
