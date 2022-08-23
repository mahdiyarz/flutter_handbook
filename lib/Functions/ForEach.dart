//! Iterate through entire elements in the list.

//* Use it when you need to scan all the elements and certain action over individual elements.

List<String> smartPhoneBrands = ['iphone', 'sony', 'oneplus'];

void main() {
  smartPhoneBrands.forEach((element) {
    print(element);
  });
}
