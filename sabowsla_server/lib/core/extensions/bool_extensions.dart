extension BoolExtensions on bool {
  Future<bool> toFuture() {
    return Future.delayed(Duration.zero, () => this);
  }
}
