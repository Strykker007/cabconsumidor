import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  final List<T> dropdownOptions;
  final Store store;
  final bool isLoading;
  // final T? selectedOption;
  final String Function(T item) displayItemName;
  final void Function(T? selectedValue)? onChanged;
  final void Function(T? selectedValue)? onTap;
  final String label;
  final Function() clearText;
  final String Function(String?)? validator;
  final Widget emptyWidget;
  final String? selectValueText;

  const CustomDropdownButton({
    super.key,
    required this.dropdownOptions,
    required this.store,
    required this.isLoading,
    // required this.selectedOption,
    required this.displayItemName,
    this.onChanged,
    required this.onTap,
    required this.label,
    required this.clearText,
    this.validator,
    this.selectValueText,
    this.emptyWidget = const Text('Nenhum dado encontrado'),
  });

  @override
  Widget build(BuildContext context) {
    // if (isLoading) {
    //   return TextFormFieldWidget(
    //     isEnabled: false,
    //     showCursor: false,
    //     label: 'UF',
    //     labelStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
    //           color: Theme.of(context).primaryColor,
    //           fontWeight: FontWeight.bold,
    //           fontSize: 12,
    //         ),
    //     suffixIcon: Icon(
    //       Icons.arrow_drop_down,
    //       color: Theme.of(context).primaryColor,
    //     ),
    //     style: Theme.of(context).textTheme.displayLarge!.copyWith(
    //           color: Theme.of(context).primaryColor,
    //           fontWeight: FontWeight.bold,
    //           fontSize: 12,
    //         ),
    //     controller: TextEditingController(
    //       text: "Carregando informações...",
    //     ),
    //   );
    // }
    return _buildDropdownTextField(context);
  }

  Widget _buildDropdownTextField(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _showDropdown(context);
      },
      child: selectValueText!.isEmpty
          ? Row(
              children: [
                const Icon(
                  Icons.location_city_rounded,
                  size: 16,
                ),
                const SizedBox(width: 5),
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.background,
                      ),
                ),
              ],
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$selectValueText',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.background,
                      ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: clearText,
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
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.background,
                          ),
                    ),
                  ),
                )
              ],
            ),
    );
  }

  void _showDropdown(BuildContext context) {
    showModalBottomSheet<T>(
      context: context,
      // position: position,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      builder: (context) {
        return TripleBuilder(
          store: store,
          builder: (context, triple) {
            if (store.isLoading) {
              return const SizedBox(
                height: 150,
                child: CircularProgressIndicator.adaptive(),
              );
            }
            // if (store.state.isEmpty) {
            //   return Container();
            // }
            return ListView.separated(
              shrinkWrap: true,
              itemCount: store.state.length,
              separatorBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Divider(
                    color: Colors.grey.withOpacity(0.7),
                  ),
                );
              },
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    onTap!.call(store.state[index]);
                  },
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 18,
                  ),
                  title: Text(
                    displayItemName(store.state[index]),
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                  ),
                );
              },
            );
          },
        );
      },
    ).then((T? newValue) {
      if (newValue != null) {
        onChanged?.call(newValue);
      }
    });
  }
}
