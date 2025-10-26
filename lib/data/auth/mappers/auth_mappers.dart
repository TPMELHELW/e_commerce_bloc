class AuthMappers {
  static String signInMappers(String errorCode) {
    switch (errorCode) {
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later.';
      case 'network-request-failed':
        return 'Network error. Check your internet connection.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }

  static String signUpMappers(String errorCode) {
    switch (errorCode) {
      case 'invalid-email':
        return 'The email is not valid.';
      case 'email-already-in-use':
        return 'This email is already registered.';
      case 'weak-password':
        return 'The password is too weak.';
      case 'operation-not-allowed':
        return 'This sign-up method is not enabled.';
      case 'network-request-failed':
        return 'Network error. Check your internet connection.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }
}
