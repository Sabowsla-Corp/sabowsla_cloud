import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardLayoutTemplate extends StatelessWidget {
  const DashboardLayoutTemplate({
    required this.title,
    required this.child,
    super.key,
  });
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: GoogleFonts.delaGothicOne().fontFamily,
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
