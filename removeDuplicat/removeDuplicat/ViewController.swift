//
//  ViewController.swift
//  removeDuplicat
//
//  Created by Виктория Саклакова on 29.07.2020.
//  Copyright © 2020 Viktoriia Saklakova. All rights reserved.
//

import UIKit

class ListNode {
    var value: Int
    var next: ListNode?
    
    init(value: Int, next: ListNode?) {
        self.value = value
        self.next = next
    }
}

class ViewController: UIViewController {
    
    var array = [1, 5, 4, 4, 6, 2, 8]
    var s1 = "hello"
    var s2 = "heliu"
    
    var fourthNode = ListNode(value: 12, next: nil)
    var thirdNode = ListNode(value: 9, next: nil)
    var secondNode = ListNode(value: 6, next: nil)
    var firstNode = ListNode(value: 1, next: nil)

    var fourthNode2 = ListNode(value: 14, next: nil)
    var thirdNode2 = ListNode(value: 13, next: nil)
    var secondNode2 = ListNode(value: 10, next: nil)
    var firstNode2 = ListNode(value: 2, next: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        print(removeDuplicates(array: array))
//        print(removeDuplicates2(array: &array))
//        print(findUnsortedSubarray2(array: array))
//        print(isOneAway(s1: s1, s2: s2))
//        initList()
//        printLinkedList(head: unionTwoSortedLinkedLists(head: firstNode, head2: firstNode2))
        
        minesweeper(bombs: [[0, 2], [0, 3]], rows: 3, columns: 4)
    }
    
    func minesweeper(bombs: [[Int]], rows: Int, columns: Int) -> [[Int]]{
        var field = Array(repeating: Array(repeating: 0, count: columns), count: rows) //filled by 0
        
        for bomb in bombs {
            let row = bomb[0]
            let column = bomb[1]
            field[row][column] = -1
            
            for i in row - 1...row + 1 {
                for j in column - 1...column + 1 {
                    if (i >= 0) && (i < rows) && (j >= 0) && (j < columns) && (field[i][j] != -1) {
                        field[i][j] += 1
                    }
                }
            }
        }

        return field
    }

    func initList() {
        fourthNode = ListNode(value: 4, next: nil)
        thirdNode = ListNode(value: 3, next: fourthNode)
        secondNode = ListNode(value: 2, next: thirdNode)
        firstNode = ListNode(value: 1, next: secondNode)

//        fourthNode2 = ListNode(value: 14, next: nil)
//        thirdNode2 = ListNode(value: 8, next: fourthNode2)
//        secondNode2 = ListNode(value: 5, next: thirdNode2)
        firstNode2 = ListNode(value: 5, next: nil)
    }

    func printLinkedList(head: ListNode?) {
        var currentNode = head
        
        while currentNode != nil {
            print(currentNode!.value ?? -1)
            currentNode = currentNode?.next
        }
    }
    
    func unionTwoSortedLinkedLists(head: ListNode?, head2: ListNode?) -> ListNode? {
        let returnValue: ListNode?
        var currentNode: ListNode?
        var currentNode2: ListNode?
        var temp: ListNode?
        var prev: ListNode?
        
        if head!.value < head2!.value {
            currentNode = head
            currentNode2 = head2
            returnValue = head
        } else {
            currentNode = head2
            currentNode2 = head
            returnValue = head2
        }
        
        while currentNode != nil {
            if currentNode2 == nil {
                prev?.next = currentNode
                break
            }
            
            if currentNode?.value == head?.value || currentNode?.value == head2?.value {
                temp = currentNode?.next
                currentNode?.next = currentNode2
                currentNode = temp
                prev = currentNode2
            } else if currentNode!.value < currentNode2!.value {
                temp = currentNode?.next
                currentNode?.next = currentNode2
                prev?.next = currentNode
                prev = currentNode
                currentNode = temp
            } else {
                prev = currentNode2
                currentNode2 = currentNode2?.next
            }
        }
        
        return returnValue
    }
    
    
    func isOneAway(s1: String, s2: String) -> Bool {
        var diff = 0
        var i = 0
        let minCount = min(s1.count, s2.count)
        
        if abs(s1.count - s2.count) >= 2 {
            return false
        } else if abs(s1.count - s2.count) == 1 {
            diff += 1
        }
        
        while i < minCount {
            if s1[s1.index(s1.startIndex, offsetBy: i)] == s2[s2.index(s2.startIndex, offsetBy: i)] {
                i += 1
            } else {
                i += 1
                diff += 1
            }
            
            if diff >= 2 {
                return false
            }
        }
        
        return true
    }
    
    func findUnsortedSubarray2(array: [Int]) -> Int {
        var indexStart = 0
        var indexLast = array.count - 1
        var i = 0
        var resultArray = [Int]()
        
        while i < array.count {
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

    func removeDuplicates(array: [Int]) -> Int {
        var newArray = [Int]()
        newArray.append(array.sorted().first!)
//        print(newArray)
        for (i, valueArray) in array.sorted().enumerated() {
            for (j, _) in newArray.enumerated() {
                print(newArray[j])
                if array.sorted()[i] != newArray[j] {
                    newArray.append(valueArray)
                    print(newArray)
                    break
                }
                print(j)
            }
        }
        return newArray.count
    }

    
    func removeDuplicates2(array: inout [Int]) -> Int {
        
        array.sort { $0 < $1 }
        let first = array[0]
        var i = 1
        
        while i < array.count - 1 {
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
        return array.count
    }

}

