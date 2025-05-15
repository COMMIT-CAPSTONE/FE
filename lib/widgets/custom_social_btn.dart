import 'package:flutter/material.dart';

class CustomSocialBtn extends StatelessWidget {

  final String name;
  final Image logo;
  final Color backgroundColor;
  final Color fontColor;
  final VoidCallback onPressed;

  const CustomSocialBtn({
    super.key,
    required this.name,
    required this.logo,
    required this.backgroundColor,
    required this.fontColor,
    required this.onPressed
});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(backgroundColor),
        elevation: WidgetStatePropertyAll(0),
        side: WidgetStatePropertyAll(BorderSide(color: Colors.black12)),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 7))
      ),
      child: SizedBox(
        height: 50,
        width: 300,
        child: Row(
          children: [
            logo,
            SizedBox(width: 10,),
            Text(name, style: TextStyle(color: fontColor, fontFamily: "Pretendard", fontWeight: FontWeight.w700),)
          ],
        ),
      )
    );
  }
}
