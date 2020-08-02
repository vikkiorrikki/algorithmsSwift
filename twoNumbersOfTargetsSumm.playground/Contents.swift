import UIKit

let array = [3, 7, 6, 8, 16, 5]
let target = 15

func twoNumbersOfTargetsSumm (array: [Int], target: Int) -> [Int] {
    for (i, _) in array.enumerated() {
        var j = i + 1
        while j < array.count - 1 {
            if array[i] + array[j] == target {
                return [i, j]
            }
            j += 1
        }
    }
    return []
}

twoNumbersOfTargetsSumm(array: array, target: target)

func twoNumbersOfTargetsSumm2 (array: [Int], target: Int) -> [Int] {
    var dict = [Int : Int]()
    
    for (i, value) in array.enumerated() {
        if let index = dict[target - value] {
            return [index, i]
        }
        dict[value] = i
    }
    return []
}

twoNumbersOfTargetsSumm2(array: array, target: target)
