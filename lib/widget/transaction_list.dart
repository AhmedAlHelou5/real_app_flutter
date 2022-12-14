import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:real_app_flutter/widget/transaction_item.dart';

import '../model/Transaction.dart';

class TransactionList extends StatelessWidget {
   final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return
      transactions.isEmpty
          ? LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            Text(
              'No Transaction added yet !',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline6,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                height: constraints.maxHeight * 0.6,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                )),
          ],
        );
      })
          : ListView(
        children: transactions
        .map((tx) => TransactionItem(
      transaction: tx  ,
      deleteTx: deleteTx,
      key: ValueKey(tx.id),
    ))
    .toList());
  }

}

