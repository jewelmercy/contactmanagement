
import 'package:contact_management/data/provider/ConnectivityProvider.dart';

import 'package:contact_management/data/provider/themeProvider.dart';
import 'package:contact_management/gen/fonts.gen.dart';
import 'package:contact_management/presentation/widgets/CustomText.dart';
import 'package:contact_management/presentation/widgets/GridCardView.dart';
import 'package:contact_management/presentation/widgets/Searchbar.dart';
import 'package:contact_management/utility/AppLocalization.dart';


import 'package:contact_management/utility/DeviceInfo.dart';
import 'package:contact_management/utility/SizeConfig.dart';


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';


import '../../../data/models/CardModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/Customecard.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeHorizontal;
    double height = SizeConfig.safeBlockVertical;
    var connectivityStatusProvider = ref.watch(connectivityStatusProviders);
    var darkMode = ref.watch(darkModeProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            connectivityStatusProvider == ConnectivityStatus.isConnected
                ? 'Is Connected to Internet'
                : 'Is Disconnected from Internet',
            style: TextStyle(
              fontFamily: FontFamily.lato,
              color: Colors.white,
              fontSize:
                  deviceType == DeviceType.MOBILE ? getDPSize(5) : getDPSize(2),
            ),
          ),
          backgroundColor:
              connectivityStatusProvider == ConnectivityStatus.isConnected
                  ? Colors.green
                  : Colors.red,
        ),
      );
    });

    return ResponsiveBuilder(builder: (BuildContext, sizingInformation) {
      setDeviceTypeRes(sizingInformation);
      return Scaffold(
          appBar: AppBar(
            title: Center(
              child: CustomText(
                title: AppLocalizations.of(context)!.translate('first_string'),
                fontSize: deviceType == DeviceType.MOBILE
                    ? getFontSize(7)
                    : getFontSize(2),
                family: FontFamily.lato,
                fontColor: Colors.black,
              ),
            ),
            actions: [
              Switch(
                value: darkMode,
                onChanged: (val) {
                  ref.read(darkModeProvider.notifier).toggle();
                },
              ),
            ],
          ),
          body: Column(
            children: [
              Searchbar(),
              CategoryList(
                width: width,
                height: height,
              ),
              GridCardView(
                width: width,
                height: height,
              )
            ],
          ));
    });
  }
}
