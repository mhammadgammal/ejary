import 'dart:io';

import 'package:ejary/core/assets/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PropertyPicture extends StatelessWidget {
  const PropertyPicture({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 232.w,
      height: 170.h,
      decoration:
          imagePath.isNotEmpty
              ? BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: FileImage(File(imagePath)),
                  fit: BoxFit.cover,
                ),
              )
              : null,
      child:
          imagePath.isEmpty
              ? Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: SvgPicture.asset(
                    AppIcons.picture,
                    width: 48.0.w,
                    height: 48.0.h,
                  ),
                ),
              )
              : null,
    );
  }
}
