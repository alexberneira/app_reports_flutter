import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'myhomepage.dart';

class OutraPagina extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(
      appBar: AppBar(title: const Text('Second page')),
      body: Center(
        child: Text("${c.count}"),
      ),
    );
  }
}
