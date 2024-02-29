import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class LoginApiProvider with ChangeNotifier {
  bool _obscure = true;
  bool get isObscure => _obscure;

  void toggle() {
    _obscure = !_obscure;
    notifyListeners();
  }
  bool _isLoading = false;
  bool get loading => _isLoading;


  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  void login(String email, String password) async {
    setLoading(true);
    try{
      final url = Uri.parse('https://reqres.in/api/login');
    Response response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      
      setLoading(false);
    } else {
      setLoading(false);
    }
    } catch (e) {

      setLoading(false);
    }

  }
}

