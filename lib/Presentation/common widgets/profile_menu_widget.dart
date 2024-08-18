import 'package:flutter/material.dart';
import 'package:wellnest/Presentation/constants/constants.dart';


class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final size1 = MediaQuery.of(context).size.width;
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: size1 * 0.098,
        height: size1 * 0.098,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size1 * 0.05),
          color: maincolor,
        ),
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(title,
          style:
              Theme.of(context).textTheme.bodyLarge?.apply(color: textColor)),
      trailing: endIcon
          ? Container(
              width: size1 * 0.087,
              height: size1 * 0.087,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size1 * 0.05),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(Icons.arrow_forward_ios,
                  size: 18.0, color: Color.fromARGB(255, 81, 81, 81)))
          : null,
    );
  }
}
