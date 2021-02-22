int x = 10;
List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
//use map in array
List<String> stringsNums = numbers.map((number) {
  return 'values= ${number}';
}).toList();
