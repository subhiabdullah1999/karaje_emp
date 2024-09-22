import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EndDrawerListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const EndDrawerListTile({super.key, 
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w600,
          fontSize: 12.sp,
        ),
      ),
      onTap: onPressed,
    );
  }
}
