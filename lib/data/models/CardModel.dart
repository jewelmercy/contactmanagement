import 'package:contact_management/gen/assets.gen.dart';

enum CategoryItem {
  Personal,
  Office,
  Home,
  Friends,
  Hospital,
}

class CardModel {
  final int id;
  final String name;
  final String image;
  final List<CategoryItem> categories;

  CardModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.categories});
}

List<CardModel> itemList = [
  CardModel(
      id: 0,
      name: "Personal",
      image: Assets.images.tree.path,
      categories: [CategoryItem.Personal, CategoryItem.Home]),
  CardModel(
      id: 0,
      name: "Office",
      image: Assets.images.river.path,
      categories: [CategoryItem.Office]),
  CardModel(id: 0, name: "Home", image: Assets.images.house.path, categories: [
    CategoryItem.Personal,
    CategoryItem.Home,
    CategoryItem.Friends,
    CategoryItem.Hospital
  ]),
  CardModel(
      id: 0,
      name: "Freinds",
      image: Assets.images.forest.path,
      categories: [CategoryItem.Home, CategoryItem.Friends]),
  CardModel(
      id: 0,
      name: "Freinds",
      image: Assets.images.forest.path,
      categories: [CategoryItem.Home, CategoryItem.Friends]),
  CardModel(
      id: 0,
      name: "Freinds",
      image: Assets.images.forest.path,
      categories: [CategoryItem.Home, CategoryItem.Friends]),
  CardModel(
      id: 0,
      name: "Hospital",
      image: Assets.images.forest.path,
      categories: [CategoryItem.Home, CategoryItem.Hospital]),
];
