import 'package:doctor_app/common/libraries.dart';

import 'bottom_nav_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidegt(
        context,
        Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: FloatingButton(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BottomNavScreen(),
                  ));
            },
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildDoctorImage(context),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OurText(
                        size: 28,
                        fontWeight: FontWeight.w700,
                        tittle: "Plastic Surgery \nSafe and effective",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      OurText(
                        size: 16,
                        fontWeight: FontWeight.w600,
                        tittle: "Why Choose Dr.Carlos lllich Navarro?",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      OurText(
                        size: 14,
                        fontWeight: FontWeight.w400,
                        tittle:
                            "Dr.Navarro offers the highest quality of contemporary "
                            "aesthetic treatment options available. Dr. Carlos "
                            "Illich Navarro is a triple board-certified plastic "
                            "surgeon with extensive training in cosmetic and "
                            "reconstructive plastic surgery",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Container buildDoctorImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.64,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        image:
            DecorationImage(image: AssetImage(doctorImage), fit: BoxFit.cover),
      ),
    );
  }
}
