void main () {
  double dikdortgenAlani(double uzunKenar, double kisaKenar) {
    return uzunKenar * kisaKenar;
  }

  void main () {
    double uzunKenar = 4.76;
    double kisaKenar = 9.54;
    print('Dikdörtgen Alanı: ${dikdortgenAlani(uzunKenar, kisaKenar)}');
  }
}
int carp(int a, int b) {
  int multiplyByTwo(int x) {
    return x * 2;
  }

  int result = a;
  for (int i = 0; i < b - 1; i++) {
    result = multiplyByTwo(result);
  }
  return result;
}

void main () {
  int a = 5;
  int b = 3;
  print("Sonuç: ${carp(a, b)}");

}
class Shape {
  String name;

  Shape(this.name);
}

void main () {
  Shape shape1 = Shape("Daıre");
  Shape shape2 = Shape("Kare");
  Shape shape3 = Shape("Dikdörtgen");
  Shape shape4 = Shape("Üçgen");
  Shape shape5 = Shape("Yamuk");

  List<Shape> shapes = [shape1, shape2, shape3, shape4, shape5];

  for (var shape in shapes) {
    print("Şekil: ${shape.name}");
  }
}