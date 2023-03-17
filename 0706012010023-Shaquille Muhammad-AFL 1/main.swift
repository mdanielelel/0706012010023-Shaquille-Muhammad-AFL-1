//
//  main.swift
//  0706012010023-Shaquille Muhammad-AFL 1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

func clear() {
    var int: Int = 0
    while int < 20 {
        print("")
        int += 1
    }
}

class Cart {
    var code: Int = 0
    var barang: [(Int, Int)] = [] // (Index barang, Kuantitas)
}

class Toko {
    var barang: [(String, Int)] = []
    var name: String = ""
    var code: Int = 0
}


var listToko: [Toko] = []
var cart: [Cart] = []

var toko1 = Toko()
toko1.name = "Tuku-Tuku"
toko1.code = 1
toko1.barang.append(("Tahu Isi", 5000))
toko1.barang.append(("Nasi Kuning", 20000))
toko1.barang.append(("Nasi Campur", 15000))
toko1.barang.append(("Nasi Bakar", 17000))
toko1.barang.append(("Es Jeruk", 7000))

var toko2 = Toko()
toko2.name = "Gotri"
toko2.code = 2
toko2.barang.append(("Nasi Chicken Salted Egg", 27000))
toko2.barang.append(("Nasi Chicken Blackpepper", 25000))
toko2.barang.append(("Dadar Jagung", 7000))
toko2.barang.append(("Es Teh", 5000))
toko2.barang.append(("Avocado Float", 18000))

var toko3 = Toko()
toko3.name = "Madam Lie"
toko3.code = 3
toko3.barang.append(("Nasi Ayam Goreng", 20000))
toko3.barang.append(("Nasi Sayur", 17000))
toko3.barang.append(("Nasi Ayam Geprek", 25000))
toko3.barang.append(("Nasi Pecel", 15000))
toko3.barang.append(("Air Mineral", 5000))

var toko4 = Toko()
toko4.name = "Kopte"
toko4.code = 4
toko4.barang.append(("Thai Tea", 16000))
toko4.barang.append(("Butter Toast", 20000))
toko4.barang.append(("Chocolate Toast", 17000))
toko4.barang.append(("Milo Kopi", 15000))
toko4.barang.append(("Teh Leci", 10000))

var toko5 = Toko()
toko5.name = "Xiang Jia"
toko5.code = 5
toko5.barang.append(("Nasi Ayam Hainan", 30000))
toko5.barang.append(("Mie Ayam Kobe", 25000))
toko5.barang.append(("Nasi Campur", 15000))
toko5.barang.append(("Teh Tarik", 16000))
toko5.barang.append(("Milo", 12000))


listToko.append(toko1)
listToko.append(toko2)
listToko.append(toko3)
listToko.append(toko4)
listToko.append(toko5)

var exit: Bool = false

while !exit {
    print("Welcome to UC Walk-Cafeteria! Please choose cafeteria:")
    print("[1] Tuku-Tuku")
    print("[2] Gotri")
    print("[3] Madam Lie")
    print("[4] Kopte")
    print("[5] Xiang Jia")
    print("-")
    print("[S]hopping Cart")
    print("[Q]uit")
    
    var userInput: String = ""

    print("Your Cafeteria Choice? ")
    userInput = readLine()!

    if (userInput == "S") {
        clear()
        if (cart.count == 0) {
            print("Your cart is empty")
        } else {
            print("Your cart:")
            var total: Int = 0
            for cartItem in cart {
                for toko in listToko {
                    if (cartItem.code == toko.code) {
                        print("[\(toko.name)]")
                        for barang in cartItem.barang {
                            total += barang.1 * toko.barang[barang.0 - 1].1
                            print("\(toko.barang[barang.0 - 1].0) x \(barang.1) = \(barang.1 * toko.barang[barang.0 - 1].1)")
                        }
                    }
                }
            }
            print("-")
            print("Total: Rp. \(total)")
            print("[P] Pay")
            print("[Q] Continue shopping")
            
            var userInput: String = ""
            userInput = readLine()!
            
            if (userInput == "P") {
                print("Your Total Order: Rp. \(total)")
                print("Input amount: ")
                
                var userInput: String = ""
                userInput = readLine()!
                
                let userPay: Int = Int(userInput) ?? 0
                if (userPay < total) {
                    print("Not enough cash!")
                } else if (userPay > total) {
                    print("Your change: \(userPay - total)")
                    print("Enjoy your meals!")
                    exit = true
                } else {
                    print("Enjoy your meals!")
                    exit = true
                }
            }
        }
    } else if (userInput == "Q") {
        exit = true
    } else {
        let userCode: Int = Int(userInput) ?? -1

        print("User input: \(userInput)")

        var index = -1
        for (i, toko) in listToko.enumerated() {
            if toko.code == userCode {
                index = i
            }
        }

        if (index > -1) {
            clear()
            for (i, barang) in listToko[index].barang.enumerated() {
                print("[\(i + 1)] \(barang.0)")
            }
            print("Your Menu Choice? ")
            var userInput: String = ""
            userInput = readLine()!
            
            let userCode: Int = Int(userInput) ?? -1
            print("User input: \(userInput)")
            
            if listToko[index].barang.indices.contains(userCode - 1) {
                clear()
                print("Quantity? ")
                var userInput: String = ""
                userInput = readLine()!
                
                let quantity: Int = Int(userInput) ?? -1
                print("User input: \(quantity)")
                
                var tokoIndex: Int = -1
                
                for (i, toko) in cart.enumerated() {
                    if toko.code == index {
                        tokoIndex = i
                    }
                }
                
                if (tokoIndex > -1) {
                    var barangIndex: Int = -1
                    
                    for (i, barang) in cart[tokoIndex].barang.enumerated() {
                        if barang.0 == userCode {
                            barangIndex = i
                        }
                    }
                    
                    if (barangIndex > -1) {
                        cart[tokoIndex].barang[barangIndex].1 += quantity
                    } else {
                        cart[tokoIndex].barang.append((userCode, quantity))
                    }
                } else {
                    let newCart = Cart()
                    newCart.code = index + 1
                    newCart.barang = [(userCode, quantity)]
                    cart.append(newCart)
                }
            }
        } else {
            print("Does not exists")
        }
    }
}








