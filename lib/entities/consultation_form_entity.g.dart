// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_form_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsultationFormEntity _$ConsultationFormEntityFromJson(
        Map<String, dynamic> json) =>
    ConsultationFormEntity(
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      fullName: json['fullName'] as String?,
      emailAddress: json['emailAddress'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      age: json['age'] as String?,
      height: json['height'] as String?,
      weight: json['weight'] as String?,
      gender: json['gender'] as String?,
      preferredContactMethod: json['preferredContactMethod'] as String?,
      selectProcedure: json['selectProcedure'] as String?,
      doYouSmoke: json['doYouSmoke'] as String?,
      doYouDrinkAlcohol: json['doYouDrinkAlcohol'] as String?,
      doYouUseDrugs: json['doYouUseDrugs'] as String?,
      doYouFollowDiet: json['doYouFollowDiet'] as String?,
      doYouSufferChronicAcuteIllness:
          json['doYouSufferChronicAcuteIllness'] as String?,
      doYouSufferCongenitalCondition:
          json['doYouSufferCongenitalCondition'] as String?,
      doYouSufferAnyAllergies: json['doYouSufferAnyAllergies'] as String?,
      doYouSufferThyroidCondition:
          json['doYouSufferThyroidCondition'] as String?,
      doYouSufferFromAsthma: json['doYouSufferFromAsthma'] as String?,
      doYouSufferFromObesity: json['doYouSufferFromObesity'] as String?,
      doYouHaveProblemsBreathing: json['doYouHaveProblemsBreathing'] as String?,
      doYouTakeMedications: json['doYouTakeMedications'] as String?,
      doYouTakeVitamins: json['doYouTakeVitamins'] as String?,
      doYouSufferFromDiabetes: json['doYouSufferFromDiabetes'] as String?,
      doYouSufferHighBloodPressure:
          json['doYouSufferHighBloodPressure'] as String?,
      doYouSufferBleedingProblems:
          json['doYouSufferBleedingProblems'] as String?,
      doYouRequiereMedicalTreatment:
          json['doYouRequiereMedicalTreatment'] as String?,
      haveYouReceivedBloodTransfusions:
          json['haveYouReceivedBloodTransfusions'] as String?,
      anyAdditionalInformation: json['anyAdditionalInformation'] as String?,
      explainTypesOfSurgeriesAndDates:
          json['explainTypesOfSurgeriesAndDates'] as String?,
      explainSurgeryOrAnesthesiaComplications:
          json['explainSurgeryOrAnesthesiaComplications'] as String?,
      areYouPregnant: json['areYouPregnant'] as String?,
      howManyPregnancies: json['howManyPregnancies'] as String?,
      abortionsOrMiscarriagesOnlyWomen:
          json['abortionsOrMiscarriagesOnlyWomen'] as String?,
      wouldYouLikeToBecomePregnant:
          json['wouldYouLikeToBecomePregnant'] as String?,
      HadA_C_Section: json['HadA_C_Section'] as String?,
      theOfBariatricSurgery: json['theOfBariatricSurgery'] as String?,
      whenDidYouHaveSurgery: json['whenDidYouHaveSurgery'] as String?,
      weightBeforeSurgery: json['weightBeforeSurgery'] as String?,
      currentWeightForHowLong: json['currentWeightForHowLong'] as String?,
      procedureImagesUrlList: (json['procedureImagesUrlList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ConsultationFormEntityToJson(
        ConsultationFormEntity instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp?.toIso8601String(),
      'fullName': instance.fullName,
      'emailAddress': instance.emailAddress,
      'phoneNumber': instance.phoneNumber,
      'age': instance.age,
      'height': instance.height,
      'weight': instance.weight,
      'gender': instance.gender,
      'preferredContactMethod': instance.preferredContactMethod,
      'selectProcedure': instance.selectProcedure,
      'doYouSmoke': instance.doYouSmoke,
      'doYouDrinkAlcohol': instance.doYouDrinkAlcohol,
      'doYouUseDrugs': instance.doYouUseDrugs,
      'doYouFollowDiet': instance.doYouFollowDiet,
      'doYouSufferChronicAcuteIllness': instance.doYouSufferChronicAcuteIllness,
      'doYouSufferCongenitalCondition': instance.doYouSufferCongenitalCondition,
      'doYouSufferAnyAllergies': instance.doYouSufferAnyAllergies,
      'doYouSufferThyroidCondition': instance.doYouSufferThyroidCondition,
      'doYouSufferFromAsthma': instance.doYouSufferFromAsthma,
      'doYouSufferFromObesity': instance.doYouSufferFromObesity,
      'doYouHaveProblemsBreathing': instance.doYouHaveProblemsBreathing,
      'doYouTakeMedications': instance.doYouTakeMedications,
      'doYouTakeVitamins': instance.doYouTakeVitamins,
      'doYouSufferFromDiabetes': instance.doYouSufferFromDiabetes,
      'doYouSufferHighBloodPressure': instance.doYouSufferHighBloodPressure,
      'doYouSufferBleedingProblems': instance.doYouSufferBleedingProblems,
      'doYouRequiereMedicalTreatment': instance.doYouRequiereMedicalTreatment,
      'haveYouReceivedBloodTransfusions':
          instance.haveYouReceivedBloodTransfusions,
      'anyAdditionalInformation': instance.anyAdditionalInformation,
      'explainTypesOfSurgeriesAndDates':
          instance.explainTypesOfSurgeriesAndDates,
      'explainSurgeryOrAnesthesiaComplications':
          instance.explainSurgeryOrAnesthesiaComplications,
      'areYouPregnant': instance.areYouPregnant,
      'howManyPregnancies': instance.howManyPregnancies,
      'abortionsOrMiscarriagesOnlyWomen':
          instance.abortionsOrMiscarriagesOnlyWomen,
      'wouldYouLikeToBecomePregnant': instance.wouldYouLikeToBecomePregnant,
      'HadA_C_Section': instance.HadA_C_Section,
      'theOfBariatricSurgery': instance.theOfBariatricSurgery,
      'whenDidYouHaveSurgery': instance.whenDidYouHaveSurgery,
      'weightBeforeSurgery': instance.weightBeforeSurgery,
      'currentWeightForHowLong': instance.currentWeightForHowLong,
      'procedureImagesUrlList': instance.procedureImagesUrlList,
    };
