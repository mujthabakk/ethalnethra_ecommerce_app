import 'package:flutter/material.dart';

/// Auth Controller - Manages authentication state and logic
class AuthController extends ChangeNotifier {
  String _phoneNumber = '';
  String _otp = '';
  String _selectedZone = '';
  String _selectedArea = '';
  bool _isLoading = false;
  String? _errorMessage;

  // Getters
  String get phoneNumber => _phoneNumber;
  String get otp => _otp;
  String get selectedZone => _selectedZone;
  String get selectedArea => _selectedArea;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Phone Number
  void setPhoneNumber(String value) {
    _phoneNumber = value;
    _errorMessage = null;
    notifyListeners();
  }

  bool validatePhoneNumber() {
    if (_phoneNumber.isEmpty) {
      _errorMessage = 'Please enter phone number';
      notifyListeners();
      return false;
    }
    if (_phoneNumber.length < 10) {
      _errorMessage = 'Please enter valid phone number';
      notifyListeners();
      return false;
    }
    return true;
  }

  // OTP
  void setOtp(String value) {
    _otp = value;
    _errorMessage = null;
    notifyListeners();
  }

  bool validateOtp() {
    if (_otp.isEmpty || _otp.length < 4) {
      _errorMessage = 'Please enter valid OTP';
      notifyListeners();
      return false;
    }
    return true;
  }

  // Location
  void setZone(String value) {
    _selectedZone = value;
    notifyListeners();
  }

  void setArea(String value) {
    _selectedArea = value;
    notifyListeners();
  }

  bool validateLocation() {
    if (_selectedZone.isEmpty) {
      _errorMessage = 'Please select zone';
      notifyListeners();
      return false;
    }
    if (_selectedArea.isEmpty) {
      _errorMessage = 'Please select area';
      notifyListeners();
      return false;
    }
    return true;
  }

  // Loading State
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Mock Send OTP
  Future<bool> sendOtp() async {
    if (!validatePhoneNumber()) return false;

    setLoading(true);

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    setLoading(false);
    return true;
  }

  // Mock Verify OTP
  Future<bool> verifyOtp() async {
    if (!validateOtp()) return false;

    setLoading(true);

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    setLoading(false);
    return true;
  }

  // Mock Submit Location
  Future<bool> submitLocation() async {
    if (!validateLocation()) return false;

    setLoading(true);

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    setLoading(false);
    return true;
  }

  // Mock Google Sign In
  Future<bool> signInWithGoogle() async {
    setLoading(true);

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    setLoading(false);
    return true;
  }

  // Mock Facebook Sign In
  Future<bool> signInWithFacebook() async {
    setLoading(true);

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    setLoading(false);
    return true;
  }

  // Reset
  void reset() {
    _phoneNumber = '';
    _otp = '';
    _selectedZone = '';
    _selectedArea = '';
    _isLoading = false;
    _errorMessage = null;
    notifyListeners();
  }

  // Available zones and areas (mock data)
  List<String> get availableZones => [
    'Banasree',
    'Gulshan',
    'Dhanmondi',
    'Uttara',
    'Mirpur',
  ];

  List<String> get availableAreas => [
    'Block A',
    'Block B',
    'Block C',
    'Block D',
    'Block E',
  ];
}
