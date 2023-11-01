import 'package:flutter/material.dart';

import '../models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(height: 4,),
            Row(children: [
              Text('\$ ${expense.amount.toString()}'),
              const Spacer(),
              Row(children: [
                Icon(categoryIcons[expense.category]),
                Text(expense.formattedDate),
              ],)

            ],)
          ],
        ),
      ),
    );
  }
}
