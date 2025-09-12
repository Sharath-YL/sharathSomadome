import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/views/vedioplayerscreens/novolumescreen.dart';

class Mediumvolumescreen extends StatefulWidget {
  const Mediumvolumescreen({super.key});

  @override
  State<Mediumvolumescreen> createState() => _MediumvolumescreenState();
}

class _MediumvolumescreenState extends State<Mediumvolumescreen> {
  final Duration currentPosition = const Duration(minutes: 22, seconds: 16);
  final Duration totalDuration = const Duration(minutes: 35);

  String formatDuration(Duration d) {
    return DateFormat('mm:ss').format(DateTime(0).add(d));
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Novolumescreen()),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final remaining = totalDuration - currentPosition;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/vedioimage.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 48,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "ASCEND",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  LinearProgressIndicator(
                    value: currentPosition.inSeconds / totalDuration.inSeconds,
                    minHeight: 4,
                    backgroundColor: AppColors.buttonpink,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                  ),

                  const SizedBox(height: 6),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formatDuration(currentPosition),
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "-${formatDuration(remaining)}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.volume_down, color: Colors.white, size: 28),

                      Row(
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundColor: AppColors.forgetpasswordcolor,
                            child: Icon(
                              Icons.pause,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          const SizedBox(width: 20),

                          CircleAvatar(
                            radius: 28,
                            backgroundColor: AppColors.buttonpink,
                            child: Icon(
                              Icons.stop,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ],
                      ),

                      Icon(Icons.air, color: Colors.white, size: 28),
                    ],
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
