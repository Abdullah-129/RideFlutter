import 'package:client_shared/config.dart';

String serverUrl = "http://$serverIP:4002/";
String wsUrl = serverUrl.replaceFirst("http", "ws");
