import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haponk/features/devices/providers/devices_provider.dart';
import 'package:provider/provider.dart';

class DevicesAppBar extends StatelessWidget {
  const DevicesAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: TextField(
        decoration: InputDecoration(
          hintText: "Find",
          filled: true,
          fillColor: Colors.blue,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(width: 0, color: Colors.blue)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(width: 0, color: Colors.blue)
          ),
          hintStyle: TextStyle(color: Colors.white60),
          isDense: true,
          contentPadding:
              EdgeInsets.only(left: 20, top: 11, right: 8, bottom: 11),
          suffixIconConstraints: BoxConstraints(maxHeight: 28, maxWidth: 44),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset(
              'assets/images/search.svg',
              color: Colors.white60,
            ),
          ),
        ),
        style: TextStyle(
          color: Colors.white,
        ),
        cursorColor: Colors.white60,
        onChanged: (value) => context.read<DevicesProvider>().search(value),
      ),
      floating: true,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
    );
  }
}
