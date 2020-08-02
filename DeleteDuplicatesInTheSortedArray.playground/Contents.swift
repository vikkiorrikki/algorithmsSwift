import UIKit

var array = [2, 2, 1, 3, 3, 4, 4, 2, 0 , 1, 3, 4, 3, 5, 6, 98, 2, 0 ,1, 98]
var array2 = [2, 2, 1, 3, 3, 4, 4, 2, 0 , 1, 3, 4, 3, 5, 6, 98, 2, 0 ,1]

func removeDuplicates(array: [Int]) -> Int {
    var dict = [Int : Int]()
    dict[array[0]] = 0
    
    for (i, valueArray) in array.sorted().enumerated() {
        for (_, value) in dict {
            if array.sorted()[i] != dict[value] {
                dict[valueArray] = i
            }
        }
    }
    print(dict)
    return dict.count
}

func removeDuplicates2(array: inout [Int]) -> Int {
    array.sort { $0 < $1 }
    let first = array[0]
    var i = 1
    
    while i <= array.count - 1 {
        if (array[i] == first) {
            array.remove(at: i)
        } else {
            if (array[i] == array[i - 1]) {
                array.remove(at: i)
            } else {
                i += 1
            }
        }
    }
    print(array)
    return array.count
}

func goodSolution(array: inout [Int]) -> Int {
    var last: Int?
    var i = 0
    
    array.sort { $0 < $1 }
    
    while i < array.count {
        if array[i] == last {
            array.remove(at: i)
        } else {
            last = array[i]
            i += 1
        }
    }
    
    print(array)
    return array.count
}

removeDuplicates(array: array)
removeDuplicates2(array: &array)
goodSolution(array: &array2)
