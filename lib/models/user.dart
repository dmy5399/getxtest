import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

class User {
  dynamic id;
  dynamic name;
  dynamic username;
  dynamic email;
  dynamic address;
  dynamic phone;
  dynamic website;
  dynamic company;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: json['address'],
      phone: json['phone'],
      website: json['website'],
      company: json['company'],
    );
  }
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final typeId = 1;

  @override
  User read(BinaryReader reader) {
    return User()
      ..id = reader.read()
      ..name = reader.read()
      ..username = reader.read()
      ..email = reader.read()
      ..address = reader.read()
      ..phone = reader.read()
      ..website = reader.read()
      ..company = reader.read();
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.name);
    writer.write(obj.username);
    writer.write(obj.email);
    writer.write(obj.address);
    writer.write(obj.phone);
    writer.write(obj.website);
    writer.write(obj.company);
  }
}