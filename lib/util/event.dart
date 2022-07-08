
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

EventBus eventBus =  EventBus();
class SelectedTabBarEvent{
  int currentIndex;
  SelectedTabBarEvent(this.currentIndex);

}