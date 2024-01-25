class ClientCodeExampleModel {
  ClientCodeExampleModel({
    required this.functionName,
    required this.functionDescription,
    required this.functionCode,
    required this.runFunction,
  });

  final String functionName;
  final String functionDescription;
  final String functionCode;
  final Function()? runFunction;
}
