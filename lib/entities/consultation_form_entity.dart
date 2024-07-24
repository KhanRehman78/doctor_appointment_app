import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'consultation_form_entity.g.dart';

@JsonSerializable()
class ConsultationFormEntity {
  DateTime? timestamp;
  String? fullName;
  String? emailAddress;
  String? phoneNumber;
  String? age;
  String? height;
  String? weight;
  String? gender;
  String? preferredContactMethod;

  ///
  String? selectProcedure;

  ///
  String? doYouSmoke;
  String? doYouDrinkAlcohol;
  String? doYouUseDrugs;
  String? doYouFollowDiet;

  ///
  String? doYouSufferChronicAcuteIllness;
  String? doYouSufferCongenitalCondition;
  String? doYouSufferAnyAllergies;
  String? doYouSufferThyroidCondition;
  String? doYouSufferFromAsthma;
  String? doYouSufferFromObesity;
  String? doYouHaveProblemsBreathing;
  String? doYouTakeMedications;
  String? doYouTakeVitamins;
  String? doYouSufferFromDiabetes;
  String? doYouSufferHighBloodPressure;
  String? doYouSufferBleedingProblems;
  String? doYouRequiereMedicalTreatment;
  String? haveYouReceivedBloodTransfusions;
  String? anyAdditionalInformation;

  ///
  String? explainTypesOfSurgeriesAndDates;
  String? explainSurgeryOrAnesthesiaComplications;

  ///
  String? areYouPregnant;
  String? howManyPregnancies;
  String? abortionsOrMiscarriagesOnlyWomen;
  String? wouldYouLikeToBecomePregnant;
  String? HadA_C_Section;

  ///
  String? theOfBariatricSurgery;
  String? whenDidYouHaveSurgery;

  String? weightBeforeSurgery;
  String? currentWeightForHowLong;
  List<String>? procedureImagesUrlList;

  ConsultationFormEntity({
    this.timestamp,
    this.fullName,
    this.emailAddress,
    this.phoneNumber,
    this.age,
    this.height,
    this.weight,
    this.gender,
    this.preferredContactMethod,
    this.selectProcedure,
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
    this.currentWeightForHowLong,
    this.procedureImagesUrlList =const [],
  });

  factory ConsultationFormEntity.fromJson(Map<String, dynamic> json) =>
      _$ConsultationFormEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultationFormEntityToJson(this);

  static CollectionReference<ConsultationFormEntity> collection() {
    return FirebaseFirestore.instance
        .collection('consultation_form')
        .withConverter(
          fromFirestore: (snapshot, options) =>
              ConsultationFormEntity.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
  }

  static DocumentReference<ConsultationFormEntity> documentReference(
      {required String registerId}) {
    return FirebaseFirestore.instance
        .doc('consultation_form/$registerId')
        .withConverter(
          fromFirestore: (snapshot, options) =>
              ConsultationFormEntity.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
  }
}
