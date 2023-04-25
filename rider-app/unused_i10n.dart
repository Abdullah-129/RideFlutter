import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';

const lineNumber = 'line-number';

void main(List<String> arguments) {
  exitCode = 0; // presume success
  final parser = ArgParser()
    ..addFlag(
      'path',
      negatable: false,
      abbr: 'p',
      help: 'Path to the Flutter/Dart project',
    );

  ArgResults argResults = parser.parse(arguments);
  final paths = argResults.rest;
  final terms = getTranslationTerms(paths.first);
  final dartFiles = getDartFiles(paths.first);
  final notUsed = findNotUsedArbTerms(terms, dartFiles);
  for (final t in notUsed) {
    print(t);
  }
}

Set<String> getTranslationTerms(String path) {
  final arbFile = Glob("$path/**.arb");
  final arbFiles = <FileSystemEntity>[];
  for (var entity in arbFile.listSync(followLinks: false)) {
    arbFiles.add(entity);
  }

  final arbTerms = <String>{};

  for (final file in arbFiles) {
    final content = File(file.path).readAsStringSync();
    final map = jsonDecode(content) as Map<String, dynamic>;
    for (final entry in map.entries) {
      if (!entry.key.startsWith('@')) {
        arbTerms.add(entry.key);
      }
    }
  }
  return arbTerms;
}

List<FileSystemEntity> getDartFiles(String path) {
  final dartFile = Glob("$path/lib/**.dart");
  final dartFiles = <FileSystemEntity>[];
  for (var entity in dartFile.listSync(followLinks: false)) {
    if (!entity.path.contains('generated')) {
      dartFiles.add(entity);
    }
  }

  return dartFiles;
}

Set<String> findNotUsedArbTerms(
  Set<String> arbTerms,
  List<FileSystemEntity> files,
) {
  final unused = arbTerms.toSet();
  for (final file in files) {
    final content = File(file.path).readAsStringSync();
    for (final arb in arbTerms) {
      if (content.contains(arb)) {
        unused.remove(arb);
      }
    }
  }
  return unused;
}
