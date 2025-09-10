import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:somadome_p/utis/routes/routename.dart';

class MapWidget extends StatelessWidget {
  final String? imagepath;
  final VoidCallback? ontap;

  const MapWidget({
    this.imagepath,
    this.ontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: AbsorbPointer(
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.purple, width: 3),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: FlutterMap(
              options: MapOptions(
                initialCenter: const LatLng(38.5816, -121.4944),
                initialZoom: 10.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: _getTileUrl(),
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: const LatLng(38.5816, -121.4944),
                      child: const Icon(Icons.location_pin, color: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getTileUrl() {
    if (imagepath == null) {
      return 'https://tse2.mm.bing.net/th/id/OIP.bg9fix87nYy5L1YeKpCSvwHaDn?pid=Api&P=0&h=180';
    }
    if (imagepath!.startsWith('http')) {
      return imagepath!;
    }
    return 'assets/images/$imagepath';
  }
}
