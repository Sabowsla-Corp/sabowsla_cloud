class HomePageState {
  HomePageState({
    this.projectName = "Sabowsla Server",
    this.databasePath = "default",
  });

  final String projectName;
  final String databasePath;

  HomePageState copyWith({
    String? projectName,
    String? databasePath,
  }) {
    return HomePageState(
      projectName: projectName ?? this.projectName,
      databasePath: databasePath ?? this.databasePath,
    );
  }
}
