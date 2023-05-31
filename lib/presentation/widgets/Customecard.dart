import 'package:contact_management/data/models/CardModel.dart';
import 'package:contact_management/data/provider/categoryProvider.dart';
import 'package:contact_management/data/provider/searchProvider.dart';
import 'package:contact_management/gen/fonts.gen.dart';
import 'package:contact_management/presentation/widgets/CustomText.dart';
import 'package:contact_management/utility/DeviceInfo.dart';
import 'package:contact_management/utility/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryList extends ConsumerWidget {
  CategoryList({required this.width, required this.height, super.key});
  final double height;
  final double width;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCat = ref.watch(seletedCategoryProvider);
    return SizedBox(
      height:deviceType == DeviceType.MOBILE?  height * 10: height*18,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: CategoryItem.values.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(getDPSize(2)),
              child: InkWell(
                onTap: () {
                  ref
                      .read(seletedCategoryProvider.notifier)
                      .setselectedCategory(CategoryItem.values[index]);
                },
                child: Container(
                    width:deviceType == DeviceType.MOBILE? width * 25: width*15,
                    decoration: BoxDecoration(
                      color: selectedCat == CategoryItem.values[index]
                          ? Colors.blue.withOpacity(0.5)
                          : Colors.grey.withOpacity(0.5),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(getDPSize(2)),
                      child: Center(
                          child: CustomText(
                        title: CategoryItem.values[index].name,
                        family: FontFamily.lato,
                        fontColor: Colors.indigo,
                        fontSize:deviceType == DeviceType.MOBILE? getDPSize(5):getDPSize(2),
                      )),
                    )),
              ),
            );
          }),
    );
  }
}

class CustomCard extends StatelessWidget {
  CustomCard({
    required this.title,
    required this.isSelected,
    required this.ontap,
    required this.width,
    super.key,
  });

  String title;
  bool isSelected;
  Function() ontap;
  double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.all(getDPSize(15)),
        child: Container(
          width: width * 20,
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.blue.withOpacity(0.5)
                : Colors.grey.withOpacity(0.5),
            borderRadius: const BorderRadius.all(
              Radius.circular(50.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(getDPSize(2)),
            child: Center(
              child: CustomText(
                  title: title,
                  family: FontFamily.lato,
                  fontColor: Colors.black,
                  fontSize: getDPSize(5)),
            ),
          ),
        ),
      ),
    );
  }
}
