import 'package:flutter/material.dart';
import 'widgets_home/Feature_item.dart';
import 'widgets_home/vehicle_card.dart';
import 'widgets_home/parking_spot_card.dart';
import 'widgets_home/wallet_card.dart';
import 'package:parkirtime/screens/manage_vehicle_page.dart';
import 'package:parkirtime/screens/checklotpage.dart';
import 'package:parkirtime/screens/ticket_page.dart';

class HomePageContent extends StatelessWidget {
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
          const WalletCard(), // Tetap on top
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      color: Color(0xFF2ECC40),
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 251, 246, 246),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset('assets/log.png', height: 30),
          ),
          const SizedBox(height: 40),
          const Text(
            "Hi, Corne",
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

  Widget _buildScrollableContent(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 235, 229, 229),
      padding: const EdgeInsets.only(top: 100),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Feature Menu
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FeatureItem(
                    imagePath: 'assets/check_lot.png',
                    title: "Check Lot",
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => CheckLotPage()),
                        ),
                  ),
                  FeatureItem(
                    imagePath: 'assets/ticket.png',
                    title: "Ticket",
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => TicketPage()),
                        ),
                  ),
                  FeatureItem(
                    imagePath: 'assets/reservation.png',
                    title: "Reservation",
                    onTap: () {
                      // Coming soon or open reservation page
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // My Car Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "My Car",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
            const SizedBox(height: 10),
            const VehicleCard(),
            const SizedBox(height: 25),

            // Parking Spot Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                "Parking Spot",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 150,
              padding: const EdgeInsets.only(left: 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  ParkingSpotCard("Mega mall"),
                  SizedBox(width: 15),
                  ParkingSpotCard("Poltek Batam"),
                  SizedBox(width: 15),
                  ParkingSpotCard("Shopping Center"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
