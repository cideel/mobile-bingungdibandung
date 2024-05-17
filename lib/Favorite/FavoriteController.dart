import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTabs extends GetxController with SingleGetTickerProviderMixin{
    late TabController controller;
    final List<Tab> myTabs = [
      Tab(child: Center(child: Text("Tersimpan"),),icon: Icon(Icons.save_alt_outlined),),
      Tab(child: Center(child: Text("Terjadwal"),),icon: Icon(Icons.schedule_outlined),)

    ];
    @override
    void onInit(){
      controller = TabController(length: 2, vsync: this);
      super.onInit();
    }
    @override
    void onClose(){
      controller.dispose();
      super.onClose();
    }
}