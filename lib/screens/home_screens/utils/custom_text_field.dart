import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.size,
    required this.locationController, required this.onTap,
  });

  final Size size;
  final TextEditingController locationController;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(size.width * 0.1)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04, vertical: size.height * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.search,
                color: Colors.blue,
              ),
              SizedBox(
                width: size.width * 0.028,
              ),
              SizedBox(
                width: size.width * 0.6,
                child: TextField(
                  controller: locationController,
                  style: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: size.width * 0.04),
                  decoration: const InputDecoration(
                    hintText: "Enter Your Location",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: size.height * 0.05,
      ),
      InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(size.width * 0.1)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.1, vertical: size.height * 0.006),
            child: Text("Search",
                style:
                    TextStyle(color: Colors.white, fontSize: size.width * 0.06),
                textAlign: TextAlign.center),
          ),
        ),
      )
    ]);
  }
}
