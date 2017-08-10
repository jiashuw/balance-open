//
//  Currency.swift
//  BalanceForBlockchain
//
//  Created by Benjamin Baron on 6/14/17.
//  Copyright © 2017 Balanced Software, Inc. All rights reserved.
//

import Foundation

enum Currency {
    enum Traditional: String {
        case usd = "USD"
        case eur = "EUR"
        case gbp = "GBP"
    }
    case Crypto(shortName: String)
    case Common(traditional: Traditional)
    
    static func rawValue(currency: String) -> Currency? {
        switch currency {
            case "USD": return .Common(traditional:.usd)
            case "EUR": return .Common(traditional:.eur)
            case "GBP": return .Common(traditional:.gbp)
            default: return .Crypto(shortName:currency)
        }
    }
    
    var decimals: Int {
        switch self {
            case .Common(traditional:.usd), .Common(traditional:.eur), .Common(traditional:.gbp): return 2
            default: return 8
        }
    }
    
    var symbol: String {
        switch self {
            case .Common(traditional:.usd): return "$"
            case .Common(traditional:.eur): return "€"
            case .Common(traditional:.gbp): return "£"
            case .Crypto(let val): return val + " "
            default: fatalError("Unexpected value \(self)")
        }
    }
    
    var name: String {
        switch self {
            case .Common(traditional: .usd): return "USD"
            case .Common(traditional: .eur): return "EUR"
            case .Common(traditional: .gbp): return "GBP"
            case .Crypto(let val): return val
            default: fatalError("Unexpected value \(self)")
        }
    }
}
