# Pokémon App

Aplicación Flutter que genera un Pokémon aleatorio de la primera generación usando la [PokéAPI](https://pokeapi.co/), permite **capturarlo** y guarda tu colección de forma local para consultarla después, incluso sin conexión.

El proyecto está construido con **Clean Architecture** y **BLoC**, y sirve como base para practicar gestión de estado, inyección de dependencias y manejo funcional de errores en Flutter.

## Características

- Genera un Pokémon aleatorio (ids del 1 al 150) consultando la PokéAPI.
- Muestra la imagen y el nombre del Pokémon obtenido.
- Permite capturar el Pokémon y lo guarda en el dispositivo con Hive.
- Lista horizontalmente los Pokémon capturados.
- Pantalla de detalle con nombre, altura, peso y tipos.
- Manejo de errores de red (por ejemplo, timeout de conexión) mediante un interceptor de Dio, con mensajes mostrados en un `SnackBar`.

## Tecnologías

| Área | Paquete |
|------|---------|
| Framework | Flutter (Dart SDK ^3.10.4) |
| Gestión de estado | `bloc`, `flutter_bloc` |
| Inyección de dependencias | `get_it` |
| Cliente HTTP | `dio` |
| Manejo funcional de errores | `dartz` (`Either<Failure, T>`) |
| Almacenamiento local | `hive`, `hive_flutter` |
| Comparación de objetos | `equatable` |
| API | [PokéAPI v2](https://pokeapi.co/api/v2) |

## Arquitectura

El código está organizado por capas dentro de `lib/features`:

```
lib/
├── main.dart                  # Punto de entrada
├── di.dart                    # Registro de dependencias (GetIt)
├── core/
│   ├── error/                 # Failures y excepciones
│   ├── network/interceptors/  # Constantes de red e interceptor de errores
│   └── utils/                 # Utilidades (generador de id aleatorio)
└── features/
    ├── data/
    │   ├── datasources/       # Remoto (Dio) y local (Hive)
    │   ├── mappers/           # Modelos → entidades
    │   ├── models/            # Modelos de datos (JSON)
    │   └── repositories/      # Implementación del repositorio
    ├── domain/
    │   ├── datasources/       # Contratos de datasources
    │   ├── entities/          # Entidades de negocio
    │   ├── repositories/      # Contrato del repositorio
    │   └── usecases/          # Capturar, buscar y listar capturados
    └── presentacion/
        ├── bloc/              # SearchPokemonBloc (eventos y estados)
        ├── pages/             # Pantallas
        └── widgets/           # Componentes reutilizables
```

**Flujo de datos:** la interfaz dispara un evento al `SearchPokemonBloc`, que ejecuta un caso de uso, que a su vez llama al repositorio. Este obtiene los datos de la PokéAPI o de Hive y devuelve un `Either<Failure, T>`, que el bloc convierte en un estado (`Loading`, `Success`, `List` o `Failure`) para la interfaz.

## Requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) compatible con Dart ^3.10.4
- Un emulador, dispositivo físico o navegador para ejecutar la app
- Conexión a internet para consultar la PokéAPI

## Instalación y ejecución

1. Clona el repositorio:

   ```bash
   git clone https://github.com/chekelon/Pokemon-app.git
   cd Pokemon-app
   ```

2. Instala las dependencias:

   ```bash
   flutter pub get
   ```

3. Ejecuta la aplicación:

   ```bash
   flutter run
   ```

El proyecto incluye configuración para Android, iOS, Web, Windows, macOS y Linux.

## Pruebas

```bash
flutter test
```

## Mejoras pendientes

- Agregar capturas de pantalla.
- Reemplazar el nombre de paquete `flutter_block_pruebas` y el título `Video Demo` por los definitivos.
- Ampliar la cobertura de pruebas para el bloc, los casos de uso y los repositorios.
- Permitir búsqueda por nombre y navegación al detalle desde la colección capturada.

## Autor

**chekelon** · [GitHub](https://github.com/chekelon)

## Licencia

Este proyecto aún no define una licencia. Agrega un archivo `LICENSE` (por ejemplo, MIT) si quieres que otros puedan reutilizarlo.
