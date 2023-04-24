import 'package:currency_app/pages/currency_page/bloc/currency_bloc.dart';
import 'package:currency_app/pages/currency_page/widgets/currency_chart.dart';
import 'package:currency_app/web_api/connections/currency_connection.dart';
import 'package:currency_app/web_api/dto/currency_dto.dart';
import 'package:currency_app/web_api/dto/rates.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class CurrencyPage extends StatelessWidget {
  final CurrencyConnection currencyConnection = GetIt.I<CurrencyConnection>();

  final String codeString;
  CurrencyPage({super.key, required this.codeString});
  final int valueOfDays = 30;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Details"),
            ),
            body: BlocProvider(
              create: ((context) =>
                  CurrencyBloc(currencyConnection, codeString, valueOfDays)
                    ..add(SendCurrencyEvent())),
              child: BlocBuilder<CurrencyBloc, CurrencyState>(
                builder: (context, state) {
                  if (state is CurrencySuccessState) {
                    return _buildSuccessBody(state.model, context);
                  } else if (state is CurrencyFailState) {
                    return Text(
                      "test",
                    );
                  } else {
                    return Text("test");
                  }
                },
              ),
            )));
  }

  Widget _buildSuccessBody(CurrencyDto model, BuildContext context) {
    final List<Rates> rates = model.rates!;
    final mediaQuery = MediaQuery.of(context).size;

    final styles = TextStyle(fontFamily: 'Roboto', color: Color(0xFF5E6972));

    return Column(
      children: [
        SizedBox(height: mediaQuery.height * 0.03),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Theme.of(context).cardColor,
          child: SizedBox(
              height: mediaQuery.height * 0.35,
              child: CurrencyChart(
                valueOfDays: valueOfDays,
                rates: rates,
              )),
        ),
        SizedBox(height: mediaQuery.height * 0.03),
        Expanded(
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
                        children: [
                          Text("DATE", style: styles),
                          Text("RATE", style: styles),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: ListView.separated(
                        reverse: true,
                        separatorBuilder: (context, index) => Divider(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: model.rates!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(rates[index].effectiveDate!,
                                    style: styles),
                                Text(rates[index].mid.toString(),
                                    style: styles),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )),
        ),
        SizedBox(height: mediaQuery.height * 0.03)
      ],
    );
  }
}
