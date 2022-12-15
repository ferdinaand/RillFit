import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class VersionNumberCardUi extends StatefulWidget {
  const VersionNumberCardUi({
    super.key,
  });

  @override
  State<VersionNumberCardUi> createState() => _VersionNumberCardUiState();
}

class _VersionNumberCardUiState extends State<VersionNumberCardUi> {
  String version = '';

  @override
  void initState() {
    super.initState();
    fetchAppVersion();
  }

  Future<void> fetchAppVersion() async {
    try {
      //get local version from here
      final packageInfo = await PackageInfo.fromPlatform();
      log(packageInfo.version);

      //Assign it to the version
      setState(() {
        version = packageInfo.version;
      });

      return;
    } catch (e, s) {
      log(
        e.toString(),
        stackTrace: s,
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      margin: const EdgeInsets.only(
        right: 8,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
        color: grayScale400,
      ),
      child: TextUi.bodyXSmall(
        'V $version',
        fontWeight: semiBoldText,
        color: Colors.white,
        height: 1.3,
      ),
    );
  }
}
