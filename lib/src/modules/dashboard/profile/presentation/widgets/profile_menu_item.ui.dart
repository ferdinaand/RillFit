import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/domain/services/themes.services.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class ProfileTileUi extends StatelessWidget {
  const ProfileTileUi({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.tag,
    this.menuIconColor,
  });

  final String icon;
  final String title;
  final VoidCallback? onTap;
  final Widget? tag;
  final Color? menuIconColor;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap ?? () {},
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 20,
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Row(
            children: [
              // Obx(
              // () =>
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    color: menuIconColor,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: SvgPicture.asset(
                    icon,
                    color: white,
                    width: 14,
                    height: 14,
                  ),
                ),
              ),
              // ),
              const SizedBox(width: 20),
              TextUi.bodyMed(
                title,
                height: 1.1,
                fontWeight: mediumText,
              ),
              const Spacer(),
              if (tag != null) ...[
                tag!,
              ],
              Obx(
                () => Icon(
                  Icons.arrow_forward_ios,
                  color: Get.find<ThemeService>().isDarkMode
                      ? grayScale100
                      : grayScale900,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
