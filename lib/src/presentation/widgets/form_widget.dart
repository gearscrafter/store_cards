import 'package:flutter/material.dart';

import '../../core/utils/form_colors.dart';
import '../../domain/entities/card_entity.dart';

class FormWidget extends StatefulWidget {
  final CardEntity? card;
  final double animation;
  final Function(String, String, double, int)? onPressed;
  const FormWidget(
      {this.onPressed, this.card, this.animation = 1.0, super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  late int _selectedColorIndex;
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    _selectedColorIndex = int.parse(widget.card?.id ?? '-1');
    _titleController = TextEditingController(text: widget.card?.title);
    _descriptionController =
        TextEditingController(text: widget.card?.description);
    _amountController =
        TextEditingController(text: widget.card?.amount.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.animation == 1.0
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                            labelText: 'Title',
                            labelStyle: TextStyle(
                                fontSize: 24,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold)),
                        controller: _titleController,
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        decoration: const InputDecoration(
                            labelText: 'Description',
                            labelStyle: TextStyle(
                                fontSize: 24,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold)),
                        controller: _descriptionController,
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        decoration: const InputDecoration(
                            labelText: 'Amount',
                            labelStyle: TextStyle(
                                fontSize: 24,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold)),
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          'Choose your card colour',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Wrap(
                          spacing: 10,
                          alignment: WrapAlignment.center,
                          children: List.generate(4, (index) {
                            final isSelected = index == _selectedColorIndex;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedColorIndex = isSelected ? -1 : index;
                                });
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: getColorForIndex(index),
                                  border: isSelected
                                      ? Border.all(
                                          color: Colors.blueAccent, width: 2)
                                      : null,
                                ),
                                child: isSelected
                                    ? const Icon(Icons.check,
                                        color: Colors.blueAccent)
                                    : null,
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
          Column(
            children: [
              Container(
                height: 2,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 80,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (widget.onPressed != null) {
                        widget.onPressed!(
                          _titleController.text,
                          _descriptionController.text,
                          double.tryParse(_amountController.text) ?? 0,
                          _selectedColorIndex,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                    ),
                    child: const Text(
                      'SAVE MY CARD',
                      style: TextStyle(
                          color: Color(0xff77a3de),
                          fontWeight: FontWeight.bold,
                          fontSize: 32),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
