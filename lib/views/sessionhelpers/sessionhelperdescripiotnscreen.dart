import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/utis/routes/routename.dart';
import 'package:somadome_p/viewmodels/session_helper_provider.dart';

class Sessionhelperdescripiotnscreen extends StatefulWidget {
  final String? id;
  const Sessionhelperdescripiotnscreen({super.key, this.id});

  @override
  State<Sessionhelperdescripiotnscreen> createState() =>
      _SessionhelperdescripiotnscreenState();
}

class _SessionhelperdescripiotnscreenState
    extends State<Sessionhelperdescripiotnscreen> {
  @override
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final sessionProvider = Provider.of<SessionHelperProvider>(
        context,
        listen: false,
      );

      sessionProvider.getsessions().then((_) {
        if (widget.id != null) {
          sessionProvider.selectSessionById(widget.id!);
        }
      });
    });
  }

@override
void dispose() {
  final sessionProvider = Provider.of<SessionHelperProvider>(
    context,
    listen: false,
  );
  sessionProvider.clearselectedsession();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.backgroundgradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Consumer<SessionHelperProvider>(
            builder: (context, sessionhelperprovider, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close, color: Colors.white, size: 18),
                    ),
                    title: Text(
                      "Session Helper",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                        letterSpacing: 0.3,
                      ),
                    ),
                    centerTitle: true,
                    surfaceTintColor: Colors.transparent,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "What Mantra Do You Resonate With Most?",
                      style: GoogleFonts.urbanist(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  SelectedHelperDescriptionWidget(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class SelectedHelperDescriptionWidget extends StatelessWidget {
  final List<String> descriptions = const [
    "I am strong. My body repairs and restores with each breath.",
    "I am safe to rest and invite flow to recharge.",
    "I am magnetic. Abundance flows effortlessly to me.",
    "I am aligned with love. My heart opens to receive and give fully.",
    "I am the observer of my inner world. In stillness, I return to truth.",
    "I am rooted in my worth and rising into my highest potential.",
  ];

  const SelectedHelperDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final sessionProvider = Provider.of<SessionHelperProvider>(context);


    return Column(
      children: [
        ...descriptions.map((desc) {
          final isSelected = sessionProvider.selectedDescription == desc;
          return GestureDetector(
            onTap: () {
              sessionProvider.selectDescription(desc);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color:
                        isSelected
                            ? AppColors.forgetpasswordcolor
                            : Colors.white54,
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/images/Group (2).svg"),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        desc,
                        style: GoogleFonts.urbanist(
                          color: AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(4),
                        color:
                            isSelected
                                ? AppColors.forgetpasswordcolor
                                : Colors.transparent,
                        border: Border.all(
                          color:
                              isSelected
                                  ? AppColors.forgetpasswordcolor
                                  : Colors.white54,
                          width: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selected",
                    style: GoogleFonts.urbanist(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "${sessionProvider.selectedSession?.title?.toUpperCase() ?? ''}",
                    style: GoogleFonts.urbanist(
                      color: AppColors.forgetpasswordcolor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              GestureDetector(

              
                onTap:
                    sessionProvider.selectedDescription == null
                        ? null
                        : () {
                          print("Selected Meditation: ${sessionProvider.selectedSession?.Id}");
                          Navigator.pushNamed(
                            context,
                            RoutesName.sessionhelpermeditationscreen,
                            arguments: sessionProvider.selectedSession?.Id,
                          );
                        },
                child: Opacity(
                  opacity:
                      sessionProvider.selectedDescription == null ? 0.3 : 1.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.w,
                      vertical: 15.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.buttonpink,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      "Next",
                      style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
