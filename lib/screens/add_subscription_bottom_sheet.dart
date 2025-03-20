import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../consts/app_consts.dart';
import '../models/subscription_model.dart';
import '../providers/subscription_provider.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/list_item_widget.dart';


class AddSubscriptionBottomSheet extends StatefulWidget {
  const AddSubscriptionBottomSheet({super.key});

  @override
  AddSubscriptionBottomSheetState createState() =>
      AddSubscriptionBottomSheetState();
}

class AddSubscriptionBottomSheetState
    extends State<AddSubscriptionBottomSheet> {
  final _selectedController = TextEditingController();

  @override
  void dispose() {
    _selectedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          for (int index = 0; index < optionsList.length; index++)
            InkWell(
              onTap: () {
                _selectedController.text = optionsTitleList[index];
                setState(() {});
              },
              child: ListItemWidget(
                  imagePath: optionsList[index],
                  text: optionsTitleList[index],
                  isSelected:
                      (_selectedController.text == optionsTitleList[index])),
            ),
          Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: CustomButtonWidget(
              text: saveText,
              radius: 12,
              fontSize: 16,
              padding: EdgeInsets.all(12),
              onPressed: () {
                if (_selectedController.text.isEmpty) {
                  return;
                }
                final subscription = Subscription(
                  name: _selectedController.text,
                  price: Random().nextDouble() * 256,
                  renewalDate: DateTime.now().add(Duration(days: 30)),
                );
                Provider.of<SubscriptionProvider>(context, listen: false)
                    .addSubscription(subscription);
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
