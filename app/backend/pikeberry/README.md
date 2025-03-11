A server app built using [Shelf](https://pub.dev/packages/shelf),
configured to enable running with [Docker](https://www.docker.com/).

This sample code handles HTTP GET requests to `/` and `/echo/<message>`

# Running the sample

## Running with the Dart SDK

You can run the example with the [Dart SDK](https://dart.dev/get-dart)
like this:

```
$ dart run bin/server.dart
Server listening on port 8080
```

And then from a second terminal:
```
$ curl http://0.0.0.0:8080
Hello, World!
$ curl http://0.0.0.0:8080/echo/I_love_Dart
I_love_Dart
```

## Running with Docker

If you have [Docker Desktop](https://www.docker.com/get-started) installed, you
can build and run with the `docker` command:

```
$ docker build . -t myserver
$ docker run -it -p 8080:8080 myserver
Server listening on port 8080
```

And then from a second terminal:
```
$ curl http://0.0.0.0:8080
Hello, World!
$ curl http://0.0.0.0:8080/echo/I_love_Dart
I_love_Dart
```

You should see the logging printed in the first terminal:
```
2021-05-06T15:47:04.620417  0:00:00.000158 GET     [200] /
2021-05-06T15:47:08.392928  0:00:00.001216 GET     [200] /echo/I_love_Dart
```

## Generate protocol
### Dart
Dart plugin for the protocol compiler:

1. Install the protocol compiler plugin for Dart (protoc-gen-dart) using the following command:

```bash
dart pub global activate protoc_plugin
```

2. Update your PATH so that the protoc compiler can find the plugin:

```bash
export PATH="$PATH:$HOME/.pub-cache/bin"
```

3. Install Protobuf compiller
https://protobuf.dev/installation/

4. Generate protocol
```bash
protoc --dart_out=grpc:app/backend/pikeberry/lib/generated --proto_path=app/backend/pikeberry_proto gpio.proto
```