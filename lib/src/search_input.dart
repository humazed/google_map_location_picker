import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_map_location_picker/generated/i18n.dart';

/// Custom Search input field, showing the search and clear icons.
class SearchInput extends StatefulWidget {
  final ValueChanged<String> onSearchInput;
  final Key searchInputKey;

  SearchInput(
    this.onSearchInput, {
    Key key,
    this.searchInputKey,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SearchInputState(onSearchInput);
  }
}

class SearchInputState extends State {
  final ValueChanged<String> onSearchInput;

  TextEditingController editController = TextEditingController();

  Timer debouncer;

  bool hasSearchEntry = false;

  SearchInputState(this.onSearchInput);

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
            color: Colors.black,
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: S.of(context)?.search_place ?? 'Search place',
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
                    color: Colors.black,
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[100],
      ),
    );
  }
}
