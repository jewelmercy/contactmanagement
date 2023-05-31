import 'dart:convert';
import 'dart:io';
import 'package:contact_management/data/models/CardModel.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'CardRepository.g.dart';

@riverpod
CardRepository cardRepositoryRef(CardRepositoryRefRef ref) => CardRepository();

class CardRepository {
  Future<List<CardModel>> getAllCards() async {
    try {
      final uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
      final response = await http.get(uri);
      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return itemList;
        default:
          throw Error();
      }
    } on SocketException catch (_) {
      // make it explicit that a SocketException will be thrown if the network connection fails
      rethrow;
    }
  }

  Future<CardModel> getcard(int id) async {
    try {
      final uri = Uri.parse('jsonplaceholder.typicode.com/photos');
      final response = await http.get(uri);
      switch (response.statusCode) {
        case 200:
          // final data = json.decode(response.body);
          return itemList.firstWhere((element) => element.id == id);
        default:
          throw Exception(response.reasonPhrase);
      }
    } on SocketException catch (_) {
      // make it explicit that a SocketException will be thrown if the network connection fails
      rethrow;
    }
  }
}
