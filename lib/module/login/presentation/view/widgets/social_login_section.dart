import 'package:flutter/material.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Divider(color: Color(0xFFD9D9D9)),
        ),

        SocialLoginButton(
          text: StringConsts.conWithApple,
          icon: const Icon(Icons.apple, size: 30),
          onTap: () => print("Apple login tapped"),
        ),
        const SizedBox(height: 10),
        SocialLoginButton(
          text: StringConsts.conWithGoogle,
          icon: const Icon(Icons.apple, size: 30),
          onTap: () => print("Google login tapped"),
        ),
      ],
    );
  }

  SocialLoginButton({
    required String text,
    required Icon icon,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFD9D9D9), width: 3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Padding(padding: const EdgeInsets.only(left: 8.0), child: icon),
            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff727272),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
