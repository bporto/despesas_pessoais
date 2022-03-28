import 'package:despesas_pessoais/components/adaptative_button.dart';
import 'package:despesas_pessoais/components/adaptative_data_picker.dart';
import 'package:despesas_pessoais/components/adaptative_text_field.dart';
import 'package:despesas_pessoais/resources/strings.dart';


import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  const TransactionForm(this.onSubmit, {Key? key}) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate);
  }



  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
              top: 10.0,
              right: 10,
              left: 10,
              bottom: 20 + mediaQuery.viewInsets.bottom),
          child: Column(
            children: [
              AdaptativeTextField(
                  textController: _titleController,
                  onSubmit: _submitForm,
                  lable: Strings.TITLE,
                  keyboardType: TextInputType.text),
              AdaptativeTextField(
                  textController: _valueController,
                  onSubmit: _submitForm,
                  lable: Strings.VALUE,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true)),
              ///AQUI
              AdaptativeDatePicker(
                  selectedDate: _selectedDate,
                  onDateChanged: (newDate){
                    setState(() {
                      _selectedDate = newDate;
                    });
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptativeButton(
                    lable: Strings.NEW_TRANSACTION,
                    onPressed: _submitForm,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
