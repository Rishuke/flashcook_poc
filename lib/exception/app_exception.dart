import 'package:firebase_core/firebase_core.dart';

abstract class AppException implements Exception {
  final String title;
  final String message;

  const AppException({
    required this.title,
    required this.message,
  });

  static AppException from(Object exception) {
    if (exception is AppException) return exception;

    if (exception is FirebaseException) {
      if (exception.message?.toLowerCase().contains('network') ?? false) {
        return const NoInternetException();
      }
      return const UnknownException();
    }

    return const UnknownException();
  }
}

class UnknownException extends AppException {
  const UnknownException()
      : super(
          title: 'Erreur',
          message: 'Une erreur est survenue',
        );
}

class WrongCredentialsException extends AppException {
  const WrongCredentialsException()
      : super(
          title: 'Erreur',
          message: 'Identifiants incorrects',
        );
}

class WeakPasswordException extends AppException {
  const WeakPasswordException()
      : super(
          title: 'Erreur',
          message: 'Mot de passe trop faible',
        );
}

class EmailAlreadyInUseException extends AppException {
  const EmailAlreadyInUseException()
      : super(
          title: 'Erreur',
          message: 'Cet email est déjà utilisé',
        );
}

class RequiresRecentLoginException extends AppException {
  const RequiresRecentLoginException()
      : super(
          title: 'Erreur',
          message: 'Vous devez vous reconnecter',
        );
}

class NoInternetException extends AppException {
  const NoInternetException()
      : super(
          title: 'Erreur',
          message: 'Pas de connexion internet',
        );
}

class GettingProfileException extends AppException {
  const GettingProfileException()
      : super(
          title: 'Erreur',
          message: 'Impossible de récupérer le profil',
        );
}

class LoginException extends AppException {
  const LoginException()
      : super(
          title: 'Erreur',
          message: 'Impossible de se connecter',
        );
}
