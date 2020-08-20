
import 'package:flutter/cupertino.dart';
import 'package:gallerywidget/template/cafedeliveryapp.dart';
import 'package:gallerywidget/template/doctorappointmentapp.dart';
import 'package:gallerywidget/template/furnitureapp.dart';
import 'package:gallerywidget/template/homeTrackPackage.dart';
import 'package:gallerywidget/template/hotelappui.dart';
import 'package:gallerywidget/template/hotelbooking.dart';
import 'package:gallerywidget/template/icecreamapp.dart';
import 'package:gallerywidget/template/passHub.dart';
import 'package:gallerywidget/template/signupuipage.dart';

class Template {
  String name;
  String imageUrl;
  Widget child;
  Template({this.name, this.imageUrl, this.child});
}

List<Template> templateItem = [
  Template(
      name: "Delivery & Tracking App",
      imageUrl:
      "https://cdn.dribbble.com/users/1819010/screenshots/12504809/media/5166e25ec1ceb228f2a160d11a013391.png",
      child: HomeTrackPackageTemplate()),
  Template(
      name: "PassHub",
      imageUrl:
      "https://cdn.dribbble.com/users/1080850/screenshots/12294649/media/73a28e05b2aff5ca6623ea5325f14d8f.png",
      child: PassHubTemplate()),
  Template(
      name: "Hotel Booking App",
      imageUrl:
      "https://cdn.dribbble.com/users/4107199/screenshots/13920074/media/5c8bcd7b49f4cdd4a395dd0084443a79.jpg",
      child: HotelBookingAppScreen()),
  Template(
    name: "Furniture app",
    imageUrl:
    "https://cdn.dribbble.com/users/2622747/screenshots/13919175/media/69783999fea7d6cc21ab46ee4c867f55.png",
    child: FurnitureAppScreen(),
  ),
  Template(
    name: "Ice cream App",
    imageUrl:
    "https://static.dribbble.com/users/2067291/screenshots/7523165/media/fc06773e6ce9723612d8f3ecaffbf82f.png",
    child: IceCreamUIApp(),
  ),
  Template(
    name: "Hotel App UI",
    imageUrl:
    "https://cdn.dribbble.com/users/2376202/screenshots/13911328/media/46b80ee4939d7219508b9a2fe8c8e015.jpg",
    child: HotelAppUIScreen(),
  ),
  Template(
    name: "Sign-Up Page",
    imageUrl:
    "https://cdn.dribbble.com/users/5290783/screenshots/13915608/media/9f00ea47489c0fe813172098d80f06c9.png",
    child: SignupPageScreen(),
  ),
  Template(
    name: "Cafe Delivery Application",
    imageUrl:
    "https://cdn.dribbble.com/users/3411685/screenshots/13917129/media/25bb5fce214cf65ddcfada589ccdfc17.png",
    child: CafeDeliveryAppScreen(),
  ),
  Template(
    name: "Doctor Appointment App",
    imageUrl:
    "https://cdn.dribbble.com/users/632944/screenshots/13902516/media/71be38f8336d3a1724b66bc5bcdf4bc4.png",
    child: DoctorAppointmentAppScreen(),
  ),
  Template(
    name: "CompApp Design Concept",
    imageUrl:
    "https://cdn.dribbble.com/users/3890054/screenshots/13915372/media/65328aa25ee0e0bc07103a9d411d6d1d.png",
    child: null,
  ),
  Template(
    name: "Ride screen - Pause & Resume options",
    imageUrl:
    "https://cdn.dribbble.com/users/630648/screenshots/13909238/media/7d9c8849e9d29dcfa18708a10d6f2cd3.jpg",
    child: null,
  ),
  Template(
    name: "Yoga App",
    imageUrl:
    "https://cdn.dribbble.com/users/2464119/screenshots/13906755/media/62b8c4ca600bbbc5beda4af56ee1fb22.jpg",
    child: null,
  ),
  Template(
    name: "Sending a parcel with AR",
    imageUrl:
    "https://cdn.dribbble.com/users/238114/screenshots/13907256/media/9c250452a46635c91d7443707aca4d38.png",
    child: null,
  ),
  Template(
    name: "Aggregatio App",
    imageUrl:
    "https://cdn.dribbble.com/users/3968176/screenshots/13909224/media/8a5b9ca0f586ad0ffd0d5cc0283473c2.png",
    child: null,
  ),
  Template(
    name: "Designers Platform App",
    imageUrl:
    "https://cdn.dribbble.com/users/5107350/screenshots/13906871/media/f9f6aaf6f71bdc1bd19e878a2dec95ee.png",
    child: null,
  ),

];