import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_mao/constants.dart';
import 'package:google_mao/menu.dart';
import 'package:google_mao/user.dart';

void restmap() => runApp(const NearbyRestaurant());

class Restaurant {
  final String name;
  final LatLng location;

  Restaurant(this.name, this.location);
}

class NearbyRestaurant extends StatefulWidget {
  const NearbyRestaurant({Key? key}) : super(key: key);

  @override
  State<NearbyRestaurant> createState() => RestaurantTrackingPageState();
}

class RestaurantTrackingPageState extends State<NearbyRestaurant> {
  final Completer<GoogleMapController> _controller = Completer();

  late Position _currentPosition = Position(
    latitude: 37.33500926,
    longitude: -122.03272188,
    altitude: 0,
    accuracy: 0,
    heading: 0,
    speed: 0,
    speedAccuracy: 0,
    timestamp: DateTime.now(),
  );
  LatLng? _userLocation;
  LatLng destination = const LatLng(37.33429383, -122.06600055);
  late GoogleMapController _mapController;
  Set<Marker> selectedMarker = {};
  Set<Marker> markers = {};
  List<LatLng> polylineCoordinates = [];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    // Request location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    _currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _userLocation = LatLng(_currentPosition.latitude, _currentPosition.longitude);
      _focusOnMap(_userLocation!);
    });    
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  void _focusOnMap(LatLng restaurantLocation) {
    final cameraPosition = CameraPosition(target: restaurantLocation, zoom: 16);
    _mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  List<LatLng> nearbyRestaurantLocations = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MediaQuery(
        data: const MediaQueryData(),
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: const Color.fromARGB(224, 244, 67, 54),
          //   title: const Text(
          //     "Restaurants",
          //     style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          //   ),
          // ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              // ignore: unnecessary_null_comparison
              initialCameraPosition: _userLocation != null
                  ? CameraPosition(target: _userLocation!, zoom: 16)
                  : const CameraPosition(
                      target: LatLng(0, 0),
                    ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                _mapController = controller;
              },
              mapToolbarEnabled: true,
              zoomControlsEnabled: true,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              compassEnabled: true,
              markers: {...selectedMarker, ...markers},
              polylines: {
                Polyline(polylineId: const PolylineId("route"),
                points: polylineCoordinates,
                color: primaryColor,
                width: 7
                ),
              },
            ),
          ),
          Container(
            color: const Color.fromARGB(224, 244, 67, 54),
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 10, 8, 6),
                  child: Text(
                    "Restaurants Near Me",
                    style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            // ignore: unnecessary_null_comparison
            child: _currentPosition != null
            ? FutureBuilder<List<Restaurant>>(
                future: _getNearbyRestaurants(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Error fetching nearby restaurants',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    );
                  } else {
                    final nearbyRestaurants = snapshot.data;
                    if (nearbyRestaurants!.isEmpty) {
                      return const Center(
                        child: Text('No nearby restaurants',
                        style: TextStyle(color: Colors.white, fontSize: 16),),
                      );
                    } else {
                      nearbyRestaurantLocations = nearbyRestaurants.map((restaurant) => restaurant.location).toList();
                      return Container(
                        color: const Color.fromARGB(224, 244, 67, 54),
                        child: ListView.builder(
                          itemCount: nearbyRestaurants.length,
                          itemBuilder: (context, index) {
                            final restaurant = nearbyRestaurants[index];
                            return Container(
                              margin: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: ListTile(
                                title: Text(
                                  restaurant.name,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 42,
                                      height: 42,
                                      decoration: const BoxDecoration(
                                        color: Color.fromARGB(224, 244, 67, 54),
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.remove_red_eye,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          _onRestaurantLocTap(index);
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 10), // Add spacing between the icons
                                    Container(
                                      width: 42,
                                      height: 42,
                                      decoration: const BoxDecoration(
                                        color: Color.fromARGB(224, 244, 67, 54),
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.location_pin,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          _onRestaurantTrackTap(index);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const MenuPage()),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      );
                    }
                  }
                },
              )
              : const SizedBox(height: 200),
            ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Restaurants button tap
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size.fromHeight(48)),
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(223, 134, 36, 29),),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0), // Remove rounded borders
                      ),
                    ),
                  ),
                  child: const Icon(
                    Icons.local_restaurant,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    userProfile(); // Handle User button tap
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size.fromHeight(48)),
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(224, 244, 67, 54),),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0), // Remove rounded borders
                      ),
                    ),
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          ],
        ),
      )));
    }

  Future<List<Restaurant>> _getNearbyRestaurants() async {
    const apiKey = google_api_key;

    // final position = await Geolocator.getCurrentPosition(
    //   desiredAccuracy: LocationAccuracy.high,
    // );

    final latitude = _currentPosition.latitude;
    final longitude = _currentPosition.longitude;
    const radius = 1000; // Radius in meters
    const types = 'restaurant|cafe'; // bar|lodging'; // Specify the types here
    const rankBy = 'prominence'; 

    final url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=$radius&types=$types&rankby=$rankBy&key=$apiKey';
    
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'] as List<dynamic>;

      final nearbyRestaurants = results.map((result) {
        final name = result['name'] as String;
        final geometry = result['geometry'];
        final location = geometry['location'];
        final lat = location['lat'] as double;
        final lng = location['lng'] as double;

        return Restaurant(name, LatLng(lat, lng));
      }).toList();

      return nearbyRestaurants;
    } else {
      throw Exception('Failed to fetch nearby restaurants');
    }
  }

  void _onRestaurantLocTap(int index) {
    final LatLng restaurantLocation = nearbyRestaurantLocations[index];

    // Check if the marker is within the visible region
    _controller.future.then((controller) {
      controller.getVisibleRegion().then((visibleRegion) {
        if (visibleRegion.contains(restaurantLocation)) {
          // Marker is already visible on the map
        } else {
          // Marker is not visible on the map, animate the camera to focus on the marker
          final LatLngBounds bounds = LatLngBounds(
            southwest: LatLng(
              restaurantLocation.latitude,
              restaurantLocation.longitude,
            ),
            northeast: LatLng(
              restaurantLocation.latitude,
              restaurantLocation.longitude,
            ),
          );

          final CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 100);
          controller.animateCamera(cameraUpdate);
        }
      });
    });
  }

  void _onRestaurantTrackTap(int index) {

    final LatLng restaurantLocation = nearbyRestaurantLocations[index];

    setState(() {
      destination = restaurantLocation;
      selectedMarker = {
        Marker(
          markerId: MarkerId('restaurant_$index'),
          position: restaurantLocation,
        )
      };
      polylineCoordinates.clear();
      getPolyPoints();
    });
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key, 
      PointLatLng(_currentPosition.latitude, _currentPosition.longitude), 
      PointLatLng(destination.latitude, destination.longitude)
    );

    

    if(result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude)
        );
      }
      setState(() {
        final cameraPosition = CameraPosition(target: _userLocation!, zoom: 15);
        _mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      });
    }
  }

}


