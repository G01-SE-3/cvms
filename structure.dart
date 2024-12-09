import 'dart:io';

void main() {
  // Define the project name
  const projectName = 'cvms';

  // Define the directory structure
  final directories = [
    '$projectName/lib/core/constants',
    '$projectName/lib/core/exceptions',
    '$projectName/lib/core/utils',
    '$projectName/lib/data/models',
    '$projectName/lib/data/services',
    '$projectName/lib/domain/use_cases',
    '$projectName/lib/domain/repositories',
    '$projectName/lib/presentation/screens',
    '$projectName/lib/presentation/widgets',
    '$projectName/lib/presentation/themes',
    '$projectName/lib/controllers',
    '$projectName/lib/routes',
    '$projectName/assets',
    '$projectName/test',
  ];

  // Define the files to create
  final files = [
    '$projectName/lib/main.dart',
    '$projectName/pubspec.yaml',
    '$projectName/analysis_options.yaml',
    '$projectName/README.md',
  ];

  // Create directories
  for (var dir in directories) {
    final directory = Directory(dir);
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
      print('Created directory: $dir');
    }
  }

  // Create files
  for (var filePath in files) {
    final file = File(filePath);
    if (!file.existsSync()) {
      file.createSync(recursive: true);
      print('Created file: $filePath');
    }
  }

  print('\nFlutter MVC project structure created successfully!');
}
