import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:riilfit/src/presentation/resources/res.dart';
import 'package:riilfit/src/presentation/widgets.dart';

class NetworkLoaderUi extends StatelessWidget {
  const NetworkLoaderUi({super.key, required this.message});
  final String message;

  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop, //Disable back button when loader is up
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SpinKitRipple(
              color: successDark,
              size: 40,
            ),
            const Gap(
              10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextUi(
                message,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
