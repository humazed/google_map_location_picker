import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_map_location_picker/generated/l10n.dart';

/// Custom Search input field, showing the search and clear icons.
class SearchInput extends StatefulWidget {
  SearchInput(
    this.onSearchInput, {
    Key? key,
    this.searchInputKey,
    this.boxDecoration,
    this.hintText,
  }) : super(key: key);

  final ValueChanged<String> onSearchInput;
  final Key? searchInputKey;
  final BoxDecoration? boxDecoration;
  final String? hintText;

  @override
  State<StatefulWidget> createState() => SearchInputState();
}

class SearchInputState extends State<SearchInput> {
  TextEditingController editController = TextEditingController();

  Timer? debouncer;

  bool hasSearchEntry = false;

  @override
  void initState() {
    super.initState();
    editController.addListener(onSearchInputChange);
  }

  @override
  void dispose() {
    editController.removeListener(onSearchInputChange);
    editController.dispose();

    super.dispose();
  }

  void onSearchInputChange() {
    if (editController.text.isEmpty) {
      debouncer?.cancel();
      widget.onSearchInput(editController.text);
      return;
    }

    if (debouncer?.isActive ?? false) {
      debouncer!.cancel();
    }

    debouncer = Timer(Duration(milliseconds: 1000), () {
      widget.onSearchInput(editController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).brightness == Brightness.dark
        ? Colors.black45
        : Colors.white;
    BorderRadius borderRadius = BorderRadius.circular(30);
    return Row(
      children: [
        IconButton(
            onPressed: () => Navigator.maybePop(context),
            icon: Icon(
              Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
            ),
            padding: EdgeInsets.zero),
        Expanded(
          child: Container(
            height: 40,
            child: Material(
              type: color == Colors.transparent
                  ? MaterialType.transparency
                  : MaterialType.canvas,
              color: color,
              shape: RoundedRectangleBorder(
                  borderRadius: borderRadius,
                  side: BorderSide(color: Colors.transparent)),
              elevation: 4.0,
              child: ClipRRect(
                borderRadius: borderRadius,
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        controller: editController,
                        decoration: InputDecoration(
                          hintText: widget.hintText ??
                              S.of(context)?.search_place ??
                              'Search place',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          setState(() {
                            hasSearchEntry = value.isNotEmpty;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: hasSearchEntry
                          ? GestureDetector(
                              child: Icon(Icons.clear),
                              onTap: () {
                                editController.clear();
                                setState(() {
                                  hasSearchEntry = false;
                                });
                              },
                            )
                          : Icon(Icons.search),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 16),
      ],
    );
  }
}
