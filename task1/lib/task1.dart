String longestCommonPerfix(List<String> mylist) {
  if (mylist.isEmpty) return 'List is empty';
  String prefix = mylist[0];
  for (var i = 1; i < mylist.length; i++) {
    while (mylist[i].indexOf(prefix) != 0) {
      prefix = prefix.substring(0, prefix.length - 1);
      if (prefix.isEmpty) return 'No longest Common prefix found';
    }
  }
  return prefix;
}

void main() {
  List<String> mylist = ['rana', 'rahma', 'ranem'];
  print(longestCommonPerfix(mylist));
  List<String> mylist2 = ['rana', 'rahma', 'hager'];
  print(longestCommonPerfix(mylist2));

  List<String> mylist3 = [];
  print(longestCommonPerfix(mylist3));
}
