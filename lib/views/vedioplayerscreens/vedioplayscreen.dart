import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/utis/routes/routename.dart';

class Vedioplayscreen extends StatefulWidget {
  const Vedioplayscreen({super.key});

  @override
  State<Vedioplayscreen> createState() => _VedioplayscreenState();
}

class _VedioplayscreenState extends State<Vedioplayscreen> {
  bool isPlaying = false;
  Duration currentPosition = const Duration(minutes: 22, seconds: 16);
  Duration totalDuration = const Duration(minutes: 35);

  String formatDuration(Duration d) {
    return DateFormat('mm:ss').format(DateTime(0).add(d));
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushNamed(context, RoutesName.realquickscreen);
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
                  // Title
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
                        isPlaying ? formatDuration(currentPosition) : "0:00",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        isPlaying
                            ? "-${formatDuration(remaining)}"
                            : formatDuration(totalDuration),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.volume_up, color: Colors.white, size: 28),

                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isPlaying = !isPlaying;
                              });
                            },
                            child: CircleAvatar(
                              radius: 28,
                              backgroundColor:
                                  isPlaying
                                      ? AppColors.forgetpasswordcolor
                                      : AppColors.buttonpink,
                              child: Icon(
                                isPlaying ? Icons.pause : Icons.play_arrow,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),

                          if (isPlaying)
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
