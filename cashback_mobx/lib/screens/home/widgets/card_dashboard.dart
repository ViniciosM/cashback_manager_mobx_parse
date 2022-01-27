import 'package:flutter/material.dart';

class CardDashboard extends StatelessWidget {
  const CardDashboard(
      {Key? key,
      required this.title,
      required this.value,
      required this.icon,
      required this.color})
      : super(key: key);

  final String title;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      height: screenHeight * 0.3,
      width: MediaQuery.of(context).size.width * 0.45,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 25,
            color: color,
          ),
          Text.rich(TextSpan(
              text: '$value\n',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              children: <InlineSpan>[
                TextSpan(
                  text: title,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                )
              ])),
          Divider(
            thickness: 3,
            color: color,
          ),
        ],
      ),
    );
  }
}
