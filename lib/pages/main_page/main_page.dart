import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:currency_app/custom_widgets/network_dialog.dart';
import 'package:currency_app/enums/code_enum.dart';
import 'package:currency_app/pages/main_page/bloc/main_bloc.dart';
import 'package:currency_app/pages/main_page/widgets/main_card_currency.dart';
import 'package:currency_app/pages/main_page/widgets/main_card_currency_shimmer.dart';
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
  StreamSubscription<ConnectivityResult>? subscription;
  MainBloc? mainBloc;

  final listOfCurrencies = [
    CodeEnum.eur,
    CodeEnum.usd,
  ];

  @override
  void initState() {
    subscription = Connectivity().onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        return;
      } else {
        showDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) => const NetworkDialog());
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    subscription!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Roboto',
                ),
                child: Row(
                  children: [
                    AnimatedTextKit(
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          "Choose your currency",
                          speed: const Duration(milliseconds: 120),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              BlocProvider(
                create: (context) => mainBloc = MainBloc(
                  currencyConnection,
                  listOfCurrencies,
                )..add(SendMainEvent()),
                child: BlocBuilder<MainBloc, MainState>(
                  bloc: mainBloc,
                  builder: (context, state) {
                    if (state is MainSuccessState) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.model.length,
                        itemBuilder: (context, index) {
                          final isEuro =
                              state.model[index].currency!.contains("eur");
                          return isEuro
                              ? MainCardCurrency(
                                  iconAsset:
                                      'assets/icons/europe_flag_circle.svg',
                                  title: state.model[index].code!,
                                  description: "Europeanian Union",
                                  currencyValue:
                                      "€${state.model[index].rates!.first.mid!.toStringAsFixed(2)}",
                                )
                              : MainCardCurrency(
                                  iconAsset: 'assets/icons/usa_flag_circle.svg',
                                  title: state.model[index].code!,
                                  description: "United States of America",
                                  currencyValue:
                                      "\$${state.model[index].rates!.first.mid!.toStringAsFixed(2)}",
                                );
                        },
                      );
                    } else if (state is MainFailState) {
                      return Column(
                        children: [
                          const MainCardCurrencyShimmer(),
                          const MainCardCurrencyShimmer(),
                          ElevatedButton(
                            onPressed: () {
                              mainBloc!.add(SendMainEvent());
                            },
                            child: const Text("Refresh"),
                          )
                        ],
                      );
                    } else {
                      return Column(
                        children: const [
                          MainCardCurrencyShimmer(),
                          MainCardCurrencyShimmer(),
                        ],
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
