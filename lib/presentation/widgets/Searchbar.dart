import 'package:contact_management/data/provider/searchProvider.dart';
import 'package:contact_management/utility/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Searchbar extends ConsumerWidget {
  Searchbar({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.all(getDPSize(4)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: getDPSize(1)),
        child: TextFormField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search...',
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () => _searchController.clear(),
            ),
            prefixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          onChanged: ref.read(searchQueryProvider.notifier).onChange,
        ),
      ),
    );
  }
}
