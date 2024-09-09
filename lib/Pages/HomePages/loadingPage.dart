import 'package:flutter/material.dart';

import '../../GlobalVariables/globalVariables.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(
          color: GlobalVariables.buttonColor,
        ),
      ),
    );
  }
}
