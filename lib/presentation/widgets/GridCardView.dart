import 'package:contact_management/data/provider/FiltercardProvider.dart';
import 'package:contact_management/gen/fonts.gen.dart';
import 'package:contact_management/presentation/pages/routes/AppRoutes.dart';
import 'package:contact_management/presentation/widgets/CustomText.dart';
import 'package:contact_management/presentation/widgets/SnackBar.dart';
import 'package:contact_management/utility/DeviceInfo.dart';
import 'package:contact_management/utility/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/CardModel.dart';

class GridCardView extends ConsumerWidget {
  GridCardView({required this.width, required this.height, super.key});
  double width;
  double height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cards = ref.watch(filteredCardsProvider);
    return cards.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      data: (cardsitem) {
        return Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio:deviceType == DeviceType.MOBILE?1: 0.9,
                crossAxisCount:deviceType == DeviceType.MOBILE? 2: 4,
                mainAxisSpacing: deviceType == DeviceType.MOBILE?width * 2: 0,
                crossAxisSpacing:deviceType == DeviceType.MOBILE? width * 2:0),
            itemCount: cardsitem.length,
            itemBuilder: (context, index) {
              return GridViewChild(
                width: width,
                height: height,
                cardItem: cardsitem[index],
              );
            },
          ),
        );
      },
      error: (error, stackTrace) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            returnSnackBar("No Data Available")
          );
        });
        return Center(
          child: CustomText(
              title: "No Data",
              family: FontFamily.lato,
              fontColor: Colors.black,
              fontSize: getDPSize(15)),
        );
      },
    );
  }
}

class GridViewChild extends StatelessWidget {
  GridViewChild({
    required this.cardItem,
    required this.height,
    required this.width,
    super.key,
  });
  CardModel cardItem;
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            context.go('${AppRoutes.detailsScreen}?title=${cardItem.name}');
          },
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            // margin: EdgeInsets.all(width*2),
            child: Image.asset(
              cardItem.image,
              fit: BoxFit.fill,
              width: deviceType == DeviceType.MOBILE? width * 40 : width*10,
              height: deviceType == DeviceType.MOBILE? width * 40 : width*10,
            ),
          ),
        ),
        CustomText(
            title: cardItem.name,
            family: FontFamily.lato,
            fontColor: Colors.blue,
            fontSize:deviceType == DeviceType.MOBILE? getDPSize(5): getDPSize(3))
      ],
    );
  }
}
