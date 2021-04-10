import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haponk/features/devices/providers/devices_provider.dart';
import 'package:provider/provider.dart';

class DevicesAppBar extends StatelessWidget {
  const DevicesAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      title: TextField(
        decoration: InputDecoration(
          hintText: "Find",
          filled: true,
          fillColor: Color(0xFF192A59),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(width: 0, color: Color(0xFF192A59))
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(width: 0, color: Color(0xFF192A59))
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(width: 0, color: Color(0xFF192A59))
          ),
          hintStyle: TextStyle(color: Color(0xFFBACAFF)),
          isDense: true,
          contentPadding:
              EdgeInsets.only(left: 20, top: 11, right: 8, bottom: 11),
          suffixIconConstraints: BoxConstraints(maxHeight: 28, maxWidth: 44),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset(
              'assets/images/search.svg',
              color: Color(0xFFBACAFF),
            ),
          ),
        ),
        style: TextStyle(
          color: Colors.white,
        ),
        cursorColor: Color(0xFFBACAFF),
        onChanged: (value) => context.read<DevicesProvider>().search(value),
      ),
      floating: true,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
    );
  }
}
