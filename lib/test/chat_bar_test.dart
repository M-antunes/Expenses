import 'package:expenses/themes/app_colors.dart';
import 'package:expenses/themes/app_font_styles.dart';
import 'package:flutter/material.dart';

class ChartBarTest extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  const ChartBarTest({
    required this.label,
    required this.value,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 35,
        width: 70,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary as Color)),
        child: Padding(
          padding: EdgeInsets.all(2),
          child: FittedBox(child: Text('${value.toStringAsFixed(2)}')),
        ),
      ),
      subtitle: Text(
        label,
        style: AppFontStyles.description,
      ),
      title: Container(
        height: 10,
        width: 100,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                color: Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            FractionallySizedBox(
              widthFactor: percentage,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            )
          ],
        ),
      ),
    );

    //
    //
    //
    //
    //
    //
    //
    //
    // Row(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   children: [
    //     Container(
    //         height: 30,
    //         decoration: BoxDecoration(
    //             border: Border.all(color: AppColors.primary as Color)),
    //         child: Padding(
    //           padding: EdgeInsets.all(2),
    //           child: FittedBox(child: Text('${value.toStringAsFixed(2)}')),
    //         )),
    //     SizedBox(width: 5),
    //     Container(
    //       height: 10,
    //       width: 150,
    //       child: Stack(
    //         alignment: Alignment.bottomCenter,
    //         children: [
    //           Container(
    //             decoration: BoxDecoration(
    //               border: Border.all(
    //                 color: Colors.grey,
    //                 width: 1.0,
    //               ),
    //               color: Color.fromRGBO(220, 220, 220, 1),
    //               borderRadius: BorderRadius.circular(3),
    //             ),
    //           ),
    //           FractionallySizedBox(
    //             widthFactor: percentage,
    //             child: Container(
    //               decoration: BoxDecoration(
    //                 color: AppColors.primary,
    //                 borderRadius: BorderRadius.circular(3),
    //               ),
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //     SizedBox(width: 5),
    //     Text(label),
    //   ],
    // );
  }
}
