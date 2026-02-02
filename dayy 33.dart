enum LightColor {
  red,
  yellow,
  green
}

class TrafficSensor {
  int carsWaiting;

  TrafficSensor(this.carsWaiting);
}

class TrafficLight {
  LightColor _color = LightColor.red;

  LightColor get color => _color;

  void setGreen() {
    _color = LightColor.green;
  }

  void setYellow() {
    _color = LightColor.yellow;
  }

  void setRed() {
    _color = LightColor.red;
  }
}

class TrafficController {
  final TrafficLight light;
  final TrafficSensor sensor;

  TrafficController(this.light, this.sensor);

  void update() {
    if (sensor.carsWaiting > 10) {
      light.setGreen();
    } else if (sensor.carsWaiting > 3) {
      light.setYellow();
    } else {
      light.setRed();
    }
  }

  void printStatus() {
    print("Cars: ${sensor.carsWaiting}, Light: ${light.color}");
  }
}

void main() {
  TrafficSensor sensor = TrafficSensor(7);
  TrafficLight light = TrafficLight();

  TrafficController controller = TrafficController(light, sensor);

  controller.update();
  controller.printStatus();
}