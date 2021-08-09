import 'package:expenses/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFontStyles {
  static final title = GoogleFonts.notoSans(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteModel,
  );
  static final description = GoogleFonts.openSans(
    fontSize: 19,
    fontWeight: FontWeight.w600,
    color: AppColors.secondary,
  );
  static final greyDescription = GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.greyDescription,
  );
  static final borderText = GoogleFonts.ptSerif(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteModel,
  );
  static final dialogChoices = GoogleFonts.ptSerif(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.greyDescription,
  );
}
