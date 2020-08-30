import UIKit

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

func reverseSolution2 (str1: String, str2: String) -> Bool {
    var str1Array = str1.map { (x) -> String in
        return String(x)
    }
    reverseString(array: &str1Array)
    
    let str2Array = str2.map { String($0) }
    
    var i = 0
    while i < str1.count {
        if str1Array[i] == str2Array[i] {
            i += 1
        } else {
            return false
        }
    }
    return true
}

func anagramSolution(str1: String, str2: String) -> Bool {
    var arr1 = Array(str1)
    var arr2 = Array(str2)
    
    arr1.sort(by: {$0 < $1})
    arr2.sort(by: {$0 < $1})
    
    var position = 0
    
    while position < arr1.count {
        if arr1[position] == arr2[position] {
            position += 1
        } else {
            return false
        }
    }
    
    return true
}

reverseSolution2(str1: "hello ", str2: "olleh")
anagramSolution(str1: "abc ", str2: "bac ")
