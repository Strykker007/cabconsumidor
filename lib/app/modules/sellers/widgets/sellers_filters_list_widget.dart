import 'package:cabconsumidor/app/core/services/helpers.dart';
import 'package:cabconsumidor/app/core/shared/widgets/button/bottom_button_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/error/request_error_widget.dart';
import 'package:cabconsumidor/app/modules/sellers/stores/sellers_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class SellersFiltersListWidget extends StatefulWidget {
  const SellersFiltersListWidget({super.key});

  @override
  State<SellersFiltersListWidget> createState() =>
      _SellersFiltersListWidgetState();
}

class _SellersFiltersListWidgetState extends State<SellersFiltersListWidget> {
  final SellersStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          TripleBuilder(
            store: store.paramsStore,
            builder: (context, triple) {
              return ElevatedButton(
                onPressed: () {
                  _showDistanceSelector(context).then(
                    (value) async {
                      await store.getSellersList().catchError(
                        (onError) {
                          Helpers.showDefaultDialog(
                            context,
                            RequestErrorWidget(
                              error: onError,
                              buttonText: 'Fechar',
                              onPressed: () {
                                Modular.to.pop();
                              },
                            ),
                          );
                        },
                      );
                    },
                  );
                },
                child: store.paramsStore.state.distance! <= 0.0
                    ? Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 16,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Distância",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 14,
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${store.paramsStore.state.distance!.toStringAsFixed(0)} Km',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 14,
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: _clearDistance,
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Theme.of(context)
                                    .colorScheme
                                    .background
                                    .withOpacity(0.4),
                              ),
                              child: Text(
                                'Limpar',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 12,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                    ),
                              ),
                            ),
                          )
                        ],
                      ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _clearDistance() async {
    store.paramsStore.state.distance = 0.0;
    store.paramsStore.updateState(store.paramsStore.state);
    await store.getSellersList().catchError(
      (onError) {
        Helpers.showDefaultDialog(
          context,
          RequestErrorWidget(
            error: onError,
            buttonText: 'Fechar',
            onPressed: () {
              Modular.to.pop();
            },
          ),
        );
      },
    );
  }

  Future<void> _showDistanceSelector(BuildContext context) async {
    await showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      context: context,
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TripleBuilder(
                store: store.paramsStore,
                builder: (context, triple) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Distância",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            '${store.paramsStore.state.distance!.toStringAsFixed(0)} Km',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      const Divider(),
                      Slider(
                        value: store.paramsStore.state.distance ?? 0.0,
                        min: 0,
                        divisions: 50,
                        max: 50,
                        allowedInteraction: SliderInteraction.tapAndSlide,
                        thumbColor: Theme.of(context).primaryColor,
                        secondaryActiveColor: Colors.white,
                        overlayColor:
                            const MaterialStatePropertyAll(Colors.white),
                        label: store.paramsStore.state.distance!
                            .toStringAsFixed(0),
                        activeColor: Theme.of(context).primaryColor,
                        onChanged: (newValue) {
                          store.paramsStore.state.distance = newValue;
                          store.paramsStore
                              .updateState(store.paramsStore.state);
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
            BottomButtonWidget(
              onPressed: () async {
                Modular.to.pop();
              },
              text: 'Aplicar',
            ),
          ],
        );
      },
    );
  }
}
