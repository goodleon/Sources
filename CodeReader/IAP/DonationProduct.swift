//
//  DonationProduct.swift
//  CodeReader
//
//  Created by vulgur on 16/6/20.
//  Copyright © 2016年 MAD. All rights reserved.
//

import Foundation

public struct DonationProduct {
    fileprivate static let Prefix = "com.wsd.Sources."
    public static let BuyMeACoffee = Prefix + "Donation"
    fileprivate static let productIdentifiers: Set<String> = [DonationProduct.BuyMeACoffee]
    public static let store = IAPHelper(productIds: DonationProduct.productIdentifiers)
}

func resourceNameForProductIdentifier(_ productIdentifier: String) -> String? {
    return productIdentifier.components(separatedBy: ".").last
}


