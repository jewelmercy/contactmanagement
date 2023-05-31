import 'package:contact_management/gen/fonts.gen.dart';
import 'package:contact_management/presentation/pages/routes/AppRoutes.dart';
import 'package:contact_management/presentation/widgets/CustomText.dart';
import 'package:contact_management/utility/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({required this.title, super.key});
  final String title;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeHorizontal;
    double height = SizeConfig.safeBlockVertical;
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: CustomText(
                title: "Detail Screen",
                family: FontFamily.lato,
                fontColor: Colors.white,
                fontSize: getDPSize(8)),
          ),
          leading: BackButton(
            onPressed: () {
              context.go(AppRoutes.homeScreen);
            },
          ),
        ),
        body: Center(
            child: CustomText(
                title: widget.title,
                family: FontFamily.lato,
                fontColor: Colors.black,
                fontSize: getDPSize(10))));
  }
}
