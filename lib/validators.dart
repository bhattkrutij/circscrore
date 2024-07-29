import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'cubits/tournament_cubit/tournament_form_cubit.dart';

mixin Validator {
// tournament name
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Tournament name is required';
    }
    return null;
  }

  // tournament name
  String? validateOvers(String? value) {
    if (value == null || value.isEmpty) {
      return 'Tournament overs   required';
    }
    return null;
  }

  // tournament type
  String? validateType(String? value) {
    if (value == null || value.isEmpty) {
      return 'Tournament type is required';
    }
    return null;
  } // tournament type

  String? validateStartDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Tournament start date is required';
    }
    return null;
  }

  String? validateEndDate(String? value, DateTime? startDate) {
    if (value == null || value.isEmpty) {
      return 'Tournament end date is required';
    }

    // Convert end date from string to DateTime
    DateTime endDate = DateFormat.yMd().parse(value);

    // Check if end date is after the start date
    if (startDate != null && endDate.isBefore(startDate)) {
      return 'End date must be after the start date';
    }

    return null;
  }

  // Email validation
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // Password validation
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  // Confirm password validation
  String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    } else if (value != password) {
      return 'Confirm password does not match';
    }
    return null;
  }

  // Name validation
  String? validateTournamentName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  // Address validation
  String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Address is required';
    }
    return null;
  }

  // City validation
  String? validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'City is required';
    }
    return null;
  }
}