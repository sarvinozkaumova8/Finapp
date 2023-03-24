//
//  SushiModel.swift
//  working with navigation
//
//  Created by Sarvinoz Kayumova on 21/03/23.
//

import UIKit

struct SushiModel {
    var mainImage: UIImage
    var sushiName: String
    var imageDetail: UIImage
    
    
    static func fetchsushi()-> [SushiModel]{
        let firstItem = SushiModel(mainImage: UIImage (named: "Новое в законах")!,
                                   sushiName: "Новое в законах", imageDetail: UIImage(named: "Новое в законах 2")!)
        let secondItem = SushiModel(mainImage: UIImage (named: "Страхи в начале бизнеса")!,
                                    sushiName: "Страхи в начале бизнеса", imageDetail: UIImage(named: "Страхи в начале бизнеса 2")!)
        let thirdItem = SushiModel(mainImage: UIImage (named: "Сделайте напиток из эспрессо")!,
                                    sushiName: "Сделайте напиток из эспрессо", imageDetail: UIImage(named: "Сделайте напиток из эспрессо 2")!)
        return [firstItem, secondItem, thirdItem]
    }
    
}

struct Model {
    var title: String
    var subtitle: String
    
    static func fetchModel()-> [Model]{
        let firstItem = Model(title: "Все операции",
                              subtitle: "")
        let secondItem = Model(title: "Кэшбэк и бонусы",
                               subtitle: "")
       
        return [firstItem, secondItem]
    }
}
struct ModelCards {
    var image: UIImage
    var title: String
    var subtitle: String
    
    
    static func fetchModelCards()-> [ModelCards]{
        let firstItem = ModelCards(image: UIImage(named: "Рубль")!,title: "23000 P",
                              subtitle: "Tincoff Black")
        let secondItem = ModelCards(image: UIImage(named: "Доллар")!,title: "0 $",
                               subtitle: "Tinkoff Black USD")
       
        return [firstItem, secondItem]
    }
}

struct Contacts {
    var name: String
    var number: String
    var symbol: String
    
    static func fetchContacts()-> [Contacts] {
        let first = Contacts(name: "Айрин", number: "+992 935821900", symbol: "А")
        let second = Contacts(name: "Азиза", number: "+992 985721900", symbol: "А")
        let third = Contacts(name: "Далер", number: "+992 985721912", symbol: "Д")
        let fourth = Contacts(name: "Диана", number: "+992 985771800", symbol: "Д")
        let fifth = Contacts(name: "Джовид", number: "+992 985771897", symbol: "Д")
        let sixth = Contacts(name: "Парвина", number: "+992 935771897", symbol: "П")
        let seventh = Contacts(name: "Шоира", number: "+992 985765980", symbol: "Ш")
        
        return [first, second, third, fourth, fifth, sixth, seventh]
    }
    
}

struct Cashback {
    var service: String
    var cashback: String
    
    static func fetch()-> [Cashback] {
        let one = Cashback(service: "Супермаркет Ёвар", cashback: "1%")
        let two = Cashback(service: "Чайхана Бухоро", cashback: "10%")
        let three = Cashback(service: "Кафе Simple", cashback: "4%")
        let four = Cashback(service: "Винир", cashback: "5%")
        let five = Cashback(service: "Магазин Самира", cashback: "3%")
        let six = Cashback(service: "Lady Crystal", cashback: "15%")
        let seven = Cashback(service: "Bon Appetit", cashback: "2%")
        let eight = Cashback(service: "Jumma.tj", cashback: "20%")
        let nine = Cashback(service: "barakat.tj", cashback: "10%")
        let ten = Cashback(service: "Sor Pizza", cashback: "1%")
        let eleven = Cashback(service: "Cafe Istanbul", cashback: "15%")
        
        return [one, two, three, four, five, six, seven, eight, nine, ten, eleven]
    }
}


