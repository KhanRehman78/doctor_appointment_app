import 'package:doctor_app/common/libraries.dart';

class FloatingButton extends StatefulWidget {
  final void Function()? onTap;

  FloatingButton({
    this.onTap,
    super.key,
  });

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: PhysicalModel(
        shape: BoxShape.circle,
        color: Colors.white,
        shadowColor: Colors.grey.shade200,
        elevation: 5,
        child: Container(
          height: 64,
          width: 64,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Icon(
              Icons.arrow_forward_outlined,
              color: floatingIconColor,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }
}
