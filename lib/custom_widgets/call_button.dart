import 'package:doctor_app/common/libraries.dart';


class CallButton extends StatefulWidget {
  final void Function()? onTap;

  const CallButton({super.key, this.onTap});

  @override
  State<CallButton> createState() => _CallButtonState();
}

class _CallButtonState extends State<CallButton> {
  Future<void> _makePhoneCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() async {
         await _makePhoneCall('+52 619 484-3879');

      },
      child: Container(
        height: 74,
        width: 74,
        decoration: const BoxDecoration(
          color: greyColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Image.asset(
            phoneIcon,
            width: 35,
            height: 35,
          ),
        ),
      ),
    );
  }
}
