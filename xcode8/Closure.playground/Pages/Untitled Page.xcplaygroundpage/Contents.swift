var customersInLine = ["Albee","Alex","Eddie","Zack","Kevin"]

// 印出：5
print(customersInLine.count)

// 接著宣告一個閉包 會移除掉陣列的第一個成員
let customerProvider = { customersInLine.removeFirst() }

// 這時仍然是印出：5
print(customersInLine.count)

// 直到這個閉包被呼叫時 才會執行
// 印出：開始移除 Albee ！
print("開始移除 \(customerProvider()) ！")

// 這時就只剩下 4 個成員了
print(customersInLine.count)