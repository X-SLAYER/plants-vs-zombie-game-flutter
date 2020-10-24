import 'dart:math';

final _random = new Random();

double nexRandom(double min, double max) => min + _random.nextDouble() * max;
