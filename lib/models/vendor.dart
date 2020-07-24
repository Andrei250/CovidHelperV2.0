import 'package:flutter/material.dart';

class Vendor extends InheritedModel {
  const Vendor(this.name, this.email, this.phoneNumber, this.uid, Widget child)
      : super(child: child);

  final String name;
  final String email;
  final String phoneNumber;
  final String uid;

  @override
  bool updateShouldNotify(Vendor oldWidget) {
    return name != oldWidget.name ||
        email != oldWidget.email ||
        phoneNumber != oldWidget.phoneNumber;
    throw UnimplementedError();
  }

  @override
  bool updateShouldNotifyDependent(Object oldObject, Set dependencies) {
    // TODO: implement updateShouldNotifyDependent
    throw UnimplementedError();
  }
}
