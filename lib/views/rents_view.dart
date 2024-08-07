import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/rent_state.dart';
import '../providers/theme.dart';

///Classe de vizualização dos aluguéis
class RentsView extends StatelessWidget {
  ///Construtor da tela de visualizar aluguéis
  const RentsView({super.key});

  @override
  Widget build(BuildContext context) {
    final stateTheme = Provider.of<ThemeState>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RentState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.registeredRents,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pushNamed(context, '/'),
          ),
          backgroundColor: const Color.fromARGB(255, 0, 29, 61),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: Consumer<RentState>(
            builder: (context, state, _) {
              return ListView.builder(
                itemCount: state.rents.length,
                itemBuilder: (context, index) {
                  final rent = state.rents[index];
                  return ListTile(
                    title: Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: stateTheme.themeLight
                          ? Colors.white
                          : const Color.fromARGB(82, 60, 68, 138),
                      shadowColor: Colors.blueGrey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 10.0),
                                    child: Text(
                                      rent.nameCustomer,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: stateTheme.themeLight
                                            ? const Color.fromRGBO(
                                                255, 195, 0, 1)
                                            : const Color.fromARGB(
                                                255, 255, 225, 127),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 1.0),
                                    child: Text(
                                      '${AppLocalizations.of(context)!.startDate}: ${DateFormat('yyyy-MM-dd').format(rent.startDate)}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 1.0),
                                    child: Text(
                                      '${AppLocalizations.of(context)!.finalDate}: ${DateFormat('yyyy-MM-dd').format(rent.finalDate)}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 1.0),
                                    child: Text(
                                      '${AppLocalizations.of(context)!.totalDays}: ${rent.totalDays.toString()}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 1.0),
                                    child: Text(
                                      '${AppLocalizations.of(context)!.plate}: ${rent.plateVehicle}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 1.0),
                                    child: Text(
                                      '${AppLocalizations.of(context)!.manager}: ${rent.nameManager}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 1.0),
                                    child: Text(
                                      '${AppLocalizations.of(context)!.commission}: R\$ ${rent.commissionManager.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 1.0),
                                    child: Text(
                                      '${AppLocalizations.of(context)!.totalPrice}: R\$ ${rent.rentPrice}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.delete),
                                color: const Color.fromARGB(255, 255, 0, 0),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return SizedBox(
                                        width: 300,
                                        height: 220,
                                        child: AlertDialog(
                                          title: Center(
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .deleteRent,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25.0,
                                              ),
                                            ),
                                          ),
                                          content: Text(
                                            AppLocalizations.of(context)!
                                                .confirmDeleteRent,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                AppLocalizations.of(context)!
                                                    .cancel,
                                                style: const TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                state.deleteRents(rent);
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                AppLocalizations.of(context)!
                                                    .confirm,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                          elevation: 25,
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
