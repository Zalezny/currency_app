import 'package:currency_app/custom_widgets/top_row.dart';
import 'package:currency_app/utils/currency_code.dart';
import 'package:currency_app/pages/currency_page/bloc/currency_bloc.dart';
import 'package:currency_app/pages/currency_page/widgets/currency_chart.dart';
import 'package:currency_app/pages/currency_page/widgets/currency_table.dart';
import 'package:currency_app/web_api/connections/currency_connection.dart';
import 'package:currency_app/web_api/dto/currency_dto.dart';
import 'package:currency_app/web_api/dto/rates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CurrencyPage extends StatelessWidget {
  final CurrencyConnection currencyConnection = GetIt.I<CurrencyConnection>();

  final CurrencyCode code;
  CurrencyPage({super.key, required this.code});
  final int valueOfDays = 30;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: BlocProvider(
      create: ((context) => CurrencyBloc(currencyConnection, code, valueOfDays)
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
    final List<Rates>? rates = model?.rates;
    final mediaQuery = MediaQuery.of(context).size;

    return Column(
      children: [
        TopRow(text: "Details ${code.currencyCode}"),
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
                defaultMaxY: code.isEuro ? 4.75 : 4.45,
                defaultMinY: code.isEuro ? 4.45 : 4.20,
              )),
        ),
        SizedBox(height: mediaQuery.height * 0.03),
        CurrencyTable(rates: rates),
        SizedBox(height: mediaQuery.height * 0.03)
      ],
    );
  }
}
