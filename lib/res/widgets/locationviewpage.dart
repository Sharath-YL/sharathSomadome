import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';

class LocationViewPage extends StatefulWidget {
  final List<String> imagePaths; // multiple images for slider
  final String discount; // e.g. "50%"

  const LocationViewPage({
    super.key,
    required this.imagePaths,
    required this.discount,
  });

  @override
  State<LocationViewPage> createState() => _LocationViewPageState();
}

class _LocationViewPageState extends State<LocationViewPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: double.infinity, 
        height: 300, 
        color: Colors.grey[200],
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: widget.imagePaths.length,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  widget.imagePaths[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 400,
                );
              },
            ),

            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.yellowcolor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  widget.discount,
                  style:  GoogleFonts.urbanist(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            /// 🔹 Page indicators (inside image, bottom-center)
            Positioned(
              bottom: 12,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.imagePaths.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: _currentIndex == index ? 12 : 8,
                    height: _currentIndex == index ? 12 : 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? Colors.white
                          : Colors.white54,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
