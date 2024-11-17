import 'package:employee_attendance/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService extends ChangeNotifier {
  final SupabaseClient _supabase = Supabase.instance.client;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// Registers a new employee
  Future<void> registerEmployee(
    String email, 
    String password, 
    BuildContext context,
  ) async {
    try {
      setIsLoading = true;

      if (email.isEmpty || password.isEmpty) {
        throw Exception("Todos los campos son requeridos");
      }

      final AuthResponse response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );

      Utils.showSnackBar(
        "¡Éxito! Ahora puede entrar con sus credenciales", 
        context, 
        color: Colors.green,
      );

      Navigator.pop(context);
    } catch (e) {
      Utils.showSnackBar(e.toString(), context, color: Colors.red);
    } finally {
      setIsLoading = false;
    }
  }

  /// Logs in an employee
  Future<void> loginEmployee(
    String email, 
    String password, 
    BuildContext context,
  ) async {
    try {
      setIsLoading = true;

      if (email.isEmpty || password.isEmpty) {
        throw Exception("Todos los campos son requeridos");
      }

      final AuthResponse response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      Utils.showSnackBar("¡Inicio de sesión exitoso!", context, color: Colors.green);
    } catch (e) {
      Utils.showSnackBar(e.toString(), context, color: Colors.red);
    } finally {
      setIsLoading = false;
    }
  }

  /// Logs out the current user
  Future<void> signOut() async {
    await _supabase.auth.signOut();
    notifyListeners();
  }

  /// Returns the currently signed-in user
  User? get currentUser => _supabase.auth.currentUser;

}
