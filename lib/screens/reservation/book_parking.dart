import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:parkirtime/screens/reservation/spot_parkir.dart';

class BookParkingDetailsPage extends StatefulWidget {
  final int pricePerHour; // misal 5000
  const BookParkingDetailsPage({Key? key, this.pricePerHour = 5000})
    : super(key: key);

  @override
  _BookParkingDetailsPageState createState() => _BookParkingDetailsPageState();
}

class _BookParkingDetailsPageState extends State<BookParkingDetailsPage> {
  // Calendar
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Duration & Time
  double _duration = 4.0; // default 4 jam
  TimeOfDay _startTime = TimeOfDay(hour: 9, minute: 0);
  TimeOfDay _endTime = TimeOfDay(hour: 13, minute: 0);

  @override
  Widget build(BuildContext context) {
    final total = widget.pricePerHour * _duration.toInt();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Parking Details'),
        backgroundColor: Colors.green,
        leading: const BackButton(color: Colors.white),
      ),
      body: Column(
        children: [
          // ————— Calendar —————
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TableCalendar(
              firstDay: DateTime.utc(2020),
              lastDay: DateTime.utc(2030),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selected, focused) {
                setState(() {
                  _selectedDay = selected;
                  _focusedDay = focused;
                });
              },
              calendarStyle: const CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.greenAccent,
                  shape: BoxShape.circle,
                ),
              ),
              headerStyle: const HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                titleTextStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // ————— Duration Slider —————
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Duration',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Slider(
                  value: _duration,
                  min: 1,
                  max: 12,
                  divisions: 11,
                  label: '${_duration.toInt()}h',
                  activeColor: Colors.green,
                  onChanged: (v) {
                    setState(() {
                      _duration = v;
                      // adjust endTime based on startTime + duration
                      final newHour = (_startTime.hour + v.toInt()) % 24;
                      _endTime = TimeOfDay(
                        hour: newHour,
                        minute: _startTime.minute,
                      );
                    });
                  },
                ),
              ],
            ),
          ),

          // ————— Start & End Time —————
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                _buildTimePicker('Start Hour', _startTime, (t) {
                  setState(() {
                    _startTime = t;
                    // recalc endTime
                    final newHour = (t.hour + _duration.toInt()) % 24;
                    _endTime = TimeOfDay(hour: newHour, minute: t.minute);
                  });
                }),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward, color: Colors.grey),
                const SizedBox(width: 8),
                _buildTimePicker('End Hour', _endTime, (t) {
                  setState(() {
                    _endTime = t;
                    // recalc duration
                    final diff = (t.hour - _startTime.hour);
                    if (diff > 0) _duration = diff.toDouble();
                  });
                }),
              ],
            ),
          ),

          const Spacer(),

          // ————— Total & Continue —————
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Total line
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Rp ${total.toString()},00 / ${_duration.toInt()}h',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Continue button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
    onPressed: (_selectedDay != null)
        ? () {
            // Setelah selesai pilih tanggal/durasi/jam, navigasi ke detail slots
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ParkingLotDetailPage(
                  // kirim nama lokasi jika perlu, misal:
                  spotName: 'Mega mall',
                ),
              ),
            );
          }
                            : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimePicker(
    String label,
    TimeOfDay time,
    ValueChanged<TimeOfDay> onPicked,
  ) {
    return Expanded(
      child: InkWell(
        onTap: () async {
          final picked = await showTimePicker(
            context: context,
            initialTime: time,
          );
          if (picked != null) onPicked(picked);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 12, color: Colors.grey[700]),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    time.format(context),
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.access_time, size: 16, color: Colors.grey),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
