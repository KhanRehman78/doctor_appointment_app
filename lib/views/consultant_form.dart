import 'dart:async';
import 'package:doctor_app/common/libraries.dart';
import 'package:doctor_app/entities/consultation_form_entity.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class ConsultantForm extends StatefulWidget {
  const ConsultantForm({super.key});

  @override
  State<ConsultantForm> createState() => _ConsultantFormState();
}

class _ConsultantFormState extends State<ConsultantForm> {
  /// Personal Information
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _preferdContactMethodController =
      TextEditingController();

  /// Life Style
  final TextEditingController _smokeController = TextEditingController();
  final TextEditingController _drinkAlcoholController = TextEditingController();
  final TextEditingController _drugsController = TextEditingController();
  final TextEditingController _followDietController = TextEditingController();

  /// Medical History
  final TextEditingController _sufferChronicController =
      TextEditingController();
  final TextEditingController _congenitalConditionController =
      TextEditingController();
  final TextEditingController _allergiesController = TextEditingController();

  final TextEditingController _thyroidConditionController =
      TextEditingController();
  final TextEditingController _asthmaController = TextEditingController();
  final TextEditingController _obesityController = TextEditingController();
  final TextEditingController _breathingController = TextEditingController();
  final TextEditingController _medicationsController = TextEditingController();
  final TextEditingController _vitaminsController = TextEditingController();
  final TextEditingController _diabetesController = TextEditingController();
  final TextEditingController _bpController = TextEditingController();
  final TextEditingController _bleedingController = TextEditingController();
  final TextEditingController _reqmedicaltreatmentController =
      TextEditingController();
  final TextEditingController _bloodtransfusionController =
      TextEditingController();
  final TextEditingController _additionnalinfoController =
      TextEditingController();

  /// past surgeries
  final TextEditingController _surgeriedateController = TextEditingController();
  final TextEditingController _surgeriecomplicationsController =
      TextEditingController();

  /// Women only
  final TextEditingController _areyoupregnantController =
      TextEditingController();
  final TextEditingController _pregnanciesController = TextEditingController();
  final TextEditingController _abbortionOnlyWomenController =
      TextEditingController();
  final TextEditingController _becomepregnantController =
      TextEditingController();
  final TextEditingController _cSectionController = TextEditingController();

  /// Body Contouring
  final TextEditingController _bariatricSurgeryController =
      TextEditingController();
  final TextEditingController _whendoyouhaveSurgeryController =
      TextEditingController();
  final TextEditingController _abortionsOrMisCarriages =
      TextEditingController();
  final TextEditingController _weightbeforesurgeryController =
      TextEditingController();
  final TextEditingController _currentWeightController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _selectProcedure;
  bool isLoading = false;

  List<XFile> imagesFiles = [];
  List<File>? imageFiles = [];

  // final picker = ImagePicker();

  /// With Chat GPT
  final picker = ImagePicker();
  List<XFile> _imageFiles = [];

  Future<void> _pickImages() async {
    final pickedFiles = await picker.pickMultiImage();
    setState(() {
      _imageFiles = pickedFiles!;
    });
  }

  /// final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return BackgroundWidegt(
        context,
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 40),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 54,
                          height: 54,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border(
                                right: BorderSide(
                                  color: Colors.black,
                                ),
                                left: BorderSide(
                                  color: Colors.black,
                                ),
                                top: BorderSide(
                                  color: Colors.black,
                                ),
                                bottom: BorderSide(
                                  color: Colors.black,
                                )),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Center(
                              child: Icon(
                                size: 30,
                                Icons.arrow_back_ios,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        doctorNameImage,
                        width: 330,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: FittedBox(
                        child: OurText(
                          size: 32,
                          fontWeight: FontWeight.w600,
                          tittle: "Consultation Form",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FittedBox(
                      child: OurText(
                        fontWeight: FontWeight.w500,
                        size: 24,
                        tittle: "1. PERSONAL INFORMATION*",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      hintText: "Your full Name ?*",
                      textController: _nameController,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Email';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      textController: _emailController,
                      hintText: "Email Address ?*",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Phone Number';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      textController: _phoneNumberController,
                      hintText: "Phone Number ?*",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Age';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      textController: _ageController,
                      hintText: "Age ?*",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Height';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      textController: _heightController,
                      hintText: "Height ?*",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Weight';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      textController: _weightController,
                      hintText: "Weight ?*",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Gender';
                        }
                        return null;
                      },
                      textController: _genderController,
                      hintText: "Gender ?*",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Preferred Contact Method';
                        }
                        return null;
                      },
                      textController: _preferdContactMethodController,
                      hintText: "Preferred Contact Method ?*",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    OurText(
                      fontWeight: FontWeight.w500,
                      size: 24,
                      tittle: "2. PROCEDURES",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    OurText(
                      tittle:
                          "Click on the box below to choose the procedure from the drop down menu*",
                      size: 16,
                      fontWeight: FontWeight.w300,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: DropdownButton<String>(
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: 28,
                                  color: Colors.black,
                                ),
                                isExpanded: true,
                                focusColor: greyColor,
                                dropdownColor: greyColor,
                                borderRadius: BorderRadius.circular(15),
                                hint: const Text('LIST OF PROCEDURES '),
                                value: _selectProcedure,
                                onChanged: (value) {
                                  setState(() {
                                    _selectProcedure = value!;
                                  });
                                },
                                items: <String>[
                                  'Mommy Makeover',
                                  'Breast Augmentation',
                                  'Breast lift',
                                  'Liposuction',
                                  // Add comma after each string
                                  'Tummy Tuck',
                                  // Add comma after each string
                                  'Brazilian Butt Lift',
                                  // Add comma after each string
                                  'Arm Lift',
                                  // Add comma after each string
                                  'Body Contouring',
                                  // Add comma after each string
                                  'Labiaplasty',
                                  // Add comma after each string
                                  'Gynecomastia',
                                  // Add comma after each string
                                  'Facelift',
                                  // Add comma after each string
                                  'Neck Lift',
                                  // Add comma after each string
                                  'Eyelid Surgery',
                                  // Add comma after each string
                                  'Rhinoplasty',
                                  // Add comma after each string
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    OurText(
                      fontWeight: FontWeight.w500,
                      size: 24,
                      tittle: "3. PHOTOS",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    OurText(
                      tittle:
                          "An option for the patient to send photos for evaluation",
                      size: 16,
                      fontWeight: FontWeight.w300,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await _pickImages();
                      },
                      child: Container(
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: _imageFiles!.isNotEmpty
                            ? SizedBox(
                                height: 180,
                                width: double.infinity,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _imageFiles.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(right: 8),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: InstaImageViewer(
                                          child: Image.file(
                                            File(
                                              _imageFiles[index].path,
                                            ),
                                            height: 80,
                                            width: 150,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Container(
                                height: 180,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(groupImage),
                                        fit: BoxFit.contain))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    OurText(
                      fontWeight: FontWeight.w500,
                      size: 24,
                      tittle: "4. LIFE STYLE*",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Fill The Field';
                        }
                        return null;
                      },
                      textController: _smokeController,
                      hintText: "Do you smoke ?*",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Fill The Field';
                        }
                        return null;
                      },
                      textController: _drinkAlcoholController,
                      hintText: "Do you drink alcohol ?*",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Fill The Field';
                        }
                        return null;
                      },
                      textController: _drugsController,
                      hintText: "Do you use drugs ?*",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Fill The Field';
                        }
                        return null;
                      },
                      textController: _followDietController,
                      hintText: "Do you follow a diet ?*",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    OurText(
                      fontWeight: FontWeight.w500,
                      size: 24,
                      tittle: "5. MEDICAL HISTORY",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      textController: _sufferChronicController,
                      hintText: "Do you suffer chronic or acute illness?",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      textController: _congenitalConditionController,
                      hintText: "Do you suffer a congenital condition?",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      textController: _allergiesController,
                      hintText: "Do you suffer any allergies?",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      textController: _thyroidConditionController,
                      hintText: "Do you suffer a thyroid condition?",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      textController: _asthmaController,
                      hintText: "Do you suffer from asthma?",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      textController: _obesityController,
                      hintText: "Do you suffer from obesity?",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      textController: _breathingController,
                      hintText: "Do you have problems breathing?",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      textController: _medicationsController,
                      hintText: "Do you take medications?",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      textController: _vitaminsController,
                      hintText: "Do you take vitamins?",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      textController: _diabetesController,
                      hintText: "Do you suffer from diabetes?",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      textController: _bpController,
                      hintText: "Do you suffer high blood pressure?",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      textController: _bleedingController,
                      hintText: "Do you suffer bleeding problems?",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      textController: _reqmedicaltreatmentController,
                      hintText: "Do you requiere medical treatment?",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      textController: _bloodtransfusionController,
                      hintText: "Have you received blood transfusions?",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      textController: _additionnalinfoController,
                      hintText: "Any additional information?",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    OurText(
                      fontWeight: FontWeight.w500,
                      size: 24,
                      tittle: "6. PAST SURGERIES",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Fill The Field';
                        }
                        return null;
                      },
                      textController: _surgeriedateController,
                      hintText: "Do you have Past Surgeries or Not ?",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      textController: _surgeriecomplicationsController,
                      maxLines: 6,
                      hintText:
                          "Explain Surgery or anesthesia \ncomplications ....",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    OurText(
                      fontWeight: FontWeight.w500,
                      size: 24,
                      tittle: "7. WOMEN ONLY",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      textController: _areyoupregnantController,
                      hintText: "Are you pregnant?",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      textController: _pregnanciesController,
                      hintText: "How many pregnancies?",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      textController: _abbortionOnlyWomenController,
                      hintText: "Abortions or miscarriages?",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      textController: _becomepregnantController,
                      hintText: "Would you like to become pregnant?",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      textController: _cSectionController,
                      hintText: "Had a C-section?",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    OurText(
                      fontWeight: FontWeight.w500,
                      size: 24,
                      tittle: "8. BODY CONTOURING",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      textController: _bariatricSurgeryController,
                      hintText: "Type of bariatric surgery?",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      textController: _whendoyouhaveSurgeryController,
                      hintText: "When did you have surgery?",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      textController: _weightbeforesurgeryController,
                      hintText: "Weight before surgery?",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      textController: _currentWeightController,
                      hintText: "Current weight for how long?",
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: saveForm,
                      child: Center(
                        child: Container(
                          height: 60,
                          width: 250,
                          decoration: BoxDecoration(
                            color: greyColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: isLoading == true
                                ? const SpinKitCircle(
                                    color: Colors.black,
                                  )
                                : OurText(
                                    size: 18,
                                    fontWeight: FontWeight.w700,
                                    tittle: "Submit",
                                  ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Future getImage() async {
    imagesFiles = await picker.pickMultiImage();

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        imageFiles?.add(File(pickedFile.path));
      } else {
        print('No image selected.');
      }
    });
  }

  void saveForm() async {
    try {
      if (_formKey.currentState!.validate()) {
        setState(() {
          isLoading = true;
        });
        ConsultationFormEntity consultationFormObject = ConsultationFormEntity(
          timestamp: DateTime.now(),
          fullName: _nameController.text.trim(),
          emailAddress: _emailController.text,
          phoneNumber: _phoneNumberController.text,
          age: _ageController.text,
          height: _heightController.text,
          weight: _weightController.text,
          gender: _genderController.text,
          preferredContactMethod: _preferdContactMethodController.text,
          selectProcedure: _selectProcedure.toString(),
          doYouSmoke: _smokeController.text,
          doYouDrinkAlcohol: _drinkAlcoholController.text,
          doYouUseDrugs: _drugsController.text,
          doYouFollowDiet: _followDietController.text,
          doYouSufferChronicAcuteIllness: _sufferChronicController.text,
          doYouSufferCongenitalCondition: _congenitalConditionController.text,
          doYouSufferAnyAllergies: _allergiesController.text,
          doYouSufferThyroidCondition: _thyroidConditionController.text,
            doYouSufferFromAsthma: _asthmaController.text,
          doYouSufferFromObesity: _obesityController.text,
          doYouHaveProblemsBreathing: _breathingController.text,
          doYouTakeMedications: _medicationsController.text,
          doYouTakeVitamins: _vitaminsController.text,
          doYouSufferFromDiabetes: _diabetesController.text,
          doYouSufferHighBloodPressure: _bpController.text,
          doYouSufferBleedingProblems: _bleedingController.text,
          doYouRequiereMedicalTreatment: _medicationsController.text,
          haveYouReceivedBloodTransfusions: _bloodtransfusionController.text,
          anyAdditionalInformation: _additionnalinfoController.text,
          explainTypesOfSurgeriesAndDates: _surgeriedateController.text,
          explainSurgeryOrAnesthesiaComplications:
              _surgeriecomplicationsController.text,
          areYouPregnant: _areyoupregnantController.text,
          howManyPregnancies: _pregnanciesController.text,
          abortionsOrMiscarriagesOnlyWomen: _abbortionOnlyWomenController.text,
          wouldYouLikeToBecomePregnant: _becomepregnantController.text,
          HadA_C_Section: _cSectionController.text,
          theOfBariatricSurgery: _bariatricSurgeryController.text,
          whenDidYouHaveSurgery: _whendoyouhaveSurgeryController.text,
          weightBeforeSurgery: _weightbeforesurgeryController.text,
          currentWeightForHowLong: _currentWeightController.text,
        );

        String id = ConsultationFormEntity.collection().doc().id;
        int imagesLength = _imageFiles.length > 5 ? 5 : _imageFiles.length;
        for (int i = 0; i < imagesLength; i++) {
          await FirebaseStorage.instance
              .ref("proceduresImages")
              .child(id + i.toString())
              .putFile(File(_imageFiles[i].path),
                  SettableMetadata(contentType: 'jpeg'));
        }
        List<String> ulrList = [];
        for (int i = 0; i < imagesLength; i++) {
          String url = await FirebaseStorage.instance
              .ref("proceduresImages")
              .child(id + i.toString())
              .getDownloadURL();
          ulrList.add(url);
        }
        consultationFormObject.procedureImagesUrlList = ulrList;
        // await FirebaseStorage.instance.ref("procedureImages").child(id+)
        //
        // int imagesLength = imagesFiles.length > 3 ? 3 : imagesFiles.length;
        // for (int i = 0; i < imagesLength; i++) {
        //   await FirebaseStorage.instance
        //       .ref("proceduresImages")
        //       .child(id + i.toString())
        //       .putFile(File(imagesFiles[i].path),
        //           SettableMetadata(contentType: 'jpeg'));
        // }
        // List<String> ulrList = [];
        // for (int i = 0; i < imagesLength; i++) {
        //   String url = await FirebaseStorage.instance
        //       .ref("proceduresImages")
        //       .child(id + i.toString())
        //       .getDownloadURL();
        //   ulrList.add(url);
        // }
        // consultationFormObject.procedureImagesUrlList = ulrList;

        await ConsultationFormEntity.collection()
            .doc(id)
            .set(consultationFormObject);
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Consultation Form Registerd Successfully")));
        _nameController.clear();
        _emailController.clear();
        _phoneNumberController.clear();
        _ageController.clear();
        _heightController.clear();
        _weightController.clear();
        _genderController.clear();
        _preferdContactMethodController.clear();
        _smokeController.clear();
        _drinkAlcoholController.clear();
        _drugsController.clear();
        _followDietController.clear();
        _sufferChronicController.clear();
        _congenitalConditionController.clear();
        _allergiesController.clear();
        _thyroidConditionController.clear();
        _asthmaController.clear();
        _obesityController.clear();
        _breathingController.clear();
        _medicationsController.clear();
        _vitaminsController.clear();
        _diabetesController.clear();
        _bpController.clear();
        _bleedingController.clear();
        _medicationsController.clear();
        _bloodtransfusionController.clear();
        _additionnalinfoController.clear();
        _surgeriedateController.clear();
        _surgeriecomplicationsController.clear();
        _areyoupregnantController.clear();
        _pregnanciesController.clear();
        _abbortionOnlyWomenController.clear();
        _becomepregnantController.clear();
        _cSectionController.clear();
        _bariatricSurgeryController.clear();
        _whendoyouhaveSurgeryController.clear();
        _weightbeforesurgeryController.clear();
        _currentWeightController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Fields Are Not Filled")));
        return;
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Error Occures")));
    }
  }
}
