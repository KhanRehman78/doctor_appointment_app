
import 'package:flutter/material.dart';

import '../common/images.dart';

Widget BackgroundWidegt(Context, Scaffold myScaffold) {
  return Container(
    height: MediaQuery.of(Context).size.height,
    width: MediaQuery.of(Context).size.width,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(backGroundImage), fit: BoxFit.cover)),
    child: myScaffold,
  );
}
