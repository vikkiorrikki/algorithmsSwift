import UIKit

var array = ["g", "o", "a", "t", "1"]

func reverseString(array: inout [String]) {
    var temp = ""
    var firstIndex = 0
    var lastIndex = array.count - 1
    
    while firstIndex < array.count / 2 {
        temp = array[firstIndex]
        array[firstIndex] = array[lastIndex]
        array[lastIndex] = temp
//        (array[firstIndex], array[lastIndex]) = (array[lastIndex], array[firstIndex]) this can be used, if we don't want to use var temp
        
        firstIndex += 1
        lastIndex -= 1
    }
    
    print(array)
}

reverseString(array: &array)
