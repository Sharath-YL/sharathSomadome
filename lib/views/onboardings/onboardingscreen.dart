import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';
import 'package:somadome_p/res/widgets/customresumebutton.dart';
import 'package:somadome_p/views/auth_screeen/registartionscreen.dart';
import 'package:somadome_p/views/auth_screeen/signin_page.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final _controller = PageController();
  int _index = 0;

  final _pages = const [
    _OnboardPage(
      title: 'Activate your higher self',
      subtitle: '1000+ Locations to find your',
    ),
    _OnboardPage(
      title: 'Discover a world of light ',
      subtitle: '1000+ Locations to find your',
    ),
    _OnboardPage(
      title: 'Discover a world of light ',
      subtitle: '1000+ Locations to find your',
    ),

    _OnboardPage(
      title: 'Discover a world of light ',
      subtitle: '1000+ Locations to find your',
    ),
    _OnboardPage(
      title: 'Discover a world of light ',
      subtitle: '1000+ Locations to find your',
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/onboarding.png'),
                  fit: BoxFit.cover,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color.fromRGBO(157, 71, 255, 0.20),
                    const Color.fromRGBO(107, 110, 255, 0.20),
                  ],
                ),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(.25),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 6,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Registartionscreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Skip',
                          style: GoogleFonts.urbanist(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Spacer(),
                      _SegmentedIndicator(total: _pages.length, index: _index),
                    ],
                  ),
                  const SizedBox(height: 24),

                  Expanded(
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: _pages.length,
                      onPageChanged: (i) => setState(() => _index = i),
                      itemBuilder: (c, i) => _pages[i],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (_index == _pages.length - 1)
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignupScreen(),
                                  ),
                                );
                              },
                              child: Text.rich(
                                TextSpan(
                                  text: "Don't have an account? ",
                                  style: GoogleFonts.urbanist(
                                    color: Colors.white.withOpacity(1),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16, 
                                    letterSpacing: 0.4
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Sign up",
                                      style: GoogleFonts.urbanist(
                                        color: AppColors.forgetpasswordcolor,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.4, 
                                        fontSize: 16
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: ResumeButton(
                            buttonText:
                                _index == _pages.length - 1
                                    ? "Sign In"
                                    : "Next",
                            onPressed: () {
                              if (_index < _pages.length - 1) {
                                _controller.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Registartionscreen(),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardPage extends StatelessWidget {
  const _OnboardPage({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.urbanist(
                color: AppColors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                height: 1.25,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              subtitle,
              style: GoogleFonts.urbanist(
                color: AppColors.white.withOpacity(0.7),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SegmentedIndicator extends StatelessWidget {
  const _SegmentedIndicator({required this.total, required this.index});

  final int total;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(total, (i) {
        final active = i <= index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: EdgeInsets.only(left: i == 0 ? 0 : 6),
          height: 6,
          width: active ? 25 : 25,
          decoration: BoxDecoration(
            color: active ? AppColors.white : AppColors.linesegmentcolor,
            borderRadius: BorderRadius.circular(6),
          ),
        );
      }),
    );
  }
}
