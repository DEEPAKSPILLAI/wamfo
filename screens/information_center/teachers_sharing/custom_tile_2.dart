import 'package:flutter/material.dart';

class CustomTile2 extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;

  CustomTile2({
    this.title = "",
    this.subtitle = "",
    this.date = "",
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            date,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
