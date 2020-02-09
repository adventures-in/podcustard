# podcustard

Enjoy your podcasts right here.

## Parsing RSS Feeds 

Using `rss_dart` package to parse RSS into built_value objects.

- https://github.com/nickmeinhold/rss_dart 


## Redux RemoteDevTools (RDT) 

- find the IP address of the computer 
- use one of the strings in `utilities/mock.dart` or make a new one 
- edit `main.dart` to use the correct IP 
- run the remotedev server

```
remotedev --port 8000
```

- open a web page with url:

```
http://localhost:8000/
```

## Code gen with built_value 

After making changes to built_value classes run the builder to generate the new code:

```
flutter pub run build_runner build
```

## Tests 

### Unit and Widget Tests 

```
flutter test
```

### Integration Tests 

To start the driver run:

```
flutter drive --target=test_driver/app.dart
```

If the automatically selected device is not the one you want, run: 

```
flutter devices
```

and copy the relevant ID and then run:

```
flutter drive --target=test_driver/app.dart -d <device_id>
```
