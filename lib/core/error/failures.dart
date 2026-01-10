abstract class Failure {
  final String messages;
  const Failure(this.messages);
}

// Errores de red
class NetworkFailure extends Failure {
  const NetworkFailure(super.messages);
}

class ServerFailure extends Failure {
  const ServerFailure(super.messages);
}

// Errores 404 / no encontrado
class NotFoundFailure extends Failure {
  const NotFoundFailure() : super('Recurso no encontrado');
}

// Errores inesperados
class UnknownFailure extends Failure {
  const UnknownFailure() : super('Error inesperado');
}

class LocalFailure extends Failure {
  const LocalFailure(String messages) : super('Error dbLocal');
}
