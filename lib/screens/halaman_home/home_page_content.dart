import 'package:flutter/material.dart';
import 'widgets_home/Feature_item.dart';
import 'widgets_home/vehicle_card.dart';
import 'package:parkirtime/screens/my_car/mycar_page.dart';
import 'package:parkirtime/screens/checklot/checklotpage.dart';
import 'package:parkirtime/screens/reservation/ReservasionPage.dart';
import 'package:parkirtime/screens/ticket_page.dart';

class HomePageContent extends StatefulWidget {
  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  List<Map<String, dynamic>> vehicles = [];
  bool isLoading = false;

  Future<void> _onRefresh() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2)); // simulasi loading

    // Di sini kamu bisa fetch data kendaraan dan parkir dari backend nanti

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              _buildHeader(),
              Expanded(child: _buildScrollableContent(context)),
            ],
          ),
          Positioned(
            top: 160,
            left: 20,
            right: 20,
            child: _buildFeatureMenu(context),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      color: Color(0xFF2ECC40),
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 246, 250, 251),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset('assets/log.png', height: 30),
          ),
          const SizedBox(height: 40),
          const Text(
            "Hi, Ayang",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureMenu(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 202, 225, 238),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FeatureItem(
            imagePath: 'assets/chek.png',
            title: "Check Lot",
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CheckLotPage()),
                ),
          ),
          FeatureItem(
            imagePath: 'assets/reservation.png',
            title: "Reservation",
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Reservasionpage()),
                ),
          ),
          FeatureItem(
            imagePath: 'assets/tik.png',
            title: "Ticket",
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => TicketPage()),
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildScrollableContent(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 235, 229, 229),
      padding: const EdgeInsets.only(top: 100),
      child: RefreshIndicator(
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // My Car Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "My Car",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ManageVehiclePage(),
                            ),
                          ),
                      child: const Text(
                        "Manage Vehicle",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF2ECC40),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:
                    vehicles.isEmpty
                        ? Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/mobil.png', // ganti dengan gambar mobilmu
                                height: 50,
                                width: 50,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(width: 12),
                              Container(
                                width: 1,
                                height: 40,
                                color: Colors.grey.shade400,
                              ),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Text(
                                  "No cars added yet",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        : VehicleCard(),
              ),
              const SizedBox(height: 45),

              // Parking Spot Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 29),
                child: const Text(
                  "Parking Spot",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 170,
                padding: const EdgeInsets.only(left: 20),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildParkingCard("Mega Mall", 31),
                    const SizedBox(width: 15),
                    _buildParkingCard("Grand Mall", 12),
                    const SizedBox(width: 15),
                    _buildParkingCard("Nagoya Hill", 7),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParkingCard(String title, int available) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 90,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/spot.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  "Available $available",
                  style: const TextStyle(color: Colors.green),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
