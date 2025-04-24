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
          // ✅ AppBar Hijau (HANYA AppBar)
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.green,
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "History",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // ✅ Tab Menu di BAWAH AppBar
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
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
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.green : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.green),
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
          ),

          Divider(height: 1, thickness: 1),

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
          ticket: "TICKET-1",
          date: "7 June 2025 - 10.00",
          location: "Mega Mall Batam",
          floor: "1st Floor",
          slot: "4A",
          duration: "3 Hours",
          statusWidget: _buildStatusBox(
            "Valid until\n7 June 2025\n13.00",
            Colors.blue,
            Colors.white,
            isValid: true,
          ),
        ),
        _buildHistoryCard(
          ticket: "TICKET-2",
          date: "7 June 2025 - 10.00",
          location: "Mega Mall Batam",
          floor: "1st Floor",
          slot: "4A",
          duration: "3 Hours",
          statusWidget: _buildStatusBox(
            "Waiting for Payment",
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
          ticket: "TICKET-3",
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
          ticket: "TICKET-4",
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

  Widget _buildStatusBox(
    String text,
    Color bgColor,
    Color textColor, {
    bool isValid = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: isValid ? 13 : 14,
        ),
      ),
    );
  }

  Widget _buildHistoryCard({
    required String ticket,
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
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(ticket, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(date, style: TextStyle(fontSize: 12)),
            ],
          ),
          SizedBox(height: 10),

          // Detail lokasi
          Text(location, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(floor),
          Text(slot),
          Text(duration),

          SizedBox(height: 12),
          Align(alignment: Alignment.centerRight, child: statusWidget),
        ],
      ),
    );
  }
}
