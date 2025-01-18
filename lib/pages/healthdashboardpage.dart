import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:heartmate/pages/Info and Help page.dart';

class HealthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(95.0), // Adjusted padding for left alignment
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Always keep yourself safe and\n',
                    style: TextStyle(color: Colors.white, fontSize: 34),
                  ),
                  TextSpan(
                    text: 'Healthy',
                    style: TextStyle(color: Colors.teal, fontSize: 34),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5), // Add some spacing below the text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildDataCard('80', 'BPM', Colors.red),
              buildDataCard('95%', 'SpO2', Colors.green),
            ],
          ),
          SizedBox(height: 1), // Add padding between the BPM/SpO2 cards and the graph
          Expanded(
            child: ListView(
              children: [
                buildChartCard('Heart\'s bpm', 'AVG bpm', 76, [
                  FlSpot(0, 60),
                  FlSpot(1, 72),
                  FlSpot(2, 78),
                  FlSpot(3, 89),
                  FlSpot(4, 76),
                  FlSpot(5, 85),
                  FlSpot(6, 72),
                ]),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[850],
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home ,color: Colors.white ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite ,color: Colors.teal),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget buildDataCard(String value, String title, Color color) {
    return Container(
      width: 100,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(color: color, fontSize: 36, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget buildChartCard(String title, String avgTitle, int avgValue, List<FlSpot> spots) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 150, child: LineChart(createLineChart(spots))),
            Center(
              child: Text(
                '$avgTitle  $avgValue',
                style: TextStyle(color: Colors.teal, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  LineChartData createLineChart(List<FlSpot> spots) {
    return LineChartData(
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        leftTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
            const weekDays = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];
            if (value >= 0 && value < weekDays.length) {
              return weekDays[value.toInt()];
            }
            return '';
          },
          reservedSize: 22,
          margin: 8,
        ),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          colors: [Colors.teal],
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
        ),
      ],
    );
  }
}

