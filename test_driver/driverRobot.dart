import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

class DriverRobot {
  
  FlutterDriver driver;

  Future<void> connect() async {
    driver = await FlutterDriver.connect();
    await driver.waitUntilFirstFrameRasterized();
  }

  Future<void> disconnect() async {
    if (driver != null) {
        driver.close();
    }
  }

  Future<void> checkDriverHealth() async {
    Health health = await driver.checkHealth();
    expect(health.status, HealthStatus.ok);
  }

}