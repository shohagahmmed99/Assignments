void main() {
  Set<int> A = {1, 2, 3, 4, 5};
  Set<int> B = {4, 5, 6, 7, 8};
  var NewAB = A.toList() + B.toList();
  for (var item in NewAB) {
    print(item);
  }
  //or you can consider this solution also
  print('Another Solution');
  print("--------------------------------------");
  var NewSet = A.union(B);
  for (var item in NewSet) {
    print(item);
  }
}
