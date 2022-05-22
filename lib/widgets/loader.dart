import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? const Center(child: CircularProgressIndicator(color: Colors.indigo, strokeWidth: 4,))
        : const Center(child: CupertinoActivityIndicator(radius: 24, animating: true));
  }
}
