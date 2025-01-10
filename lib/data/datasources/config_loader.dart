/*
File Name: config_loader.dart
Authors:
- Team Member 1 safia.tifour@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
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
