import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void launchWhatsApp({@required String phone, @required String message}) async {
  String url() {
    if (Platform.isIOS) {
      return "whatsapp://wa.me/$phone/?text=${Uri.parse(message)}";
    } else {
      return "whatsapp://send?phone=$phone&text=${Uri.parse(message)}";
    }
  }

  if (await canLaunch(url())) {
    await launch(url());
  } else {
    throw 'Could not launch ${url()}';
  }
}

void launchPhone(String phone) async {
  if (await canLaunch("tel://"+phone)) {
    await launch("tel://"+phone);
  } else {
    throw 'Could not launch';
  }
}

void launchEmail(String email) async {
  if (await canLaunch("mailto:"+email)) {
    await launch("mailto:"+email);
  } else {
    throw 'Could not launch';
  }
}

