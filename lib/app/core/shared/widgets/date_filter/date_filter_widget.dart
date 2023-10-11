import 'dart:developer';

import 'package:cabconsumidor/app/core/stores/user_store.dart';
import 'package:cabconsumidor/app/core/utils/formaters.dart';
import 'package:cabconsumidor/app/core/stores/transactions_date_filter_store.dart';
import 'package:cabconsumidor/app/modules/transactions/stores/transactions_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../button/bottom_button_widget.dart';
import '../text_field/text_form_field_widget.dart';
import '../../../utils/masks.dart';

class DateFilterWidget extends StatefulWidget {
  final Function onUpdateFunction;
  final DateFilterStore store;
  final dynamic controllerStore;
  const DateFilterWidget({
    super.key,
    required this.store,
    required this.controllerStore,
    required this.onUpdateFunction,
  });

  @override
  State<DateFilterWidget> createState() => _DateFilterWidgetState();
}

class _DateFilterWidgetState extends State<DateFilterWidget> {
  // final widget.controllerStore widget.controllerStore = Modular.get();
  final UserStore userStore = Modular.get();

  final TextEditingController initialDateController = TextEditingController();
  final TextEditingController finalDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            GestureDetector(
              onTap: () async {
                widget.store.updateFilter(30);
                widget.controllerStore.params.finalDate =
                    Formaters.dateToStringDateWithHifen(DateTime.now());
                widget.controllerStore.params.initialDate =
                    Formaters.dateToStringDateWithHifen(
                  DateTime.now().subtract(
                    Duration(
                      days: widget.store.state,
                    ),
                  ),
                );
                await widget.onUpdateFunction.call();
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: widget.store.state == 30
                        ? theme.primaryColor
                        : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '30 Dias',
                  style: theme.textTheme.labelMedium!.copyWith(
                    color: widget.store.state == 30
                        ? theme.primaryColor
                        : Colors.grey,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                widget.store.updateFilter(60);
                widget.controllerStore.params.finalDate =
                    Formaters.dateToStringDateWithHifen(DateTime.now());
                widget.controllerStore.params.initialDate =
                    Formaters.dateToStringDateWithHifen(
                  DateTime.now().subtract(
                    Duration(
                      days: widget.store.state,
                    ),
                  ),
                );
                await widget.onUpdateFunction.call();
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: widget.store.state == 60
                        ? theme.primaryColor
                        : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '60 Dias',
                  style: theme.textTheme.labelMedium!.copyWith(
                    color: widget.store.state == 60
                        ? theme.primaryColor
                        : Colors.grey,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                widget.store.updateFilter(90);
                widget.controllerStore.params.finalDate =
                    Formaters.dateToStringDateWithHifen(DateTime.now());
                widget.controllerStore.params.initialDate =
                    Formaters.dateToStringDateWithHifen(
                  DateTime.now().subtract(
                    Duration(
                      days: widget.store.state,
                    ),
                  ),
                );
                await widget.onUpdateFunction.call();
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: widget.store.state == 90
                        ? theme.primaryColor
                        : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '90 Dias',
                  style: theme.textTheme.labelMedium!.copyWith(
                    color: widget.store.state == 90
                        ? theme.primaryColor
                        : Colors.grey,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                _showDateSelector(context);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: widget.store.state == 0
                        ? theme.primaryColor
                        : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  widget.store.state == 0
                      ? 'De ${widget.controllerStore.params.initialDate} a ${widget.controllerStore.params.finalDate}'
                      : 'Selecionar Período',
                  style: theme.textTheme.labelMedium!.copyWith(
                    color: widget.store.state == 0
                        ? theme.primaryColor
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showDateSelector(BuildContext context) async {
    await showModalBottomSheet(
      isScrollControlled: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TripleBuilder(
                  store: widget.store,
                  builder: (context, triple) {
                    return Column(
                      children: [
                        Text(
                          'SELECIONE UM PERÍODO',
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                        ),
                        Divider(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        TextFormFieldWidget(
                          label: 'DATA INICIAL',
                          onChange: (initialhDate) {
                            if (initialhDate!.length > 9) {
                              widget.controllerStore.params.initialDate =
                                  Formaters.stringDateToStringDateWithHifen(
                                initialhDate,
                              );
                            }
                            // widget.store.updateForm(widget.store.state);
                          },
                          suffixIcon: Icon(
                            Icons.calendar_month_rounded,
                            color: Theme.of(context).primaryColor,
                          ),
                          inputFormatters: [
                            Masks.generateMask('##/##/####'),
                          ],
                          keyboardType: TextInputType.number,
                          labelStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.grey.shade400,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                  ),
                          hintText: 'Digite uma data',
                          controller: initialDateController,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.grey.shade400,
                                    fontSize: 17,
                                  ),
                        ),
                        TextFormFieldWidget(
                          label: 'DATA FINAL',
                          onChange: (finalDate) {
                            if (finalDate!.length > 9) {
                              widget.controllerStore.params.finalDate =
                                  Formaters.stringDateToStringDateWithHifen(
                                finalDate,
                              );
                            }
                            // widget.store.updateForm(widget.store.state);
                          },
                          suffixIcon: Icon(
                            Icons.calendar_month_rounded,
                            color: Theme.of(context).primaryColor,
                          ),
                          inputFormatters: [
                            Masks.generateMask('##/##/####'),
                          ],
                          keyboardType: TextInputType.number,
                          labelStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.grey.shade400,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                  ),
                          hintText: 'Digite uma data',
                          controller: finalDateController,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.grey.shade400,
                                    fontSize: 17,
                                  ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              TripleBuilder(
                store: widget.store,
                builder: (context, triple) {
                  return BottomButtonWidget(
                    onPressed: () async {
                      if (Formaters.stringToDate(
                                  Formaters.stringDateToStringDateWithHifen(
                                      finalDateController.text))
                              .difference(Formaters.stringToDate(
                                  Formaters.stringDateToStringDateWithHifen(
                                      initialDateController.text)))
                              .inMilliseconds >
                          0) {
                        await widget.onUpdateFunction.call();

                        widget.store.updateFilter(0);
                        finalDateController.text = '';
                        finalDateController.clear();
                        initialDateController.text = '';
                        initialDateController.clear();

                        Modular.to.pop();
                      } else {
                        Modular.to.pop();
                        finalDateController.text = '';
                        finalDateController.clear();
                        initialDateController.text = '';
                        initialDateController.clear();

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            duration: const Duration(seconds: 2),
                            content: Text(
                              'A data inicial não pode ser maior que a data final escolhida!',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        );
                      }
                    },
                    text: 'Aplicar',
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
