import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final void Function() action;
  CustomTile({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.action,
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
      // trailing: IconButton(
      //   iconSize: 30,
      //   onPressed: action,
      //   icon: const Icon(
      //     Icons.arrow_forward_ios,
      //     color: Color(0xff989898),
      //   ),
      // ),
      trailing: InkWell(
        onTap: action,
        child: Icon(Icons.arrow_forward_ios,
        size: 30,
        color: Color(0xff989898)),
      ),
    );
  }
}
