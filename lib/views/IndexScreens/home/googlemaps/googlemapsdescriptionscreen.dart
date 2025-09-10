import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/res/widgets/customsearchtextfield.dart';
import 'package:somadome_p/utis/routes/routename.dart';
import 'package:somadome_p/viewmodels/controllers_provider.dart';
import 'package:somadome_p/viewmodels/location_view_provider.dart';

class Googlemapsdescriptionscreen extends StatefulWidget {
  const Googlemapsdescriptionscreen({super.key});

  @override
  State<Googlemapsdescriptionscreen> createState() =>
      _GooglemapsdescriptionscreenState();
}

class _GooglemapsdescriptionscreenState
    extends State<Googlemapsdescriptionscreen> {
  @override
  void initState() {
    super.initState();
    // Fetch locations when screen is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LocationViewProvider>(
        context,
        listen: false,
      ).fetchLocations();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.backgroundgradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: AppColors.white, size: 15),
          ),
          title: Text(
            "Book",
            style: GoogleFonts.urbanist(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
              fontSize: 17,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert, color: AppColors.white),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Consumer<LocationViewProvider>(
            builder: (context, locationProvider, child) {
              if (locationProvider.isLoading) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                children: [
                  SearchTextField(
                    icon: Icon(Icons.search, weight: 20),
                    controller:
                        Provider.of<ControllersProvider>(
                          context,
                        ).searchcontoller,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RoutesName.currentlocationscreen,
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.forgetpasswordcolor,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_forward, color: AppColors.white),
                          SizedBox(width: 8),
                          Text(
                            "Use current Location",
                            style: GoogleFonts.urbanist(
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: locationProvider.locations.length,
                    itemBuilder: (context, index) {
                      final location = locationProvider.locations[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.01),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              // Left Icon
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: AppColors.white,
                                child: Icon(
                                  location.icon,
                                  color: AppColors.buttonpink,
                                ),
                              ),
                              SizedBox(width: 12),
                              // Text Info
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      location.title,
                                      style: GoogleFonts.urbanist(
                                        color: AppColors.titlecolor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      location.subtitle,
                                      style: GoogleFonts.urbanist(
                                        color: Colors.white.withOpacity(0.7),
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CircleAvatar(
                                radius: 16,
                                backgroundColor:
                                    location.backgroundColor ?? AppColors.white,
                                child: Image.asset(
                                  "assets/images/locationimage.png",
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
