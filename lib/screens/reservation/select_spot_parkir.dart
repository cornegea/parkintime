import 'package:flutter/material.dart';
import 'package:parkirtime/screens/reservation/review_booking_page.dart';

class ParkingLotDetailPage extends StatefulWidget {
  final String spotName;

  const ParkingLotDetailPage({required this.spotName, super.key});

  @override
  State<ParkingLotDetailPage> createState() => _ParkingLotDetailPageState();
}

class _ParkingLotDetailPageState extends State<ParkingLotDetailPage> {
  int selectedFloor = 1;
  String? selectedSlot;

  final Map<int, List<String>> slotData = {
    1: ['A-02', 'A-04', 'A-06', 'B-01', 'B-05'],
    2: ['C-01', 'C-02', 'C-03'],
    3: ['D-01', 'D-02'],
  };

  final List<String> occupiedSlots = ['A-02', 'A-04', 'B-05'];

  @override
  Widget build(BuildContext context) {
    final slots = slotData[selectedFloor] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Parking Spot'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                [1, 2, 3].map((floor) {
                  final isSelected = selectedFloor == floor;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor:
                            isSelected ? Colors.green : Colors.white,
                        side: const BorderSide(color: Colors.green),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedFloor = floor;
                          selectedSlot = null;
                        });
                      },
                      child: Text(
                        '${floor}st Floor',
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  // Garis jalan kiri
                  Column(
                    children: [
                      const Icon(Icons.arrow_downward, color: Colors.black38),
                      Expanded(
                        child: Container(
                          width: 2,
                          decoration: const BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: Colors.black26,
                                width: 2,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  // Slot parkir
                  Expanded(
                    child: ListView.builder(
                      itemCount: (slots.length / 2).ceil(),
                      itemBuilder: (context, index) {
                        final leftIndex = index * 2;
                        final rightIndex = leftIndex + 1;

                        return Column(
                          children: [
                            Row(
                              children: [
                                buildSlot(
                                  slots.length > leftIndex
                                      ? slots[leftIndex]
                                      : null,
                                ),
                                buildSlot(
                                  slots.length > rightIndex
                                      ? slots[rightIndex]
                                      : null,
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Garis jalan tengah
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                const SizedBox(width: 32),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        children: List.generate(
                          20,
                          (index) => Expanded(
                            child: Container(
                              height: 2,
                              color:
                                  index.isEven
                                      ? Colors.black26
                                      : Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                      const Icon(Icons.arrow_forward, color: Colors.black38),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Tombol Continue
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed:
                  selectedSlot == null
                      ? null
                      : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => ReviewBookingPage(
                                  parkingArea: 'Mega Mall Batam Center',
                                  address: 'Jl. Engku Putri No.1, Belian',
                                  vehicle: 'Daihatsu (BP 1234 AA)',
                                  parkingSpot: '1st Floor ($selectedSlot)',
                                  date: '12 March 2025',
                                  duration: '4 hours',
                                  hours: '09:00 AM - 12:00 PM',
                                  pricePerHour: 5000,
                                ),
                          ),
                        );
                      },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text('Continue', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSlot(String? slot) {
    final isOccupied = slot != null && occupiedSlots.contains(slot);
    final isSelected = slot == selectedSlot;

    return Expanded(
      child: GestureDetector(
        onTap:
            (slot == null || isOccupied)
                ? null
                : () {
                  setState(() {
                    selectedSlot = slot;
                  });
                },
        child: TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 300),
          tween: Tween<double>(begin: 1, end: isSelected ? 1.05 : 1.0),
          builder: (context, scale, child) {
            return Transform.scale(
              scale: scale,
              child: Container(
                margin: const EdgeInsets.all(6),
                height: 80,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.yellow : Colors.transparent,
                  border:
                      isOccupied
                          ? null
                          : Border.all(
                            color: Colors.green,
                            width: 2,
                            style:
                                BorderStyle
                                    .solid, // nanti aku kasih putus-putus di bawah
                          ),
                  borderRadius: BorderRadius.circular(12),
                  image:
                      isOccupied
                          ? const DecorationImage(
                            image: AssetImage('assets/car.png'),
                            fit: BoxFit.contain,
                          )
                          : null,
                ),
                child:
                    !isOccupied
                        ? Container(
                          alignment: Alignment.center,
                          child: Text(
                            slot ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        )
                        : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
