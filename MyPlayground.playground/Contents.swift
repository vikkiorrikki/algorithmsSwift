import UIKit

var str = "Hello, playground"

let array = [1,3,6,7,9,2,4,5,12,88]

func quickSort<T: Comparable>(array: [T]) -> [T] {

    if array.count > 1 {
        var less = [T]()
        var equal = [T]()
        var greater = [T]()
        
        let pivot = array[array.count / 2]
        
        for elem in array {
            if elem < pivot {
                less.append(elem)
            } else if elem == pivot {
                equal.append(elem)
            } else {
                greater.append(elem)
            }
        }
        return quickSort(array: less) + equal + quickSort(array: greater)
    } else {
        return array
    }
}
quickSort(array: array)

func quickSort2<T: Comparable>(array: [T]) -> [T] {
    if array.count == 0 {
        return []
    }
    
    let pivot = array[array.count / 2]
    let subList = array.count > 1 ? array[1..<array.count] : []
    
    let smaller = subList.filter({ $0 <= pivot})
    let greater = subList.filter({ $0 > pivot})
    
    return quickSort2(array: smaller) + [pivot] + quickSort2(array: greater)
}

quickSort2(array: array)
