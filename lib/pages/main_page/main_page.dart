import 'package:currency_app/enums/code_enum.dart';
import 'package:currency_app/pages/main_page/bloc/main_bloc.dart';
import 'package:currency_app/pages/main_page/widgets/main_card_currency.dart';
import 'package:currency_app/web_api/connections/currency_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainPage> {
  final CurrencyConnection currencyConnection = GetIt.I<CurrencyConnection>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Choose your value"),
            MainCardCurrency(currrencyCode: CodeEnum.eur),
            // BlocProvider(
            //   create: (context) => MainBloc(
            //     currencyConnection,
            //     CodeEnum.eur,
            //   )..add(SendMainEvent()),
            //   child: BlocBuilder<MainBloc, MainState>(
            //     builder: (context, state) {
            //       if(state is MainSuccessState) {
            //         return ListView.builder(itemBuilder: itemBuilder)
            //       }
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
