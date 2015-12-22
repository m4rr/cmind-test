//
//  GroupedNumbers.swift
//  cmind-test
//
//  Created by Marat S. on 22/12/15.
//  Copyright © 2015 m4rr. All rights reserved.
//

import Foundation

class GroupingFormatter {

  func random(lower: Double = 0, _ upper: Double = 100) -> Double {
    return (Double(arc4random()) / 0xFFFFFFFF) * (upper - lower) + lower
  }

  func grouping(number: Double) -> String {
    var sames: [Int] = []
    var completeSentence = ""

    func updateCompleteSentence() {
      guard let
        digit = sames.first,
        wordForNumber = nf.stringFromNumber(sames.count)
        else { return; }

      let noBrakeSpace = " "
      let suffix: String = sames.count > 1 ? "s" : ""

      completeSentence += " \(wordForNumber)\(noBrakeSpace)\(digit)\(suffix),"
    }

    splitNumber(number).forEach { digit in
      if sames.isEmpty || sames.last == digit {
        sames.append(digit)
        return;
      }

      updateCompleteSentence()

      sames = [digit]
    }

    updateCompleteSentence()

    return completeSentence.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: " ,"))
  }

  private let nf: NSNumberFormatter = {
    let nf = NSNumberFormatter()
    nf.numberStyle = NSNumberFormatterStyle.SpellOutStyle
    return nf
  }()

  private var splitNumber: (Double) -> [Int] = { number in
    var stringNumber = String(format: "%f.0", arguments: [round(number)])
    stringNumber = stringNumber.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: ".0"))
    return stringNumber.characters.map { ch in
      return Int(String(ch))!
    }
  }

}
