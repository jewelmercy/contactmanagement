import 'package:contact_management/data/models/CardModel.dart';
import 'package:contact_management/data/provider/categoryProvider.dart';
import 'package:contact_management/data/provider/searchProvider.dart';
import 'package:contact_management/data/repositories/CardRepository.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'FiltercardProvider.g.dart';

@riverpod
Future<List<CardModel>> filteredCards(FilteredCardsRef ref) async {
  final CardRepository cardrepo = ref.watch(cardRepositoryRefProvider);
  final selectedCategory = ref.watch(seletedCategoryProvider);
  final searchQuery = ref.watch(searchQueryProvider);
  var allcards = await cardrepo.getAllCards();
  if (selectedCategory != null) {
    return allcards.where((card) {
      return card.categories.any((cat) => cat == selectedCategory);
    }).toList();
  }

  if (searchQuery.trim().isNotEmpty) {
    return allcards.where((card) {
      return card.name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
  }
  return allcards;
}
