import UIKit

var str = "Hello, playground"

var array = [1, 4, 10, 999, 2, 45, 32, 44, 433, 4, 0]

func bubbleSort<T: Comparable>( array: inout [T]) -> [T] {
    let size = array.count
    
    for i in 0..<size {
        let pass = (size - 1) - i
        
        for j in 0..<pass {
            if array[j] > array[j + 1] {
                array.swapAt(j, j + 1)
            }
        }
    }
    
    return array
    
}

bubbleSort(array: &array)

var array2 = [1, 4, 10, 999, 2, 45, 32, 44, 433, 4, 0]

func bubbleSort2<T: Comparable>( array: inout [T]) -> [T] {
    let size = array.count
    
    for _ in 0..<size {
        for j in 0..<size - 1 {
            if array[j] > array[j + 1] {
                array.swapAt(j, j + 1)
            }
        }
    }
    
    return array
}

bubbleSort2(array: &array2)























