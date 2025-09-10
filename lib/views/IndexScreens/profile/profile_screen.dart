import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/utis/routes/routename.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.backgroundgradient),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.white,
              size: 20,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            "Setting",
            style: GoogleFonts.urbanist(
              color: AppColors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(children: [SettingsWidget()]),
        ),
      ),
    );
  }
}

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionTitle("Account & Security"),
          SizedBox(height: 12),
          settingsTile(
            icon: Icons.email_outlined,
            title: "Email & Mobile number",
            onTap: () {
              Navigator.pushNamed(context, RoutesName.accountinfoscreen);
            },
          ),
          Divider(),
          settingsTile(
            icon: Icons.lock_outline,
            title: "Security setting",
            onTap: () {},
          ),
          Divider(),
          settingsTile(
            icon: Icons.payment,
            title: "Payment Method",
            onTap: () {
              Navigator.pushNamed(context, RoutesName.profilepaymentscreen);
            },
          ),
          SizedBox(height: 20.h),

          // Section: Preferences
          sectionTitle("Preference"),
          SizedBox(height: 12),
          settingsTile(
            icon: Icons.language_outlined,
            title: "Country",
            value: "United States",
            onTap: () {},
          ),
          Divider(),
          settingsTile(
            icon: Icons.attach_money_outlined,
            title: "Currency",
            value: "Dollar (US)",
            onTap: () {},
          ),
          Divider(),
          settingsTile(
            icon: Icons.translate,
            title: "Language",
            value: "English",
            onTap: () {},
          ),
          Divider(),
          settingsTile(
            icon: Icons.notifications_none,
            title: "Notification setting",
            onTap: () {
              Navigator.pushNamed(context, RoutesName.pushnotificatinscreen);
            },
          ),
          Divider(),
          settingsTile(
            icon: Icons.account_balance,
            title: "Link Account",
            onTap: () {
              Navigator.pushNamed(context, RoutesName.linkacconutscreen);
            },
          ),
          Divider(),
          settingsTile(
            icon: Icons.mail_outline,
            title: "Newsletter & Promo",
            onTap: () {},
          ),
          Divider(),
          settingsTile(
            icon: Icons.location_on_outlined,
            title: "Location",
            isSwitch: true,
          ),
          Divider(),
          settingsTile(
            icon: Icons.dark_mode_outlined,
            title: "Dark theme",
            isSwitch: true,
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Text(
        title,
        style: GoogleFonts.urbanist(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget settingsTile({
    required IconData icon,
    required String title,
    String? value,
    bool isSwitch = false,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: InkWell(
        onTap: isSwitch ? null : onTap,
        borderRadius: BorderRadius.circular(10.r),
        child: Row(
          children: [
            Icon(icon, color: Colors.white.withOpacity(0.7), size: 22.sp),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.urbanist(
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
              ),
            ),
            if (value != null && !isSwitch)
              Padding(
                padding: EdgeInsets.only(right: 6.w),
                child: Text(
                  value,
                  style: GoogleFonts.urbanist(
                    letterSpacing: 0.4,
                    fontSize: 14.sp,
                    color: AppColors.forgetpasswordcolor,
                  ),
                ),
              ),
            if (!isSwitch)
              Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14.sp),
            if (isSwitch)
              Switch(
                value: true,
                onChanged: (val) {},
                activeColor: AppColors.forgetpasswordcolor,
              ),
          ],
        ),
      ),
    );
  }
}
