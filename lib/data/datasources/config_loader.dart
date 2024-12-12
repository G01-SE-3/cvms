import 'dart:io';
import 'package:yaml/yaml.dart';

class ConfigLoader {
  Future<Map<String, dynamic>> loadConfig() async {
    final file = File('config.yaml');
    final yamlString = await file.readAsString();
    final yamlMap = loadYaml(yamlString);

    return Map<String, dynamic>.from(yamlMap);
  }
}
