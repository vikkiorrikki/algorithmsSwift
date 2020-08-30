import UIKit

var str = "Hello, playground"

func listSum(numList: [Int]) -> Int {
    let size = numList.count
    assert(size > 0)
    
    var sum = 0
    for i in numList {
        sum += numList[i]
    }
    
    return sum
}

func recSum(numList: [Int]) -> Int {
    let size = numList.count
    assert(size > 0)
    
    return size == 1 ? numList.first! : numList.first! + recSum(numList: Array(numList[1..<size]))
}

recSum(numList: [1,2,4, 13])

