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
                    return Text("test");
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
        Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Theme.of(context).cardColor,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("date:"), Text("rate:")],
                ),
              ],
            )),
      ],
    );
  }
}
