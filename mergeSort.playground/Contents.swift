import UIKit

var str = "Hello, playground"

var list = [1,3,6,7,9,2,4,5,12,88]

func merge<T: Comparable>(array1: [T], array2: [T]) -> [T] {
    if array1.count == 0 {
        return array2
    } else if array2.count == 0 {
        return array1
    } else {
        if array1[0] < array2[0] {
            return [array1[0]] + merge(array1: Array(array1[1..<array1.count]), array2: array2)
        } else {
            return [array2[0]] + merge(array1: array1, array2: Array(array2[1..<array2.count]))
        }
    }
}

func mergeSort<T: Comparable>(list: [T]) -> [T] {
    if list.count < 2 {
        return list
    } else {
        let half = Int(list.count / 2)
        return merge(array1: mergeSort(list: Array(list[0..<half])), array2: mergeSort(list: Array(list[half..<list.count])))
    }
}

mergeSort(list: list)
