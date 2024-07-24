import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/common/libraries.dart';
import 'package:doctor_app/custom_widgets/custom_text_fetchform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'fetch_clients_detail_form.dart';

class FetchForms extends StatefulWidget {
  const FetchForms({super.key});

  @override
  State<FetchForms> createState() => _FetchFormsState();
}

class _FetchFormsState extends State<FetchForms> {
  Future<QuerySnapshot> getForms =
      FirebaseFirestore.instance.collection('consultation_form').get();

  @override
  Widget build(BuildContext context) {
    return BackgroundWidegt(
        context,
        Scaffold(
          backgroundColor: Colors.transparent,
          body: FutureBuilder(
            future: getForms,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: SpinKitCircle(
                  color: greyColor,
                ));
              }
              if (snapshot.hasError) {
                return Center(child: const Text("Error Found"));
              }
              if (snapshot.data == null) {
                return Center(child: const Text("No Consultation Form Found"));
              }

              return SizedBox(
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
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(70)),
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
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      var data = snapshot.data!.docs;
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    FetchClientDetailForm(
                                                  fullName: data[index]
                                                      ['fullName'],
                                                  emailAddress: data[index]
                                                      ['emailAddress'],
                                                  gender: data[index]['gender'],
                                                  phoneNumber: data[index]
                                                      ['phoneNumber'],
                                                  age: data[index]['age'],
                                                  height: data[index]['height'],
                                                  weight: data[index]['weight'],
                                                  procedure: data[index]
                                                      ['selectProcedure'],
                                                  preferredContactMethod: data[
                                                          index][
                                                      'preferredContactMethod'],
                                                  procedureImages: data[index][
                                                      'procedureImagesUrlList'],
                                                  doYouSmoke: data[index]
                                                      ['doYouSmoke'],
                                                  doYouDrinkAlcohol: data[index]
                                                      ['doYouDrinkAlcohol'],
                                                  doYouUseDrugs: data[index]
                                                      ['doYouUseDrugs'],
                                                  doYouFollowDiet: data[index]
                                                      ['doYouFollowDiet'],
                                                  doYouSufferChronicAcuteIllness:
                                                      data[index][
                                                          'doYouSufferChronicAcuteIllness'],
                                                  doYouSufferCongenitalCondition:
                                                      data[index][
                                                          'doYouSufferCongenitalCondition'],
                                                  doYouSufferAnyAllergies: data[
                                                          index][
                                                      'doYouSufferAnyAllergies'],
                                                  doYouSufferThyroidCondition:
                                                      data[index][
                                                          'doYouSufferThyroidCondition'],
                                                  doYouSufferFromAsthma: data[
                                                          index]
                                                      ['doYouSufferFromAsthma'],
                                                  doYouSufferFromObesity: data[
                                                          index][
                                                      'doYouSufferFromDiabetes'],
                                                  doYouHaveProblemsBreathing: data[
                                                          index][
                                                      'doYouHaveProblemsBreathing'],
                                                  doYouTakeMedications: data[
                                                          index]
                                                      ['doYouTakeMedications'],
                                                  doYouTakeVitamins: data[index]
                                                      ['doYouTakeVitamins'],
                                                  doYouSufferFromDiabetes: data[
                                                          index][
                                                      'doYouSufferFromDiabetes'],
                                                  doYouSufferHighBloodPressure:
                                                      data[index][
                                                          'doYouSufferHighBloodPressure'],
                                                  doYouSufferBleedingProblems:
                                                      data[index][
                                                          'doYouSufferBleedingProblems'],
                                                  doYouRequiereMedicalTreatment:
                                                      data[index][
                                                          'doYouRequiereMedicalTreatment'],
                                                  explainTypesOfSurgeriesAndDates:
                                                      data[index][
                                                          'explainTypesOfSurgeriesAndDates'],
                                                  explainSurgeryOrAnesthesiaComplications:
                                                      data[index][
                                                          'explainSurgeryOrAnesthesiaComplications'],
                                                  areYouPregnant: data[index]
                                                      ['areYouPregnant'],
                                                  howManyPregnancies: data[
                                                          index]
                                                      ['howManyPregnancies'],
                                                  abortionsOrMiscarriagesOnlyWomen:
                                                      data[index][
                                                          'abortionsOrMiscarriagesOnlyWomen'],
                                                  wouldYouLikeToBecomePregnant:
                                                      data[index][
                                                          'wouldYouLikeToBecomePregnant'],
                                                  HadA_C_Section: data[index]
                                                      ['HadA_C_Section'],
                                                  theOfBariatricSurgery: data[
                                                          index]
                                                      ['theOfBariatricSurgery'],
                                                  whenDidYouHaveSurgery: data[
                                                          index]
                                                      ['whenDidYouHaveSurgery'],
                                                  weightBeforeSurgery: data[
                                                          index]
                                                      ['weightBeforeSurgery'],
                                                  currentWeightForHowLong: data[
                                                          index][
                                                      'currentWeightForHowLong'],
                                                  haveYouReceivedBloodTransfusions:
                                                      data[index][
                                                          'haveYouReceivedBloodTransfusions'],
                                                  anyAdditionalInformation: data[
                                                          index][
                                                      'anyAdditionalInformation'],
                                                ),
                                              ));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(4),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: greyColor,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
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
                                                          tittle: data[index]
                                                                  ['fullName']
                                                              .toString(),
                                                        ),
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
                                                          tittle: data[index]
                                                                  ['gender']
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        CustomTextFetchForm(
                                                          tittle: "Procrdure :",
                                                        ),
                                                        const Spacer(),
                                                        CustomTextFetchForm(
                                                          tittle: data[index][
                                                                  'selectProcedure']
                                                              .toString(),
                                                        ),
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
                                                          tittle: data[index][
                                                                  'preferredContactMethod']
                                                              .toString(),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
