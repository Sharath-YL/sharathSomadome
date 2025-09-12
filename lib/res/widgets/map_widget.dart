import 'package:flutter/material.dart';

class MapWidget extends StatelessWidget {
  final String? imagepath;
  final VoidCallback? ontap;

  const MapWidget({this.imagepath, this.ontap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.purple, width: 3),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: imagepath != null
              ? Image.asset(
                  imagepath!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Center(child: Text("No map image provided")),
        ),
      ),
    );
  }
}
