import 'package:expenses/models/transaction.dart';
import 'package:expenses/themes/app_colors.dart';
import 'package:expenses/themes/app_font_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Column(
              children: [
                SizedBox(height: 15),
                Text(
                  'Lista Vazia',
                  style: AppFontStyles.description,
                ),
                SizedBox(height: 20),
                Container(
                    height: 200,
                    child: Image.asset(
                      'lib/assets/images/cat.png',
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];
                return Card(
                  elevation: 6,
                  margin: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 10,
                  ),
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        child: Text(
                          'R\$${tr.value.toStringAsFixed(2)}',
                          style: AppFontStyles.borderText,
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: AppFontStyles.description,
                    ),
                    subtitle: Text(
                      DateFormat('d MMM y').format(tr.date),
                      style: AppFontStyles.greyDescription,
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.close),
                      color: AppColors.delete,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text('Tem certeza?'),
                            actions: [
                              TextButton(
                                child: Text(
                                  'Sim',
                                  style: AppFontStyles.dialogChoices,
                                ),
                                onPressed: () {
                                  onRemove(tr.id);
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text(
                                  "Não",
                                  style: AppFontStyles.dialogChoices,
                                ),
                                onPressed: () {
                                  return Navigator.of(context).pop();
                                },
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
    );
  }
}
