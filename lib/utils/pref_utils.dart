
import 'package:utsav/utils/shared_preferences.dart';


class PrefUtils {




  static String? setNostoToken(String token) {
    Prefs.prefs?.setString('NOSTO_TOKEN', token);
  }

  static String getNostoToken() {
    final String? value = Prefs.prefs?.getString('NOSTO_TOKEN');
    return value ?? '';
  }
  static String? setUserkey(String code) {
    Prefs.prefs?.setString('USER_KEY', code);
  }

  static String getUserkey() {
    final String? value = Prefs.prefs?.getString('USER_KEY');
    return value ?? '';
  }

  static String? setResetTpin(String code) {
    Prefs.prefs?.setString('RESET_TPIN', code);
  }

  static String getResetTpin() {
    final String? value = Prefs.prefs?.getString('RESET_TPIN');
    return value ?? '';
  }


  static String? setID(String id) {
    Prefs.prefs?.setString("id", id);
  }

  static String getID() {
    final String? value = Prefs.prefs?.getString("id");
    return value ?? '';
  }

  static String? setName(String name) {
    Prefs.prefs?.setString("name", name);
  }

  static String getName() {
    final String? value = Prefs.prefs?.getString("name");
    return value ?? '';
  }

  static String? setMobile(String mobile) {
    Prefs.prefs?.setString("mobile", mobile);
  }

  static String getMobile() {
    final String? value = Prefs.prefs?.getString("mobile");
    return value ?? '';
  }

  static String? setProfile(String profilePic) {
    Prefs.prefs?.setString("profilePic", profilePic);
  }

  static String getProfile() {
    final String? value = Prefs.prefs?.getString("profilePic");
    return value ?? '';
  }

  static String? setEmail(String email) {
    Prefs.prefs?.setString("email", email);
  }

  static String getEmail() {
    final String? value = Prefs.prefs?.getString("email");
    return value ?? '';
  }

  static String? setAddress(String address) {
    Prefs.prefs?.setString("address", address);
  }

  static String getAddress() {
    final String? value = Prefs.prefs?.getString("address");
    return value ?? '';
  }

  static String? setPincode(String pincode) {
    Prefs.prefs?.setString("pincode", pincode);
  }

  static String getPincode() {
    final String? value = Prefs.prefs?.getString("pincode");
    return value ?? '';
  }



  static String? logout() {
    Prefs.prefs?.clear();
  }
}
