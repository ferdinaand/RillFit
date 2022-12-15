import 'package:flutter/material.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class HomeHeaderUi extends StatelessWidget {
  const HomeHeaderUi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                TextUi.bodyLarge(
                  'Hi ',
                ),
                TextUi.bodyLarge(
                  'Ayoleyi 👋🏾',
                ),
              ],
            ),
            const TextUi.bodySmall(
              'Good morning, How are you...',
            ),
          ],
        ),
        const Spacer(),
        ProfileAvatar(
          onTap: () {},
        ),
      ],
    );
  }
}
