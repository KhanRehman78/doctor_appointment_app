import 'package:doctor_app/common/libraries.dart';
import 'package:doctor_app/custom_widgets/video_player_widget.dart';
import 'package:doctor_app/views/fetch_forms.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:video_player/video_player.dart';

import 'consultant_form.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  late VideoPlayerController _controller;
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    setState(() {});
    _controller =
    VideoPlayerController.asset('assets/video/Dr_illich_video.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  @override
  void dispose() {
    // Dispose of the video player controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidegt(
        context,
        Scaffold(
          floatingActionButton: const CallButton(),
          backgroundColor: Colors.transparent,
          body: Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
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
                    padding: const EdgeInsets.symmetric(horizontal: 22),
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
                                height: 20,
                              ),
                              Center(
                                child: FittedBox(
                                  child: OurText(
                                    size: 24,
                                    fontWeight: FontWeight.w500,
                                    tittle: "Dr. Carlos Illich Navarro",
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                            ],
                          ),
                        ),
                        OurText(
                          fontWeight: FontWeight.w600,
                          size: 17,
                          tittle: "About :",
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        OurText(
                          fontWeight: FontWeight.w500,
                          size: 17,
                          tittle: "Dr. Carlos Illich Navarro is recognized as a"
                              " professional in the art of aesthetic surgery. "
                              "He is a plastic surgeon who uses the most "
                              "advanced surgical techniques.",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: _controller.value.isInitialized
                                      ? ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(20),
                                    child: AspectRatio(
                                      aspectRatio:
                                      _controller.value.aspectRatio,
                                      child: VideoPlayer(_controller),
                                    ),
                                  )
                                      : const Center(
                                      child: SpinKitCircle(
                                        color: greyColor,
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (_controller.value.isPlaying) {
                                          _controller.pause();
                                        } else {
                                          _controller.play();
                                        }
                                      });
                                    },
                                    child: Icon(
                                      size: 25,
                                      color: Colors.white,
                                      _controller.value.isPlaying
                                          ? Icons.pause_circle_filled_rounded
                                          : Icons.play_circle,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ConsultantFormButton(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ConsultantForm(),
                                ));
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        OurText(
                          fontWeight: FontWeight.w600,
                          size: 16,
                          tittle: "Contact :",
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              image: AssetImage(callIcon),
                              width: 30,
                              height: 40,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            OurText(
                              size: 20,
                              fontWeight: FontWeight.w700,
                              tittle: "619 484-3879",
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              image: AssetImage(emailIcon),
                              width: 30,
                              height: 40,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: FittedBox(
                                child: OurText(
                                  size: 16,
                                  fontWeight: FontWeight.w500,
                                  tittle: "office@mommymakeovertijuana.com",
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              image: AssetImage(locationIcon),
                              width: 30,
                              height: 40,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: OurText(
                                onTap: () {},
                                size: 16,
                                fontWeight: FontWeight.w500,
                                tittle:
                                "Paseo del Centenario 9580, Tijuana,\nB. C., Mexico 22010",
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              image: AssetImage(webLinkIcon),
                              width: 30,
                              height: 40,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: FittedBox(
                                child: OurText(
                                  onTap: () {
                                    _launchURL(
                                        'https://www.mommymakeovertijuana.com');
                                  },
                                  size: 16,
                                  myColor: Colors.blueAccent,
                                  fontWeight: FontWeight.w500,
                                  tittle:
                                  "https://www.mommymakeovertijuana.com",
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        OurText(
                          fontWeight: FontWeight.w600,
                          size: 16,
                          tittle: "Location :",
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        GestureDetector(
                          onTap: () {
                            _launchURL('https://rb.gy/1mgkqd');
                          },
                          child: Container(
                            height: 170,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(locationImage)),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                    height: 350,
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Form(
                                          key: _formKey,
                                          child: Column(
                                            children: [
                                              const SizedBox(
                                                height: 25,
                                              ),
                                              OurText(
                                                tittle: "Enter Your Password",
                                                size: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              const SizedBox(
                                                height: 35,
                                              ),
                                              CustomTextFormField(
                                                keyboardType: TextInputType
                                                    .number,
                                                textController:
                                                _passwordController,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Enter Your Password';
                                                  }
                                                  if (value != '03255') {
                                                    return 'Your Password is Incorrect';
                                                  }
                                                },
                                                hintText: "Enter Password",
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  if (_formKey.currentState!
                                                      .validate()) {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                          const FetchForms(),
                                                        ));
                                                    _passwordController.clear();
                                                  }
                                                },
                                                child: Container(
                                                  height: 60,
                                                  width: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width *
                                                      0.70,
                                                  decoration: BoxDecoration(
                                                      color: greyColor,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                                  child: Center(
                                                    child: OurText(
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      tittle:
                                                      "Show Consultation Forms",
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ));
                              },
                            );
                          },
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: greyColor,
                            ),
                            child: Center(
                                child: OurText(
                                  tittle: "Watch Consultation Forms",
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
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
