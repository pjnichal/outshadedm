import 'dart:async';

import 'package:flutter/services.dart';

class UserProvider {
  Future<String> fetchUser() async {
    // Fetch Data From Api
    final String response = await rootBundle.loadString('assets/data.json');
    return response;
  }
}
