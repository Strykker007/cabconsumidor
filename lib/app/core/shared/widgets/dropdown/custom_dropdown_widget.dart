import 'package:cabconsumidor/app/core/shared/widgets/text_field/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class CustomDropdownTextField<T> extends StatelessWidget {
  final List<T> dropdownOptions;
  final bool isLoading;
  final T? selectedOption;
  final String Function(T item) displayItemName;
  final void Function(T? selectedValue)? onChanged;
  final String label;
  final String Function(String?)? validator;
  final Widget emptyWidget;
  final String? selectValueText;

  const CustomDropdownTextField({
    super.key,
    required this.dropdownOptions,
    required this.isLoading,
    required this.selectedOption,
    required this.displayItemName,
    required this.onChanged,
    required this.label,
    this.validator,
    this.selectValueText,
    this.emptyWidget = const Text('Nenhum dado encontrado'),
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return TextFormFieldWidget(
        isEnabled: false,
        showCursor: false,
        label: 'UF',
        labelStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
        suffixIcon: Icon(
          Icons.arrow_drop_down,
          color: Theme.of(context).primaryColor,
        ),
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
        controller: TextEditingController(
          text: "Buscando informações...",
        ),
      );
    }
    return _buildDropdownTextField(context);
  }

  Widget _buildDropdownTextField(BuildContext context) {
    return TextFormFieldWidget(
      readOnly: true,
      onTap: () {
        _showDropdown(context);
      },
      showCursor: false,
      label: label,
      labelStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
      suffixIcon: Icon(
        Icons.arrow_drop_down,
        color: Theme.of(context).primaryColor,
      ),
      cursorColor: Colors.transparent,
      style: Theme.of(context).textTheme.displayLarge!.copyWith(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
      validator: validator,
      controller: TextEditingController(
        text: selectedOption != null
            ? displayItemName(selectedOption as T)
            : selectValueText ?? "Selecione um Estado",
      ),
    );
  }

  void _showDropdown(BuildContext context) {
    final button = context.findRenderObject() as RenderBox;
    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero),
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    showMenu<T>(
      context: context,
      position: position,
      shape: Border.all(),
      items: dropdownOptions.map((T item) {
        return PopupMenuItem<T>(
          value: item,
          child: Text(
            displayItemName(item),
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
          ),
        );
      }).toList(),
    ).then((T? newValue) {
      if (newValue != null) {
        onChanged?.call(newValue);
      }
    });
  }
}
