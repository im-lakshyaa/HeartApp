import 'package:flutter/material.dart';
import 'package:heartmate/pages/healthdashboardpage.dart';// Import Health Dashboard Page

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0; // To keep track of the selected page

  // Define the pages to switch between
  final List<Widget> _pages = [
    HealthPage(), // Health Dashboard Page
    InfoAndHelpPage(), // Info and Help Page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[850],
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex, // Highlight the selected icon
        onTap: _onItemTapped, // Handle tap on icons
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite), // Icon for Health Dashboard
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info), // Icon for Info & Help
            label: 'Info',
          ),
        ],
      ),
    );
  }
}

class InfoAndHelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Info and Help',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Display',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Time, HeartBeat (BPM), and SpO2 can be seen here.',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Button Configuration',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            buildInfoText('1. Upper Button'),
            buildSubInfoText(
                '  Single Press - Display Time, BPM, and SpO2.\n  Single Press - To give consent in case of abnormal heart rate detection.\n  Press & Hold - Starts the calibration.'),
            SizedBox(height: 8),
            buildInfoText('2. Lower Button'),
            buildSubInfoText('  Press & Hold - Resets the device.'),
            SizedBox(height: 8),
            buildInfoText('3. Button Combinations'),
            buildSubInfoText(
                '  Press and hold both buttons - Starts immediate medication.\n  Three times press - To call for help.'),
          ],
        ),
      ),
    );
  }

  Widget buildInfoText(String text) {
    return Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget buildSubInfoText(String text) {
    return Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: 16),
    );
  }
}
