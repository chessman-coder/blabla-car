import 'package:blabla/data/dummy_data.dart';
import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/widgets/actions/bla_button.dart';
import 'package:blabla/ui/widgets/inputs/ride_prefs_input.dart';
import 'package:blabla/utils/date_time_utils.dart';
import 'package:flutter/material.dart';

class RidePrefsForm extends StatefulWidget {
  final RidePref? initRidePref;

  const RidePrefsForm({super.key, this.initRidePref});

  @override
  State<RidePrefsForm> createState() => _RidePrefsFormState();
}

class _RidePrefsFormState extends State<RidePrefsForm> {
  Location? departure;
  late DateTime departrueDate;
  Location? arrival;
  late int requestedSeats;

  @override
  void initState() {
    super.initState();
    if (widget.initRidePref != null) {
      departure = widget.initRidePref!.departure;
      departrueDate = widget.initRidePref!.departureDate;
      arrival = widget.initRidePref!.arrival;
      requestedSeats = widget.initRidePref!.requestedSeats;
    } else {
      departure = null;
      departrueDate = DateTime.now();
      arrival = null;
      requestedSeats = 1;
    }
  }

  void onPressed() {}

  Future<void> _pickLocation(bool isDeparture) async {
    final picked = await showDialog<Location>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isDeparture ? 'From' : 'To'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: fakeLocations.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(fakeLocations[index].name),
              onTap: () => Navigator.pop(context, fakeLocations[index]),
            ),
          ),
        ),
      ),
    );
    if (picked != null) {
      setState(() {
        if (isDeparture) {
          departure = picked;
        } else {
          arrival = picked;
        }
      });
    }
  }

  void _swapLocation() {
    setState(() {
      final temp = departure;
      departure = arrival;
      arrival = temp;
    });
  }

  String get departureLabel =>
      departure != null ? departure!.name : "Leaving From";
  String get arriveLabel => arrival != null ? arrival!.name : "Going To";
  String get dateLabe => DateTimeUtils.formatDateTime(departrueDate);
  String get numberSeats => requestedSeats.toString();
  bool get switchIconVisible => arrival != null && departure != null;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RidePrefsInput(
          leftIcon: Icons.location_on,
          title: departureLabel,
          rightIcon: switchIconVisible ? Icons.swap_vert : null,
          rightIconPressed: switchIconVisible ? _swapLocation : null,
          onPressed: () => _pickLocation(true),
        ),
        RidePrefsInput(
          leftIcon: Icons.location_on,
          title: arriveLabel,
          onPressed: () => _pickLocation(false),
        ),
        RidePrefsInput(
          leftIcon: Icons.calendar_month,
          title: dateLabe,
          onPressed: onPressed,
        ),
        RidePrefsInput(
          leftIcon: Icons.person_2_outlined,
          title: numberSeats,
          onPressed: onPressed,
        ),
        BlaButton(icon: Icons.search, text: "Search",)
      ],
    );
  }
}
