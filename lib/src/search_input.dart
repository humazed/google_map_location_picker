import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_map_location_picker/generated/i18n.dart';

/// Custom Search input field, showing the search and clear icons.
class SearchInput extends StatefulWidget {
  final ValueChanged<String> onSearchInput;
  final Key searchInputKey;
  final BoxDecoration _boxDecoration;
  final String _hintText;

  SearchInput(
    this.onSearchInput, {
    Key key,
    this.searchInputKey,
    BoxDecoration boxDecoration,
    String hintText,
  })  : _boxDecoration = boxDecoration ??
            BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              color: Colors.black54),
        _hintText = hintText ?? "Search place",
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SearchInputState(onSearchInput, _boxDecoration, _hintText);
  }
}

class SearchInputState extends State {
  final ValueChanged<String> onSearchInput;
  final BoxDecoration _boxDecoration;
  final String _hintText;

  TextEditingController editController = TextEditingController();

  Timer debouncer;

  bool hasSearchEntry = false;

  SearchInputState(this.onSearchInput, this._boxDecoration, this._hintText);

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
      onSearchInput(editController.text);
      return;
    }

    if (debouncer?.isActive ?? false) {
      debouncer.cancel();
    }

    debouncer = Timer(Duration(milliseconds: 500), () {
      onSearchInput(editController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search,
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: S.of(context)?.search_place ?? _hintText,
                border: InputBorder.none,
              ),
              controller: editController,
              onChanged: (value) {
                setState(() {
                  hasSearchEntry = value.isNotEmpty;
                });
              },
            ),
          ),
          SizedBox(
            width: 8,
          ),
          hasSearchEntry
              ? GestureDetector(
                  child: Icon(
                    Icons.clear,
                  ),
                  onTap: () {
                    editController.clear();
                    setState(() {
                      hasSearchEntry = false;
                    });
                  },
                )
              : SizedBox(),
        ],
      ),
      decoration: _boxDecoration,
    );
  }
}
