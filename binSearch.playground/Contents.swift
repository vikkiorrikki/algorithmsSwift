import UIKit

var str = "Hello, playground"

var array = [1, 4, 11, 123, 5, 6, 6, 23, 0, 9, 4556, 54]

func search(array: [Int], element: Int) -> Bool {
    
    for i in 0..<array.count {
        if array[i] == element {
            return true
        }
    }
    
    return false
}

search(array: array, element: 62)

func binSearch(array: [Int], element: Int) -> Bool {
    var low = 0
    var high = array.count - 1
    
    let sortedArray = array.sorted(by: {$0 < $1})
    
    while low <= high {
        let half = low + (high - low) / 2
        
        if sortedArray[half] > element {
            high = half - 1
        } else if sortedArray[half] < element {
            low = half + 1
        } else {
            return true
        }
    }
    return false
}
binSearch(array: array, element: 0)



var arr = [1, 2 , 3, 4, 5, 99]
func binSearch2(array: [Int], element: Int) -> Int? {
    let sortedArray = array.sorted(by: {$0 < $1})
    
    var low = 0
    var high = sortedArray.count - 1
    
    while low <= high {
        let half = low + (high - low) / 2
        
        if element < sortedArray[half] {
            high = half - 1
        } else if element > sortedArray[half] {
            low = half + 1
        } else {
            return half
        }
    }
    
    return nil
}

binSearch2(array: arr, element: 5)























