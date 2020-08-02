import UIKit

var s1 = "hello"
var s2 = "hallш"

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
            if diff >= 2 {
                return false
            }
        }
    }
    
    return true
}

isOneAway(s1: s1, s2: s2)
