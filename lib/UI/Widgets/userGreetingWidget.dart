import 'package:flutter/material.dart';

class UserGreeting extends StatelessWidget {
  final String username;

  const UserGreeting({
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Hello, $username! 👋🏼',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xDE000000),
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          Row(
            children: [
              Text(
                'Welcome to AgriCoop Members Portal.',
                style: TextStyle(
                  color: Color(0xBD000000),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
