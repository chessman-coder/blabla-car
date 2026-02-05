import 'package:blabla/model/ride/locations.dart';

import '../data/dummy_data.dart';
import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService {
  static List<Ride> allRides = fakeRides;

  // TODO Create a static method to filter rides by departure location
  static List<Ride> filterByDeparture(Location departure) {
    return [];
  }

  // TODO Create a static method to filter rides by number of requested seat
  static List<Ride> filterBySeatRequested(Location departure) {
    return [];
  }

  // TODO Create a static method to filter : optional departure location, optional requested seat
  static List<Ride> filterBy({Location? departure, int? seatRequested}) {
    return [];
  }
}
