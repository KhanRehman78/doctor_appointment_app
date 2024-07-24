import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:doctor_app/common/libraries.dart';
import 'package:doctor_app/custom_widgets/custom_text_fetchform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import '../common/colors.dart';
import '../common/images.dart';
import '../custom_widgets/bg_widget.dart';
import '../custom_widgets/custom_text.dart';

class FetchClientDetailForm extends StatefulWidget {
  final String? fullName;
  final String? gender;
  final String? procedure;
  final String? emailAddress;
  final String? phoneNumber;
  final String? age;
  final String? height;
  final String? weight;
  final String? preferredContactMethod;
  final String? doYouSmoke;
  final String? doYouDrinkAlcohol;
  final String? doYouUseDrugs;
  final String? doYouFollowDiet;

  ///
  final String? doYouSufferChronicAcuteIllness;
  final String? doYouSufferCongenitalCondition;
  final String? doYouSufferAnyAllergies;
  final String? doYouSufferThyroidCondition;
  final String? doYouSufferFromAsthma;
  final String? doYouSufferFromObesity;
  final String? doYouHaveProblemsBreathing;
  final String? doYouTakeMedications;
  final String? doYouTakeVitamins;
  final String? doYouSufferFromDiabetes;
  final String? doYouSufferHighBloodPressure;
  final String? doYouSufferBleedingProblems;
  final String? doYouRequiereMedicalTreatment;
  final String? haveYouReceivedBloodTransfusions;
  final String? anyAdditionalInformation;

  ///
  final String? explainTypesOfSurgeriesAndDates;
  final String? explainSurgeryOrAnesthesiaComplications;

  ///
  final String? areYouPregnant;
  final String? howManyPregnancies;
  final String? abortionsOrMiscarriagesOnlyWomen;
  final String? wouldYouLikeToBecomePregnant;
  final String? HadA_C_Section;

  ///
  final String? theOfBariatricSurgery;
  final String? whenDidYouHaveSurgery;

  final String? weightBeforeSurgery;
  final String? currentWeightForHowLong;

  ///

  List<dynamic>? procedureImages;

  FetchClientDetailForm(
      {super.key,
      this.procedureImages,
      this.fullName,
      this.gender,
      this.procedure,
      this.emailAddress,
      this.phoneNumber,
      this.age,
      this.height,
      this.weight,
      this.preferredContactMethod,
      this.doYouSmoke,
      this.doYouDrinkAlcohol,
      this.doYouUseDrugs,
      this.doYouFollowDiet,
      this.doYouSufferChronicAcuteIllness,
      this.doYouSufferCongenitalCondition,
      this.doYouSufferAnyAllergies,
      this.doYouSufferThyroidCondition,
      this.doYouSufferFromAsthma,
      this.doYouSufferFromObesity,
      this.doYouHaveProblemsBreathing,
      this.doYouTakeMedications,
      this.doYouTakeVitamins,
      this.doYouSufferFromDiabetes,
      this.doYouSufferHighBloodPressure,
      this.doYouSufferBleedingProblems,
      this.doYouRequiereMedicalTreatment,
      this.haveYouReceivedBloodTransfusions,
      this.anyAdditionalInformation,
      this.explainTypesOfSurgeriesAndDates,
      this.explainSurgeryOrAnesthesiaComplications,
      this.areYouPregnant,
      this.howManyPregnancies,
      this.abortionsOrMiscarriagesOnlyWomen,
      this.wouldYouLikeToBecomePregnant,
      this.HadA_C_Section,
      this.theOfBariatricSurgery,
      this.whenDidYouHaveSurgery,
      this.weightBeforeSurgery,
      this.currentWeightForHowLong});

  @override
  State<FetchClientDetailForm> createState() => _FetchClientDetailFormState();
}

class _FetchClientDetailFormState extends State<FetchClientDetailForm> {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidegt(
        context,
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Stack(
                children: [
                  Container(
                    height: 335,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: greyColor,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(70)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        Center(
                          child: Column(
                            children: [
                              Image.asset(
                                doctorNameImage,
                                width: 330,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              OurText(
                                size: 26,
                                fontWeight: FontWeight.w600,
                                tittle: "patient’s data",
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 155,
                                width: 155,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(doctorCircleImage),
                                      fit: BoxFit.fitWidth),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: greyColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CustomTextFetchForm(
                                            tittle: "Full Name :",
                                          ),
                                          const Spacer(),
                                          CustomTextFetchForm(
                                              tittle:
                                                  widget.fullName.toString()),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          CustomTextFetchForm(
                                            tittle: "Gender :",
                                          ),
                                          const Spacer(),
                                          CustomTextFetchForm(
                                              tittle: widget.gender.toString()),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          CustomTextFetchForm(
                                            tittle: "Procedure :",
                                          ),
                                          const Spacer(),
                                          CustomTextFetchForm(
                                              tittle:
                                                  widget.procedure.toString()),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          CustomTextFetchForm(
                                            tittle: "Email Address :",
                                          ),
                                          const Spacer(),
                                          CustomTextFetchForm(
                                              tittle: widget.emailAddress
                                                  .toString()),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          CustomTextFetchForm(
                                            tittle: "Phone Number :",
                                          ),
                                          const Spacer(),
                                          CustomTextFetchForm(
                                              tittle: widget.phoneNumber
                                                  .toString()),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          CustomTextFetchForm(
                                            tittle: "Age :",
                                          ),
                                          const Spacer(),
                                          CustomTextFetchForm(
                                              tittle: widget.age.toString()),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          CustomTextFetchForm(
                                            tittle: "Height :",
                                          ),
                                          const Spacer(),
                                          CustomTextFetchForm(
                                              tittle: widget.height.toString()),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          CustomTextFetchForm(
                                            tittle: "Weight :",
                                          ),
                                          const Spacer(),
                                          CustomTextFetchForm(
                                              tittle: widget.weight.toString()),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          CustomTextFetchForm(
                                            tittle:
                                                "Preferred Contact Method ?* :",
                                          ),
                                          const Spacer(),
                                          CustomTextFetchForm(
                                              tittle: widget
                                                  .preferredContactMethod
                                                  .toString()),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      OurText(
                                        fontWeight: FontWeight.bold,
                                        size: 16,
                                        tittle: "Images",
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        height: 130,
                                        child: ListView.builder(
                                          itemCount:
                                              widget.procedureImages!.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: InstaImageViewer(
                                                  child: Image.network(
                                                    widget.procedureImages![
                                                        index],
                                                    fit: BoxFit.fill,
                                                    height: 100,
                                                    width: 130,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),

                                      /// Life Style
                                      OurText(
                                        fontWeight: FontWeight.bold,
                                        size: 16,
                                        tittle: "Life Style",
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      CustomTextFetchForm(
                                        tittle: "Do you smoke?",
                                      ),
                                      CustomTextFetchForm(
                                        tittle: widget.doYouSmoke.toString(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextFetchForm(
                                        tittle: "Do you drink alcohol ?",
                                      ),
                                      CustomTextFetchForm(
                                        tittle:
                                            widget.doYouDrinkAlcohol.toString(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      CustomTextFetchForm(
                                        tittle: "Do you use drugs?",
                                      ),
                                      CustomTextFetchForm(
                                        tittle: widget.doYouUseDrugs.toString(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      CustomTextFetchForm(
                                        tittle: "Do you follow a diet?",
                                      ),
                                      CustomTextFetchForm(
                                        tittle:
                                            widget.doYouFollowDiet.toString(),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),

                                      /// Medical History
                                      OurText(
                                        fontWeight: FontWeight.bold,
                                        size: 16,
                                        tittle: "Medical History",
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      CustomTextFetchForm(
                                        tittle:
                                            "Do you suffer chronic or acute illness?",
                                      ),
                                      CustomTextFetchForm(
                                        tittle: widget
                                            .doYouSufferChronicAcuteIllness
                                            .toString(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextFetchForm(
                                        tittle:
                                            "Do you suffer a congenital condition?",
                                      ),
                                      CustomTextFetchForm(
                                        tittle: widget
                                            .doYouSufferCongenitalCondition
                                            .toString(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextFetchForm(
                                        tittle: "Do you suffer any allergies?",
                                      ),
                                      CustomTextFetchForm(
                                        tittle: widget.doYouSufferAnyAllergies
                                            .toString(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextFetchForm(
                                        tittle:
                                            "Do you suffer a thyroid condition?",
                                      ),
                                      CustomTextFetchForm(
                                        tittle: widget
                                            .doYouSufferThyroidCondition
                                            .toString(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextFetchForm(
                                        tittle: "Do you suffer from asthma?",
                                      ),
                                      CustomTextFetchForm(
                                        tittle: widget.doYouSufferFromAsthma
                                            .toString(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextFetchForm(
                                        tittle: "Do you suffer from obesity?",
                                      ),
                                      CustomTextFetchForm(
                                        tittle: widget.doYouSufferFromObesity
                                            .toString(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextFetchForm(
                                        tittle:
                                            "Do you have problems breathing?",
                                      ),
                                      CustomTextFetchForm(
                                        tittle: widget
                                            .doYouHaveProblemsBreathing
                                            .toString(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextFetchForm(
                                        tittle: "Do you take medications?",
                                      ),
                                      CustomTextFetchForm(
                                        tittle: widget.doYouTakeMedications
                                            .toString(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextFetchForm(
                                        tittle: "Do you take vitamins?",
                                      ),
                                      CustomTextFetchForm(
                                        tittle:
                                            widget.doYouTakeVitamins.toString(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextFetchForm(
                                        tittle: "Do you suffer from diabetes?",
                                      ),
                                      CustomTextFetchForm(
                                        tittle: widget.doYouSufferFromDiabetes
                                            .toString(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextFetchForm(
                                        tittle:
                                            "Do you suffer high blood pressure?",
                                      ),
                                      CustomTextFetchForm(
                                        tittle: widget
                                            .doYouSufferHighBloodPressure
                                            .toString(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextFetchForm(
                                        tittle:
                                            "Do you suffer bleeding problems?",
                                      ),
                                      CustomTextFetchForm(
                                        tittle: widget
                                            .doYouSufferBleedingProblems
                                            .toString(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextFetchForm(
                                        tittle:
                                            "Do you requiere medical treatment?",
                                      ),
                                      CustomTextFetchForm(
                                        tittle: widget
                                            .doYouRequiereMedicalTreatment
                                            .toString(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextFetchForm(
                                        tittle:
                                            "Have you received blood transfusions?",
                                      ),
                                      CustomTextFetchForm(
                                        tittle: widget.haveYouReceivedBloodTransfusions.toString(),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextFetchForm(
                                        tittle: "Any additional information?",
                                      ),
                                      CustomTextFetchForm(
                                        tittle: widget.anyAdditionalInformation.toString(),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),

                                      /// PAST SURGERIES

                                      OurText(
                                        fontWeight: FontWeight.bold,
                                        size: 16,
                                        tittle: "Past Surgeries",
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      CustomTextFetchForm(
                                          tittle:
                                              "Do you have Past Surgeries or Not ?"),
                                      CustomTextFetchForm(
                                        tittle: widget
                                            .explainTypesOfSurgeriesAndDates
                                            .toString(),
                                      ),

                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextFetchForm(
                                        tittle:
                                            "Explain Surgery or anesthesia complications ....",
                                      ),
                                      CustomTextFetchForm(
                                        tittle: widget
                                            .explainSurgeryOrAnesthesiaComplications
                                            .toString(),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),

                                      /// WOMEN ONLY
                                      OurText(
                                        fontWeight: FontWeight.bold,
                                        size: 16,
                                        tittle: "Women Only",
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      CustomTextFetchForm(
                                        tittle: "Are you pregnant?",
                                      ),
                                      CustomTextFetchForm(
                                        tittle:
                                            widget.areYouPregnant.toString(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextFetchForm(
                                        tittle: "How many pregnancies?",
                                      ),
                                      CustomTextFetchForm(
                                        tittle: widget.howManyPregnancies
                                            .toString(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextFetchForm(
                                        tittle: "Abortions or miscarriages?",
                                      ),
                                      CustomTextFetchForm(
                                        tittle: widget
                                            .abortionsOrMiscarriagesOnlyWomen
                                            .toString(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextFetchForm(
                                        tittle:
                                            "Would you like to become pregnant?",
                                      ),
                                      CustomTextFetchForm(
                                        tittle: widget
                                            .wouldYouLikeToBecomePregnant
                                            .toString(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextFetchForm(
                                        tittle: "Had a C-section?",
                                      ),
                                      CustomTextFetchForm(
                                        tittle:
                                            widget.HadA_C_Section.toString(),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),

                                      /// Body Contouring
                                      OurText(
                                        fontWeight: FontWeight.bold,
                                        size: 16,
                                        tittle: "Body Contouring",
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      CustomTextFetchForm(
                                        tittle: "The of bariatric surgery?",
                                      ),
                                      CustomTextFetchForm(
                                        tittle: widget.theOfBariatricSurgery
                                            .toString(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextFetchForm(
                                        tittle: "When did you have surgery?",
                                      ),
                                      CustomTextFetchForm(
                                        tittle: widget.whenDidYouHaveSurgery
                                            .toString(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextFetchForm(
                                        tittle: "Weight before surgery?",
                                      ),
                                      CustomTextFetchForm(
                                        tittle: widget.weightBeforeSurgery
                                            .toString(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextFetchForm(
                                        tittle: "Current weight for how long?",
                                      ),
                                      CustomTextFetchForm(
                                        tittle: widget.currentWeightForHowLong
                                            .toString(),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
