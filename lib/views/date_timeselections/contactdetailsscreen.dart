import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/res/widgets/customresumebutton.dart';
import 'package:somadome_p/res/widgets/customtextfield.dart';
import 'package:somadome_p/utis/routes/routename.dart';

class Contactdetailsscreen extends StatefulWidget {
  const Contactdetailsscreen({super.key});

  @override
  State<Contactdetailsscreen> createState() => _ContactdetailsscreenState();
}

class _ContactdetailsscreenState extends State<Contactdetailsscreen> {
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontoller = TextEditingController();

  FocusNode _phoneFocusNode = FocusNode();
  FocusNode namefocusnode = FocusNode();
  FocusNode emailfocusnode = FocusNode();

  void initState() {
    super.initState();
    _phoneFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _phoneFocusNode.dispose();
    namefocusnode.dispose();
    emailfocusnode.dispose();
    phonecontroller.dispose();
    namecontroller.dispose();
    emailcontoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.backgroundgradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: Text(
                  "Contact Details",
                  style: GoogleFonts.urbanist(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.white,
                    size: 18,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Full Name
                    Text(
                      "Full name",
                      style: GoogleFonts.urbanist(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 15),
                    AuthTextField(
                      focusNode: namefocusnode,

                      controller: namecontroller,
                      hintText: "Full Name",
                    ),

                    const SizedBox(height: 20),

                    // Phone Number
                    Text(
                      "Phone number",
                      style: GoogleFonts.urbanist(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color:
                              _phoneFocusNode.hasFocus
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.5),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              'assets/icons/flag.png',
                              width: 32,
                              height: 22,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 8),

                          const Text(
                            "+91",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          const SizedBox(width: 12),

                          Container(
                            height: 28,
                            width: 1,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          const SizedBox(width: 12),

                          Expanded(
                            child: TextFormField(
                              focusNode: _phoneFocusNode,
                              controller: phonecontroller,
                              style: GoogleFonts.urbanist(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10),
                              ],
                              decoration: InputDecoration(
                                isDense: true,
                                border: InputBorder.none,
                                hintText: 'phone number',

                                hintStyle: GoogleFonts.urbanist(
                                  fontSize: 17,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                              onTap: () => setState(() {}),
                              onChanged: (value) => setState(() {}),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    Text(
                      "Email",
                      style: GoogleFonts.urbanist(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 15),
                    AuthTextField(
                      focusNode: emailfocusnode,

                      controller: emailcontoller,
                      hintText: "Email",
                    ),
                    SizedBox(height: 200.h),
                    ResumeButton(
                      buttonText: "Done",
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RoutesName.completereservescreen,
                        );
                      },
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
