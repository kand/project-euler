var testPalindromicity = function (num) {
  var strNum = '' + num;
  for (var i = 0; i <= strNum.length / 2; i++) {
    if (strNum[i] !== strNum[strNum.length - i - 1]) {
      return false;
    }
  }
  return true;
};

module.exports = {
  solve: function () {
    var largest = 0;
    for (var i = 100; i <= 999; i++) {
      for (var j = 100; j <= 999; j++) {
        var product = i * j;
        if (product > largest && testPalindromicity(product)) {
          largest = product;
        }
      }
    }
    return largest;
  }
};
