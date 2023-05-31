import 'package:responsive_builder/responsive_builder.dart';

enum DeviceType { MOBILE, DESKTOP, TABLET }

DeviceType deviceType = DeviceType.DESKTOP;
DeviceType getDeviceTypeRes(SizingInformation sizingInformation) {
  if (sizingInformation.isMobile) {
    return DeviceType.MOBILE;
  } else if (sizingInformation.isDesktop) {
    return DeviceType.DESKTOP;
  } else {
    return DeviceType.TABLET;
  }
}

setDeviceTypeRes(SizingInformation sizingInformation) {
  if (sizingInformation.isMobile) {
    deviceType = DeviceType.MOBILE;
  } else if (sizingInformation.isDesktop) {
    deviceType = DeviceType.DESKTOP;
  } else if (sizingInformation.isTablet) {
    deviceType = DeviceType.TABLET;
  } else {
    deviceType = DeviceType.MOBILE;
  }
}
