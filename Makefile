
# https://dart.dev/tools/dart-fix
fix:
	dart fix --apply

get:
	fvm flutter clean
	fvm flutter pub get

gen:
	fvm flutter clean
	fvm flutter pub get
	fvm flutter pub run build_runner build --delete-conflicting-outputs
