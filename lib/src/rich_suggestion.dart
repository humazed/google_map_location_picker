import 'package:flutter/material.dart';

import 'model/auto_comp_iete_item.dart';

class RichSuggestion extends StatelessWidget {
  final VoidCallback onTap;
  final AutoCompleteItem autoCompleteItem;

  RichSuggestion(this.autoCompleteItem, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RichText(
                    text: TextSpan(children: getStyledTexts(context)),
                  ),
                )
              ],
            )),
      ),
    );
  }

  List<TextSpan> getStyledTexts(BuildContext context) {
    final List<TextSpan> result = [];

    String startText =
        autoCompleteItem.text!.substring(0, autoCompleteItem.offset);
    if (startText.isNotEmpty) {
      result.add(
        TextSpan(
          text: startText,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
        ),
      );
    }

    String boldText = autoCompleteItem.text!.substring(autoCompleteItem.offset!,
        autoCompleteItem.offset! + autoCompleteItem.length!);

    result.add(
      TextSpan(
        text: boldText,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );

    String remainingText = this
        .autoCompleteItem
        .text!
        .substring(autoCompleteItem.offset! + autoCompleteItem.length!);
    result.add(
      TextSpan(
        text: remainingText,
        style: TextStyle(color: Colors.grey, fontSize: 15),
      ),
    );

    return result;
  }
}
