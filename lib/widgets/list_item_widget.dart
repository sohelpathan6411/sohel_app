import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  final String imagePath, text;
  final bool isSelected;
  const ListItemWidget(
      {super.key,
      required this.imagePath,
      required this.text,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 42,
        width: 42,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.all(6.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
      trailing: CircleAvatar(
          radius: 12,
          backgroundColor: isSelected ? Colors.blue.shade800 : Colors.black,
          child: isSelected
              ? Icon(Icons.check, size: 15, color: Colors.white)
              : SizedBox()),
    );
  }
}
