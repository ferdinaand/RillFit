import 'dart:convert';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/data/dtos/dto.dart';

abstract class IStorageService {
  Future<void> storeItem({required String key, required String value});
  Future<dynamic> readItem({required String key});
  Future<void> deleteItem({required String key});
  Future<void> deleteAllItems();
  Future<void> cacheCustomer(String customerJsonData);
  Future<void> deleteCustomer();
  Future<UserDto?> fetchCustomer();
  Future<void> cacheAuthToken(String token);
  Future<void> deleteAuthToken();
  Future<String?> fetchAuthToken();
}

class StorageService extends GetxService implements IStorageService {
  @override
  void onInit() {
    //init logic can go here
    storage = const FlutterSecureStorage();
    super.onInit();
  }

  static const _customerKey = 'user';
  static const _authTokenKey = 'token';

  late FlutterSecureStorage storage;
  bool isLoggedIn = false;

  @override
  Future<void> storeItem({required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }

  @override
  Future<dynamic> readItem({required String key}) async {
    final value = await storage.read(key: key);
    return value;
  }

  @override
  Future<void> deleteItem({required String key}) async {
    await storage.delete(key: key);
  }

  @override
  Future<void> deleteAllItems() async {
    await storage.deleteAll();
    log('deleted all items successfully');
  }

  @override
  Future<void> cacheCustomer(String customerJsonData) async {
    await storage.write(
      key: _customerKey,
      value: customerJsonData,
    );
    log('cached customer data successfully');
    return;
  }

  @override
  Future<void> deleteCustomer() async {
    await storage.delete(
      key: _customerKey,
    );
    log('customer data deleted successfully');
    return;
  }

  @override
  Future<UserDto?> fetchCustomer() async {
    final customer = await storage.read(
      key: _customerKey,
    );

    final userDto =
        UserDto.fromJson(jsonDecode(customer ?? '') as Map<String, dynamic>);
    log('customer data fetched successfully');
    return userDto;
  }

  @override
  Future<void> cacheAuthToken(String token) async {
    await storage.write(
      key: _authTokenKey,
      value: 'Bearer $token',
    );
    log('cached auth token successfully');
    return;
  }

  @override
  Future<void> deleteAuthToken() async {
    await deleteItem(
      key: _authTokenKey,
    );
    log('auth token deleted successfully');
    return;
  }

  @override
  Future<String?> fetchAuthToken() async {
    final token = await storage.read(
      key: _authTokenKey,
    );
    log('auth token fetched successfully');
    return token;
  }
}
