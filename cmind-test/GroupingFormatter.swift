//
//  GroupedNumbers.swift
//  cmind-test
//
//  Created by Marat S. on 22/12/15.
//  Copyright © 2015 m4rr. All rights reserved.
//

import Foundation

class GroupingFormatter {

  func random(lower: UInt64 = 0, _ upper: UInt64 = 100) -> UInt64 {
    var rnd: UInt64 = 0
    arc4random_buf(&rnd, sizeofValue(rnd))

    return rnd % upper
  }


  func grouping(number: UInt64) -> String {
    return writeOut(consecutiveGrouping(number))
  }

  private func consecutiveGrouping(number: UInt64) -> [[Int]] {
    var sameValues: [[Int]] = []
    var accumulator: [Int] = []

    splitNumber(number).forEach { (digit: Int) in
      if accumulator.last != digit && !accumulator.isEmpty {
        sameValues.append(accumulator)
        accumulator = []
      }
      accumulator.append(digit)
    }
    sameValues.append(accumulator)
    
    return sameValues
  }

  private func wordForNumber(count: Int) -> String {
    return nf.stringFromNumber(count) ?? ""
  }

  private func writeOut(grouped: [[Int]]) -> String {
    let noBrakeSpace = " "

    let completeSentence = grouped.reduce("") { wholeString, group in
      if let digit = group.first {
        let suffix: String = group.count > 1 ? "s" : ""
        return wholeString + " \(wordForNumber(group.count))\(noBrakeSpace)\(digit)\(suffix),"
      }
      return wholeString
    }

    return completeSentence.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: " ,"))
  }

  private let nf: NSNumberFormatter = {
    let nf = NSNumberFormatter()
    nf.numberStyle = NSNumberFormatterStyle.SpellOutStyle
    return nf
  }()

  /// Splitting also 20-digit-length numbers.
  private var splitNumber: (UInt64) -> [Int] = { number in
    return "\(number)".characters.map { Int(String($0))! }
  }

}
