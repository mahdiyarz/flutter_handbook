//! Sorts the elements in the list

//? Use it to with combination of reversed() method to filter data in the list.

List<int> nums = [6, 1, 4];

List<String> number = ['one', 'two'];

void main() {
  nums.sort();
  number.sort(((a, b) => a.length.compareTo(b.length)));
}
