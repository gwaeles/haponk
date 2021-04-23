import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/tabs_page.dart';

class PagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: PagesPage(),
      ),
    );
  }
}
