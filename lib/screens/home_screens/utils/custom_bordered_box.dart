import 'package:flutter/material.dart';

class CustomBorderedBox extends StatelessWidget {
  const CustomBorderedBox({
    super.key,
    required this.onTap,
    required this.size, required this.s, required this.icon,
  });

  final VoidCallback onTap;
  final Size size;
  final String s;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.blue),
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.04, vertical: size.height * 0.014),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                SizedBox(
                  width: size.width * 0.6,
                  child: Text(
                  s,
                    style: TextStyle(
                        fontSize: size.width * 0.04, color: Colors.blue),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
