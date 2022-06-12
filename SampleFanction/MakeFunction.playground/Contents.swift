import UIKit


// ✅配列内から一つずつ取り出して出力する関数

func printTexts(texts: [String]) {
    for text in texts {
print("\(text)")
    }
}

let texts = ["Hello", "World", "!"]
printTexts(texts: texts)




// ✅ある数字からある数字までを引数として、その範囲内にある素数を割り出す関数

func isPrimeNumber(divisorNumber: Int, brokenNumber: Int) {
    
    var primeNumberList: [Int] = [] // 素数を入れる配列
    var factor = 0 // 約数の数
    
    for broken in divisorNumber ... brokenNumber {  // broken = 割られる数
        print("現在の(broken)は\(broken)です")
        
        for divisor in divisorNumber...broken {  // divisor = 割る数
            print("現在の(divisor)は\(divisor)です")
            
            if broken % divisor == 0 {
                factor +=  1
                print("現在の(factor)は\(factor)です")
                
            }
        }
        if factor == 2 {
            primeNumberList.append(broken)
            
        }
        // 約数の個数を初期化
        factor = 0
        
    }// for broken in ... ここまで
    
    print(primeNumberList)   // [2, 3, 5, 7]
    
} // func isPrimeNumber

isPrimeNumber(divisorNumber: 1, brokenNumber: 10)




