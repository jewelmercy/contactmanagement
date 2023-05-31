import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'searchProvider.g.dart';
@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() {
    return "";
  }

  void onChange(String str) {
    state = str;
  }
}
