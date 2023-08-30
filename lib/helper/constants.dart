import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:off_app/helper/network_info.dart';

const kPrimaryColor = Color(0xFF62FCD7);
const kBannerBox = 'banner_box';
const kContestBox = 'contest_box';
List<Color> kColors = [
  const Color(0xFFED254E),
  const Color(0xFFF78E69),
  const Color(0xFFF7ECE1),
  const Color(0xFFEFC69B),
  const Color(0xFFFFACE4),
  const Color(0xFFAA998F),
  const Color(0xFFCC8B86),
];

NetworkInfoImp networkInfoImp =
    NetworkInfoImp(internetConnectionChecker: InternetConnectionChecker());
