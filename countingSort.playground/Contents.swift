import UIKit

var str = "Hello, playground"

var list = [1, 2, 3, 4, 99, 82, 76, 123, 67, 1, 3]

func countingSort(array: [Int], maxValue: Int) -> [Int] {
    let size = array.count
    let sizeContainer = maxValue + 1
    
    var container = [Int](repeating: 0, count: sizeContainer)
    for i in array {
        container[i] += 1
    }
    
    var outer = [Int](repeating: 0, count: size)
    var j = 0
    for i in 0..<sizeContainer {
        for _ in 0..<container[i] {
            outer[j] = i
            j += 1
        }
    }
    
    return outer
}

countingSort(array: list, maxValue: 123)


func countingSort2(array: [Int], maxValue: Int) -> [Int] {
    let size = array.count
    
    var helperArray = [Int](repeating: 0, count: maxValue + 1)
    for i in array {
        helperArray[i] += 1
    }
    
    var outer = [Int](repeating: 0, count: size)
    var i = 0
    for j in 0..<helperArray.count {
        for k in 0..<helperArray[j] {
            outer[i] = j
            i += 1
        }
    }
    
    return outer
}

countingSort2(array: list, maxValue: 123)

func bubbleSort<T: Comparable>(array: inout [T]) -> [T] {
    let size = array.count
    
    for i in 0..<size {
        for j in 0..<size - 1 {
            if array[j] > array[j + 1] {
                array.swapAt(j, j + 1)
            }
        }
    }
    
    return array
}

bubbleSort(array: &list)

func binSearch(array: [Int], element: Int) -> Bool {
    var low = 0
    var high = array.count
    
    while low <= high {
        let half = low + (high - low) / 2
        if element < array[half] {
            high = half - 1
        } else if element > array[half] {
            low = half + 1
        } else {
            return true
        }
    }
    
    return false
}

binSearch(array: list, element: 83)

































