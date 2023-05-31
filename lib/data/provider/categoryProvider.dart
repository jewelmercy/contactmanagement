import 'package:contact_management/data/models/CardModel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'categoryProvider.g.dart';

@riverpod
class SeletedCategory extends _$SeletedCategory {
  CategoryItem? build() {
    return null;
  }

  void setselectedCategory(CategoryItem? selectedCategory) {
    if (state == selectedCategory) {
      state = null;
    } else {
      state = selectedCategory;
    }
  }
}
