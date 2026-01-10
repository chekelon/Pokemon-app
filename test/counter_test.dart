import 'package:flutter_block_pruebas/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Counter value should be incremented', () {
    // Arrange   -> Nos preparamos para el test
    final counter = Counter();

    // Act  -> Ejecutamos la funcionalidad que queremos testear
    counter.increment();

    // Assert -> Verificamos que el resultado es el esperado
    expect(counter.value, 1);
  });
}
