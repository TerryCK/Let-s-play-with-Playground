import Foundation

//let nums = [2,7,11,15],  target = 9 -> answer: (0, 1)

func twoSum(nums: [Int], target: Int) -> (Int, Int)? {
    var temp = [Int: Int]()
    for (index, value) in nums.enumerated() {
        if let lastIndex = temp[target - value] {
            return [lastIndex, index + 1]
        }
        
        temp[value] = index + 1
    }
    return nil
}



twoSum(nums: [2,7,11,15], target: 9)

