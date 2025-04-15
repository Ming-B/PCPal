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
    var cpu:CPU?
    var memory:Memory?
    var harddrive:Storage?
    var computercase:ComputerCase?
    var powersupply:PSU?
    var cooler:CPUCooler?
    var motherboard:Motherboard?
    
    init(gpu: GPU? = nil, cpu: CPU? = nil, motherboard: Motherboard? = nil, computercase: ComputerCase? = nil, memory: Memory? = nil, powersupply: PSU? = nil, cooler: CPUCooler? = nil, harddrive:Storage? = nil
    ){
        self.gpu = gpu
        self.cpu = cpu
        self.memory = memory
        self.harddrive = harddrive
        self.computercase = computercase
        self.powersupply = powersupply
        self.cooler = cooler
        self.motherboard = motherboard
    }
}
