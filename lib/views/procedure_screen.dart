import 'package:doctor_app/common/libraries.dart';

import 'consultant_form.dart';

class ProcedureScreen extends StatefulWidget {
  String? image;
  String? tittle;
  String? details;

  ProcedureScreen({super.key, this.tittle, this.image, this.details});

  @override
  State<ProcedureScreen> createState() => _ProcedureScreenState();
}

class _ProcedureScreenState extends State<ProcedureScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidegt(
        context,
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.image.toString()),
                                fit: BoxFit.fill)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Back Button
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
                                      shape: BoxShape.circle),
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
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            OurText(
                              size: 28,
                              fontWeight: FontWeight.w600,
                              tittle: widget.tittle.toString(),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            OurText(tittle: widget.details.toString()),
                            const SizedBox(
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CallButton(),
                          ConsultantFormButton(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ConsultantForm(),
                                  ));
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
