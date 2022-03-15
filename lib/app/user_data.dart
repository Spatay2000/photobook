import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  void setToken(String? token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token!);
    log('token set: $token');
  }

  void deleteToken() async {
    print('delete token called');
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', "");
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString('token');
    return value ?? "";
  }

  void setUsername(String? username) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username!);
    print('Username set: $username');
  }

  void deleteUsername() async {
    print('delete token called');
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('username', "");
  }

  Future<String> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString('username');
    return value ?? "";
  }

  void setUserId(int? id) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('userId', id!);
    print('token set: $id');
  }

  void deleteUserId() async {
    print('delete token called');
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('userId', -1);
  }

  Future<int> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getInt('userId');
    return value ?? -1;
  }

  void setPincode(String? username) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('pincode', username!);
    print('Pincode set: $username');
  }

  void deletePincode() async {
    print('delete pincode called');
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('pincode', "");
  }

  Future<String> getPincode() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString('pincode');
    return value ?? "";
  }
}
