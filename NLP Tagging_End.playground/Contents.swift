//: Playground - noun: a place where people can play

import UIKit

let str:[String:String] = [
    "English":"Where is the nearest Pizza Restaurant? Can I get a Pizza Margherita there? Steve loves pizza Margherita.",
    "Chinese":"最近的披萨餐厅在哪里？我可以在那里得到一份玛格丽塔披萨吗？史蒂夫喜欢披萨玛格丽塔。",
    "Spanish":"¿Dónde está el Pizza Restaurant más cercano? ¿Puedo conseguir una Pizza Margherita allí? Steve adora la pizza Margherita.",
    "French":"Où est le restaurant Pizza le plus proche? Puis-je avoir une Pizza Margherita là-bas? Steve adore la pizza Margherita.",
    "Italian":"Dov'è il ristorante pizzeria più vicino? Posso avere una pizza Margherita lì? Steve ama la pizza Margherita.",
    "Hawaiian":"ʻAuhea kahi Pizza Mea kokoke loa? Hiki iaʻu ke loaʻa i kahi Pizza Margherita ma laila? Paiʻo Steve i ka pizzaʻo Margherita.",
    "Hindi":"निकटतम पिज्जा रेस्तरां कहां है? क्या मुझे पिज्जा मार्गरिता मिल सकती है? स्टीव पिज्जा Margherita प्यार करता है।",
    "Japanese":"一番近いピザレストランはどこですか？そこにピザマルゲリータを手に入れることはできますか？スティーブはマルゲリータのピザが好きです。"
]
let lang = "Chinese"
var language = NSLinguisticTagger.dominantLanguage(for: str[lang]!)
let tagger = NSLinguisticTagger(tagSchemes: [.nameTypeOrLexicalClass], options: 0)
tagger.string = str[lang]!

let fullRange = NSRange(location: 0, length: (str[lang]?.utf16.count)!)
tagger.enumerateTags(in: fullRange, unit: .word, scheme: .nameTypeOrLexicalClass, options: [.omitPunctuation,.omitWhitespace]) { (tag, range, stop) in
    if tag == .noun{
        let word = (tagger.string! as NSString).substring(with: range)
        print(word)
    }
}













