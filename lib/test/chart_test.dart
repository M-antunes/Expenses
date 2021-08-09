import 'package:expenses/models/transaction.dart';
import 'package:expenses/test/chat_bar_test.dart';
import 'package:expenses/themes/app_colors.dart';
import 'package:expenses/themes/app_font_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartTest extends StatelessWidget {
  final List<Transaction> recentTransaction;

  ChartTest(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(30, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        bool sameDay = recentTransaction[i].date.day == weekDay.day;
        bool sameMonth = recentTransaction[i].date.month == weekDay.month;
        bool sameYear = recentTransaction[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransaction[i].value;
        }
      }

      return {
        'date': DateFormat('dd/MM/y').format(weekDay),
        'day': DateFormat.E().format(weekDay),
        'value': totalSum,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, tr) {
      return sum + (tr['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Último Mês.',
          style: AppFontStyles.title,
        ),
        iconTheme: IconThemeData(color: AppColors.whiteModel),
      ),
      body: Card(
        elevation: 8,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: groupedTransactions.map((tr) {
              return ChartBarTest(
                label: '${tr['day'].toString()} - (${tr['date'].toString()})',
                value: tr['value'] as double,
                percentage: _weekTotalValue == 0
                    ? 0
                    : (tr['value'] as double) / _weekTotalValue,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
