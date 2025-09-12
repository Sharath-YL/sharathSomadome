import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/utis/routes/routename.dart';
import 'package:somadome_p/viewmodels/beginintention_view_provider.dart';
import 'package:somadome_p/views/sessionhelpers/beginsessionscreen.dart';

class Beginintentionscreen extends StatefulWidget {
  const Beginintentionscreen({super.key});

  @override
  State<Beginintentionscreen> createState() => _BeginintentionscreenState();
}

class _BeginintentionscreenState extends State<Beginintentionscreen> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<BeginintentionViewProvider>(
        context,
        listen: false,
      ).beginsession();
    });
  }

  @override
  Widget build(BuildContext context) {
    final beginProvider = Provider.of<BeginintentionViewProvider>(context);
    final items = beginProvider.beginviewmodel;

    return Container(
      decoration: BoxDecoration(gradient: AppColors.backgroundgradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.close, color: Colors.white),
                    ),
                    Spacer(),
                    Text(
                      "Session Helper",
                      style: GoogleFonts.urbanist(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                    Spacer(),
                    SizedBox(width: 48),
                  ],
                ),
              ),
              Expanded(
                child:
                    beginProvider.isloading
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                          itemCount: items.length,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          itemBuilder: (context, index) {
                            final item = items[index];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: BeginSessionTile(
                                title: item.title ?? '',
                                subtitle: item.subtitle ?? '',
                                isSelected: selectedIndex == index,
                              ),
                            );
                          },
                        ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap:
                      selectedIndex != null
                          ? () {
                            final selected = items[selectedIndex!];
                           
                          }
                          : null,
                  child: Opacity(
                    opacity: selectedIndex != null ? 1.0 : 0.3,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: AppColors.buttonpink,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Begin Session",
                          style: GoogleFonts.urbanist(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
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
