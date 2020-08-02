import UIKit

var array = [1,3,2,3,3]

func findUnsortedSubarray(array: [Int]) -> Int { // it works only if subarray is unsorted by decrease
    if array == array.sorted() {
        return array.count
    }
    
    var i = 1
    var resultSubarray = [Int]()
    
    while i < array.count {
        if array[i] > array[i - 1] {
            i += 1
        } else {
            if resultSubarray.isEmpty {
                resultSubarray.append(array[i - 1])
            }
            resultSubarray.append(array[i])
            i += 1
        }
    }
    
    print(resultSubarray)
    return resultSubarray.count
}

func findUnsortedSubarray2(array: [Int]) -> Int {
    if array == array.sorted() {
        return 0
    }
    
    var indexStart = 0
    var indexLast = array.count - 1
    var i = 0
    var resultArray = [Int]()
    
    while i < array.count / 2 {
        if array[indexStart] < array[indexStart + 1] {
            indexStart += 1
        }
        if array[indexLast] > array[indexLast - 1] {
            indexLast -= 1
        }
        i += 1
    }
    
    while indexStart <= indexLast {
        resultArray.append(array[indexStart])
        indexStart += 1
    }
    
    print(resultArray)
    return resultArray.count
}

findUnsortedSubarray(array: array)
findUnsortedSubarray2(array: array)
