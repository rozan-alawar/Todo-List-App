import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

@immutable
class ValidatorFields {
  const ValidatorFields();

  static String? Function(String?)? isValidEmail(BuildContext context) =>
      FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: "Email is required"),
        FormBuilderValidators.email(errorText: "Enter a valid email address"),
      ]);

  static String? Function(String?)? isValidTaskTitle(BuildContext context) =>
      FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: "Task title is required"),
        FormBuilderValidators.fileName(
          errorText: "Enter a valid email address",
        ),
      ]);

  static String? Function(String?)? isValidDescription(BuildContext context) =>
      FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: "Task description is required",
        ),
      ]);

  static String? Function(String?)? isValidPassword(
    BuildContext context, [
    String? passwordToConfirm,
  ]) => FormBuilderValidators.compose([
    FormBuilderValidators.required(errorText: "Password is required"),
    FormBuilderValidators.minLength(
      6,
      errorText: "Password must be at least 6 characters",
    ),
    FormBuilderValidators.maxLength(
      50,
      errorText: "Password must be at most 50 characters",
    ),
    if (passwordToConfirm != null)
      FormBuilderValidators.equal(
        passwordToConfirm,
        errorText: "Passwords do not match",
      ),
  ]);

  static String? Function(String?)? isValidName(BuildContext context) =>
      FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: "Name is required"),
        FormBuilderValidators.minLength(
          3,
          errorText: "The name must be at most 3 characters",
        ),
        FormBuilderValidators.maxLength(
          50,
          errorText: "Name must not exceed 50 characters",
        ),
      ]);

  static String? Function(String?)? isValidCountry(BuildContext context) =>
      FormBuilderValidators.required(errorText: "choose");

  static String? Function(String?)? isValidMessage(BuildContext context) =>
      FormBuilderValidators.required(errorText: 'The message is required');
}
