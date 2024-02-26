![Sabowsla](https://raw.githubusercontent.com/sabowsla/sabowsla-flutter/main/.github/images/sabowsla-banner.jpg)

# `Sabowsla Flutter`

Flutter Client library for [Sabowsla](https://sabowsla.com/).

- Documentation: https://sabowsla.com/docs/reference/dart/introduction

## Run locally

This repo is a monorepo powered by [Melos](https://melos.invertase.dev/) containing [sabowsla_flutter](https://github.com/sabowsla/sabowsla-flutter/tree/main/packages/sabowsla_flutter) and its sub-libraries. All packages are located in the `packages` directory.

To install on a locally developed app:

- Clone this repo
- Install Melos globally if you haven't already: `dart pub global activate melos`
- Run `melos bootstrap` or `melos bs` at the root of the cloned directory to install dependencies
- Add the target package to your `pubspec.yaml` file specifying the path.
  ```yaml
  sabowsla_flutter:
    path: <your-path-to-the-local-sabowsla-flutter-repo>/packages/sabowsla_flutter
  ```

## Contributing

- Fork the repo on [GitHub](https://github.com/sabowsla/sabowsla-flutter)
- Clone the project to your own machine
- Commit changes to your own branch
- Push your work back up to your fork
- Submit a Pull request so that we can review your changes and merge

## License

This repo is licenced under MIT.

## Resources

- [Quickstart: Flutter](https://sabowsla.com/docs/guides/with-flutter)
- [Flutter Tutorial: building a Flutter chat app](https://sabowsla.com/blog/flutter-tutorial-building-a-chat-app)
- [Flutter Tutorial - Part 2: Authentication and Authorization with RLS](https://sabowsla.com/blog/flutter-authentication-and-authorization-with-rls)
