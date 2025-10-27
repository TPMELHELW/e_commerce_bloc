class FirebaseFirestoreErrorMappers {
  static String mapFirestoreError(String code) {
    switch (code) {
      case 'permission-denied':
        return 'You do not have permission to perform this action.';
      case 'not-found':
        return 'The requested document could not be found.';
      case 'already-exists':
        return 'This document already exists.';
      case 'cancelled':
        return 'The operation was cancelled.';
      case 'unauthenticated':
        return 'You need to be logged in to continue.';
      case 'deadline-exceeded':
        return 'The request timed out. Please try again.';
      case 'unavailable':
        return 'Service unavailable. Try again later.';
      case 'invalid-argument':
        return 'Invalid input provided.';
      case 'internal':
        return 'Internal error occurred.';
      case 'network-request-failed':
        return 'Network connection failed. Check your internet.';
      default:
        return 'An unknown error occurred.';
    }
  }
}
