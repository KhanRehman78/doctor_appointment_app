import 'package:doctor_app/common/libraries.dart';
import 'package:flutter/cupertino.dart';

import 'consultant_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidegt(
        context,
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Image.asset(
                        doctorNameImage,
                        width: 330,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: MediaQuery.of(context).size.width * 0.40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(doctorCircleImage),
                                fit: BoxFit.contain,
                              )),
                        ),
                         SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        FittedBox(
                          child: OurText(
                            tittle: "Dr. Carlos\nIllich Navarro",
                            fontWeight: FontWeight.w500,
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                    OurText(
                      size: 15,
                      fontWeight: FontWeight.w500,
                      tittle: doctorInfo,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 4,
                            child: ConsultantFormButton(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ConsultantForm(),
                                    ));
                              },
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        const Expanded(flex: 1, child: CallButton()),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    OurText(
                      size: 40,
                      fontWeight: FontWeight.w600,
                      tittle: "Procedures",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: allProcedure.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 2,
                              mainAxisExtent: 52,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 10,
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProcedureScreen(
                                    image: allProcedure[index].procedureImage,
                                    tittle: allProcedure[index].procedureName,
                                    details: allProcedure[index]
                                        .procedureDiscription,
                                  ),
                                ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: greyColor,
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 7),
                                child: FittedBox(
                                  child: OurText(
                                    fontWeight: FontWeight.w500,
                                    size: 13,
                                    tittle: allProcedure[index].procedureName,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  List<dynamic> allProcedure = [
    ProcedureModel(
      procedureImage: procedureImage,
      procedureName: "Mommy Makeover",
      procedureDiscription: mommyMakeover,
    ),
    ProcedureModel(
      procedureImage: procedureImage,
      procedureName: "Breast Augmentation",
      procedureDiscription: breastAugmentation,
    ),
    ProcedureModel(
      procedureImage: procedureImage,
      procedureName: "Breast Lift",
      procedureDiscription: breastLift,
    ),
    ProcedureModel(
      procedureImage: procedureImage,
      procedureName: "Breast Reduction",
      procedureDiscription: breastReduction,
    ),
    ProcedureModel(
      procedureImage: procedureImage,
      procedureName: "Liposuction",
      procedureDiscription: liposuction,
    ),
    ProcedureModel(
      procedureImage: procedureImage,
      procedureName: "Tummy Tuck",
      procedureDiscription: tummyTuck,
    ),
    ProcedureModel(
      procedureImage: procedureImage,
      procedureName: "Brazilian Butt Lift",
      procedureDiscription: brazilianButtLift,
    ),
    ProcedureModel(
      procedureImage: procedureImage,
      procedureName: "Body Contouring",
      procedureDiscription: bodyContouring,
    ),
    ProcedureModel(
      procedureImage: procedureImage,
      procedureName: "Arm Lift",
      procedureDiscription: armLift,
    ),
    ProcedureModel(
      procedureImage: procedureImage,
      procedureName: "Labiaplasty",
      procedureDiscription: labiaplasty,
    ),
    ProcedureModel(
      procedureImage: procedureImageTwo,
      procedureName: "Face Lift",
      procedureDiscription: faceLift,
    ),
    ProcedureModel(
      procedureImage: procedureImageTwo,
      procedureName: "Neck Lift",
      procedureDiscription: neckLift,
    ),
    ProcedureModel(
      procedureImage: procedureImageTwo,
      procedureName: "Eyelid Surgery",
      procedureDiscription: eyelidSurgery,
    ),
    ProcedureModel(
      procedureImage: procedureImageTwo,
      procedureName: "Rhinoplasty",
      procedureDiscription: rhinoplasty,
    ),
    ProcedureModel(
      procedureImage: procedureImageThree,
      procedureName: "Gynecomastia",
      procedureDiscription: Gynecomastia,
    ),
  ];
}
