//
//  Cart.swift
//  PCPal
//
//  Created by Ahmad on 4/14/25.
//

import SwiftUI
import SwiftData

@Model
class Cart {
    var gpu:GPU?
//    var cpu:CPU?
//    var memory:Memory?
//    var harddrive:HardDrive?
//    var pccase:PCCase?
//    var powersupply:PowerSupply?
//    var cooler:Cooler?
//    var motherboard:Motherboard?

    init(gpu: GPU? = nil//, cpu: CPU? = nil, memory: Memory? = nil, harddrive: HardDrive? = nil,
         //pccase: PCCase? = nil, powersupply: PowerSupply? = nil, cooler: Cooler? = nil, motherboard: Motherboard? = nil)
    ){
        self.gpu = gpu
//        self.cpu = cpu
//        self.memory = memory
//        self.harddrive = harddrive
//        self.pccase = pccase
//        self.powersupply = powersupply
//        self.cooler = cooler
//        self.motherboard = motherboard
    }
}
