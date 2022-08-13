import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/storage_all_products_controller.dart';

class StorageAllProductsView extends GetView<StorageAllProductsController> {
  const StorageAllProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StorageAllProductsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'StorageAllProductsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
