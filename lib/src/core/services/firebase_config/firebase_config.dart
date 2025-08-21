import 'package:firebase_auth/firebase_auth.dart';

class FirebaseConfig {
  static AuthFailure handleFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return const EmailAlreadyInUseFailure();
      case 'weak-password':
        return const WeakPasswordFailure();
      case 'user-not-found':
        return const UserNotFoundFailure();
      case 'wrong-password':
        return const WrongPasswordFailure();
      case 'invalid-email':
        return const InvalidEmailFailure();
      case 'network-request-failed':
        return const NetworkFailure();
      default:
        return UnknownFailure(e.message ?? 'Unknown error occurred');
    }
  }
}

sealed class AuthFailure {
  const AuthFailure(this.message);
  final String message;
}

class EmailAlreadyInUseFailure extends AuthFailure {
  const EmailAlreadyInUseFailure() : super('Email is already in use');
}

class WeakPasswordFailure extends AuthFailure {
  const WeakPasswordFailure() : super('Password is too weak');
}

class UserNotFoundFailure extends AuthFailure {
  const UserNotFoundFailure() : super('User not found');
}

class WrongPasswordFailure extends AuthFailure {
  const WrongPasswordFailure() : super('Wrong password');
}

class InvalidEmailFailure extends AuthFailure {
  const InvalidEmailFailure() : super('Invalid email address');
}

class NetworkFailure extends AuthFailure {
  const NetworkFailure() : super('Network error');
}

class UnknownFailure extends AuthFailure {
  const UnknownFailure(super.message);
}
