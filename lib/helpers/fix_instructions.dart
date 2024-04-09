List<String> fixInstruction(String instructions) {
  var data = instructions.replaceAll('\n', '\\n').split(r'\n');
  List<String> fixedData = [];
  for (var item in data) {
    var inst = item.trim();
    if (inst.isNotEmpty) {
      fixedData.add(inst);
    }
  }
  return fixedData;
}
