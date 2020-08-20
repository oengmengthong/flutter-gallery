import "package:flutter/material.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample1.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample10.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample11.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample12.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample13.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample14.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample15.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample16.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample17.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample18.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample19.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample2.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample20.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample21.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample22.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample23.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample24.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample25.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample26.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample27.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample28.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample29.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample3.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample30.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample31.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample32.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample33.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample34.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample35.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample36.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample37.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample38.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample39.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample4.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample5.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample6.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample7.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample8.dart";
import "package:gallerywidget/widget_catalog/bottom_navigation_bar/sample9.dart";

class BottomNavigationDataList {
  String title;
  Widget child;

  BottomNavigationDataList({this.title, this.child});
}

List<BottomNavigationDataList> dataBottomBars = [
  BottomNavigationDataList(
      title: 'animated_bottom_navigation_bar',
      child: SampleBottomNavigationBar1()),
  BottomNavigationDataList(
      title: 'floating_bottom_navigation_bar',
      child: SampleBottomNavigationBar2()),
  BottomNavigationDataList(
      title: "fancy_bottom_navigation", child: SampleBottomNavigationBar3()),
  BottomNavigationDataList(
      title: "scroll_bottom_navigation_bar",
      child: SampleBottomNavigationBar4()),
  BottomNavigationDataList(
      title: "circular_bottom_navigation", child: SampleBottomNavigationBar5()),
  BottomNavigationDataList(
      title: "neos_bottom_navigation", child: SampleBottomNavigationBar6()),
  BottomNavigationDataList(
      title: "custom_bottom_navigation_bar",
      child: SampleBottomNavigationBar7()),
  BottomNavigationDataList(
      title: "circle_bottom_navigation", child: SampleBottomNavigationBar8()),
  BottomNavigationDataList(
      title: "bottom_navy_bar", child: SampleBottomNavigationBar9()),
  BottomNavigationDataList(
      title: "ff_navigation_bar", child: SampleBottomNavigationBar10()),
  BottomNavigationDataList(
      title: "expanding_bottom_bar", child: SampleBottomNavigationBar11()),
  BottomNavigationDataList(
      title: "titled_navigation_bar", child: SampleBottomNavigationBar12()),
  BottomNavigationDataList(
      title: "salomon_bottom_bar", child: SampleBottomNavigationBar13()),
  BottomNavigationDataList(
      title: "cuberto_bottom_bar", child: SampleBottomNavigationBar14()),
  BottomNavigationDataList(
      title: "spincircle_bottom_bar", child: SampleBottomNavigationBar15()),
  BottomNavigationDataList(
      title: "lamp_bottom_navigation", child: SampleBottomNavigationBar16()),
  BottomNavigationDataList(
      title: "fluid_bottom_nav_bar", child: SampleBottomNavigationBar17()),
  BottomNavigationDataList(
      title: "bottom_personalized_dot_bar",
      child: SampleBottomNavigationBar18()),
  BottomNavigationDataList(
      title: "rondy_bottom_navigation_bar",
      child: SampleBottomNavigationBar19()),
  BottomNavigationDataList(
      title: "bottom_navigation_dot", child: SampleBottomNavigationBar20()),
  BottomNavigationDataList(
      title: "jumping_bottom_nav_bar", child: SampleBottomNavigationBar21()),
  BottomNavigationDataList(
      title: "sphere_bottom_navigation_bar",
      child: SampleBottomNavigationBar22()),
  BottomNavigationDataList(
      title: "flutter_snake_navigationbar",
      child: SampleBottomNavigationBar23()),
  BottomNavigationDataList(
      title: "google_nav_bar", child: SampleBottomNavigationBar24()),
  BottomNavigationDataList(
      title: "bottom_animation", child: SampleBottomNavigationBar25()),
  BottomNavigationDataList(
      title: "motion_tab_bar", child: SampleBottomNavigationBar26()),
  BottomNavigationDataList(
      title: "bottom_nav", child: SampleBottomNavigationBar27()),
  BottomNavigationDataList(
      title: "ace_bottom_navigation_bar", child: SampleBottomNavigationBar28()),
  BottomNavigationDataList(
      title: "pandabar", child: SampleBottomNavigationBar29()),
  BottomNavigationDataList(
      title: "flip_box_bar_plus", child: SampleBottomNavigationBar30()),
  BottomNavigationDataList(
      title: "navigation_dot_bar", child: SampleBottomNavigationBar31()),
  BottomNavigationDataList(
      title: "rolling_nav_bar", child: SampleBottomNavigationBar32()),
  BottomNavigationDataList(
      title: "convex_bottom_bar", child: SampleBottomNavigationBar33()),
  BottomNavigationDataList(
      title: "custom_navigation_bar", child: SampleBottomNavigationBar34()),
  BottomNavigationDataList(
      title: "fancy_bottom_bar", child: SampleBottomNavigationBar35()),
  BottomNavigationDataList(
      title: "circle_bottombar", child: SampleBottomNavigationBar36()),
  BottomNavigationDataList(
      title: "ss_bottom_navbar", child: SampleBottomNavigationBar37()),
  BottomNavigationDataList(
      title: "curve_dnavigation_bar", child: SampleBottomNavigationBar38()),
  BottomNavigationDataList(
      title: "fancy_bar", child: SampleBottomNavigationBar39()),
];
