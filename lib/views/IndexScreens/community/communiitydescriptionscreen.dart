import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/views/IndexScreens/community/community_screen.dart';

class Communiitydescriptionscreen extends StatefulWidget {
  const Communiitydescriptionscreen({super.key});

  @override
  State<Communiitydescriptionscreen> createState() =>
      _CommuniitydescriptionscreenState();
}

class _CommuniitydescriptionscreenState
    extends State<Communiitydescriptionscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Column(
            children: [
              ListView.builder(
                itemCount: 7,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                itemBuilder: (context, index) {
                  final colors = [
                    Color.fromRGBO(200, 114, 242, 1),
                    Color.fromRGBO(154, 0, 255, 1),
                    Colors.lightBlueAccent,
                    Color.fromRGBO(97, 206, 112, 1),
                    Color.fromRGBO(124, 184, 255, 1),
                    Color.fromRGBO(245, 98, 133, 1),
                    Color.fromRGBO(247, 114, 209, 1),
                  ];
                  final titles = [
                    'Top rated session',
                        'Top rated Session',
                    'Most active user',
                    'Somadome Session taken',
                    'Top rated session',
                        'Most active user',
                    'Somadome Session taken',
                  ];
                  final subtitles = [
                    'Session Name',
                    'Session Name',
                    'User Name',
                    'Session Name',
                    'Session Name',
                    'User Name',
                    'Session Name',
                  ];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 15.h),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: colors[index],
                      ),
                      child: BookingWidget(
                        title: titles[index],
                        subtitle: subtitles[index],
                        id: "${index + 1}",
                        color: Colors.transparent,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
