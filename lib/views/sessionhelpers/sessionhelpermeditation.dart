import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/utis/routes/routename.dart';
import 'package:somadome_p/viewmodels/session_helper_provider.dart';

class Sessionhelpermeditationscreen extends StatefulWidget {
  final String id;
  const Sessionhelpermeditationscreen({super.key, required this.id});

  @override
  State<Sessionhelpermeditationscreen> createState() =>
      _SessionhelpermeditationscreenState();
}

class _SessionhelpermeditationscreenState
    extends State<Sessionhelpermeditationscreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final sessionProvider = Provider.of<SessionHelperProvider>(
        context,
        listen: false,
      );
      await sessionProvider.selectSessionById(widget.id);
      print("the title is ${sessionProvider.selectedSession?.title}");
      print("the id is ${widget.id}");
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
    final sessionProvider = Provider.of<SessionHelperProvider>(context);
    final selectedMeditation = sessionProvider.selectedMeditation;

    return Container(
      decoration: BoxDecoration(gradient: AppColors.backgroundgradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
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
                  style: GoogleFonts.urbanist(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                    letterSpacing: 0.3,
                  ),
                ),
                centerTitle: true,
                surfaceTintColor: Colors.transparent,
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "What Type of Meditation Do You Prefer?",
                  style: GoogleFonts.urbanist(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              MeditationOptionWidget(
                subtitle: "Guided Journey",
                iconPath: "assets/images/Group (2).svg",
              ),
              MeditationOptionWidget(
                subtitle: "Unguided Journey",
                iconPath: "assets/images/box.svg",
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
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
                      onTap: selectedMeditation == null ? null : () { 
                        Navigator.pushNamed(context, RoutesName.startsessionscreen);
                      },
                      child: Opacity(
                        opacity: selectedMeditation == null ? 0.3 : 1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.buttonpink,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Next",
                            style: GoogleFonts.poppins(
                              color: AppColors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MeditationOptionWidget extends StatelessWidget {
  final String subtitle;
  final String iconPath;

  const MeditationOptionWidget({
    super.key,
    required this.subtitle,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    final sessionProvider = Provider.of<SessionHelperProvider>(context);
    final isSelected = sessionProvider.selectedMeditation == subtitle;

    return GestureDetector(
      onTap: () {
        sessionProvider.selectMeditation(subtitle);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color:
                  isSelected ? AppColors.forgetpasswordcolor : Colors.white54,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              SvgPicture.asset(iconPath),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  subtitle,
                  style: GoogleFonts.urbanist(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
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
  }
}
