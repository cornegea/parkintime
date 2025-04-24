import 'package:flutter/material.dart';

class ParkingLotDetailPage extends StatefulWidget {
  final String spotName;

  const ParkingLotDetailPage({required this.spotName});

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
        title: Text('Select Parking Spot - ${widget.spotName}'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),

          // Floor selector
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
                        side: BorderSide(color: Colors.green),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
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
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),

          const SizedBox(height: 16),

          // Parkir area
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: (slots.length / 2).ceil(),
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (_, index) {
                final leftIndex = index * 2;
                final rightIndex = leftIndex + 1;

                Widget buildSlot(String? slot) {
                  final isOccupied =
                      slot != null && occupiedSlots.contains(slot);
                  final isSelected = slot == selectedSlot;

                  return Expanded(
                    child: GestureDetector(
                      onTap:
                          slot == null || isOccupied
                              ? null
                              : () {
                                setState(() {
                                  selectedSlot = slot;
                                });
                              },
                      child: Container(
                        height: 80,
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? Colors.green[100]
                                  : Colors.transparent,
                          border: Border.all(
                            color:
                                isOccupied
                                    ? Colors.transparent
                                    : Colors.black26,
                            width: 1.5,
                            style:
                                isOccupied
                                    ? BorderStyle.none
                                    : BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child:
                            isOccupied
                                ? Image.asset(
                                  'assets/car.png',
                                  fit: BoxFit.contain,
                                )
                                : Center(
                                  child: Text(
                                    slot ?? '',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                      ),
                    ),
                  );
                }

                return Row(
                  children: [
                    buildSlot(
                      slots.length > leftIndex ? slots[leftIndex] : null,
                    ),
                    buildSlot(
                      slots.length > rightIndex ? slots[rightIndex] : null,
                    ),
                  ],
                );
              },
            ),
          ),

          // Arah parkir
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Icon(Icons.arrow_forward, color: Colors.black38),
          ),

          // Tombol continue
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed:
                  selectedSlot == null
                      ? null
                      : () {
                        // lanjut ke proses berikut
                      },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Continue', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
