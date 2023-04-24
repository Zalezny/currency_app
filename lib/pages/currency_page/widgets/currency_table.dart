import 'package:currency_app/pages/currency_page/widgets/currency_table_item.dart';
import 'package:currency_app/pages/currency_page/widgets/currency_table_item_shimmers.dart';
import 'package:currency_app/web_api/dto/rates.dart';
import 'package:flutter/material.dart';

class CurrencyTable extends StatelessWidget {
  final List<Rates>? rates;
  const CurrencyTable({super.key, required this.rates});
  final int valueOfShimmers = 8;

  @override
  Widget build(BuildContext context) {
    final reversedRates = rates?.reversed.toList() ?? null;
    const styles = TextStyle(
      fontFamily: 'Roboto',
      color: Color(0xFF5E6972),
    );
    return Expanded(
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Theme.of(context).cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8.0,
                    right: 8.0,
                    left: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("DATE", style: styles),
                      Text("RATE", style: styles),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: reversedRates?.length ?? valueOfShimmers,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: rates != null
                              ? CurrencyTableItem(rate: reversedRates![index])
                              : const CurrencyTableItemShimmers());
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
