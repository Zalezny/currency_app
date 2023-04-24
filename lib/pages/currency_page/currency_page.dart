import 'package:currency_app/pages/currency_page/bloc/currency_bloc.dart';
import 'package:currency_app/pages/currency_page/widgets/currency_chart.dart';
import 'package:currency_app/pages/currency_page/widgets/currency_table.dart';
import 'package:currency_app/web_api/connections/currency_connection.dart';
import 'package:currency_app/web_api/dto/currency_dto.dart';
import 'package:currency_app/web_api/dto/rates.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

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
                    return _buildBody(state.model, context);
                  } else if (state is CurrencyFailState) {
                    return _buildBody(null, context);
                  } else {
                    return _buildBody(null, context);
                  }
                },
              ),
            )));
  }

  Widget _buildBody(CurrencyDto? model, BuildContext context) {
    final isEuro = codeString.contains("EU");
    final List<Rates>? rates = model?.rates;
    final mediaQuery = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: mediaQuery.height * 0.03,
        ),
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
                defaultMaxY: isEuro ? 4.75 : 4.45,
                defaultMinY: isEuro ? 4.45 : 4.20,
              )),
        ),
        SizedBox(
          height: mediaQuery.height * 0.03,
        ),
        CurrencyTable(rates: rates),
        SizedBox(
          height: mediaQuery.height * 0.03,
        )
      ],
    );
  }
}
