import 'dart:developer';

import 'package:htwms/api/api.dart';
import 'package:htwms/core/utils/provider.dart';
import 'package:provider/provider.dart';

import '../core/http/http.dart';

getUserinfo(context) {
  UserProfile userProfile = Provider.of<UserProfile>(context, listen: false);
  XHttp.get(Api.userinfoApi).then((value) {
    log(value.toString());
    userProfile.nickName = value["user"]["nickName"];
  });
}
