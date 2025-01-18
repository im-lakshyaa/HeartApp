import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:heartmate/pages/live monitoring.dart';

class HealthDashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Monday, 3 Nov',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            Text(
              'Hi, User',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Steps section
                  SectionCard(
                    title: 'Steps',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Total Steps',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '10000',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 110,
                          height: 160,
                          child: PieChart(
                            PieChartData(
                              sections: [
                                PieChartSectionData(
                                  value: 25,
                                  color: Colors.green,
                                  radius: 40,
                                ),
                                PieChartSectionData(
                                  value: 75,
                                  color: Colors.grey[800]!,
                                  radius: 40,
                                ),
                              ],
                              centerSpaceRadius: 20,
                              sectionsSpace: 0,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'Steps Covered',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '2500',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  // Battery and Temperature section
                  Row(
                    children: [
                      Expanded(
                        flex: 4, // Increased flex to make it broader
                        child: SectionCard(
                          title: 'Battery',
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    height: 100, // Increased size for Battery
                                    width: 100,  // Increased size for Battery
                                    child: CircularProgressIndicator(
                                      value: 0.69,
                                      strokeWidth: 8, // Thicker stroke
                                      backgroundColor: Colors.grey[800],
                                      color: Colors.green,
                                    ),
                                  ),
                                  Text(
                                    '69%',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 22, // Increased font size
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        flex: 3, // Increased flex for Temperature
                        child: SectionCard(
                          title: 'Temperature',
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.thermostat,
                                color: Colors.red,
                                size: 60, // Increased icon size
                              ),
                              Text(
                                '92°',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 28, // Increased font size
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // BMI Section placed above navigation bar with adjusted padding
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 9.0, 0.0), // Decreased top padding to move it up
            child: SectionCard(
              title: 'BMI',
              child: SizedBox(
                height: 180,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 20),
                          FlSpot(1, 22),
                          FlSpot(2, 18),
                          FlSpot(3, 24),
                          FlSpot(4, 20),
                          FlSpot(5, 23),
                          FlSpot(6, 21),
                        ],
                        isCurved: true,
                        colors: [Colors.blue],
                        barWidth: 3,
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.teal),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LiveMonitoringPage()),
                );
              },
              child: Icon(Icons.favorite, color: Colors.white),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info, color: Colors.white),
            label: '',
          ),
        ],
      ),
    );
  }
}

// Custom Card Widget for Each Section
class SectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const SectionCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}



