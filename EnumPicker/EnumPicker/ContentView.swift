//
//  ContentView.swift
//  EnumPicker
//
//  Created by Thongchai Subsaidee on 17/8/2564 BE.
//

import SwiftUI

enum Flavor: String, CaseIterable, Identifiable {
    case chocolate
    case vanilla
    case strawberry
    
    var id: String {
        self.rawValue
    }
    
    var display: String {
        switch self {
        case .chocolate:
            return "I like \(Flavor.chocolate.rawValue.capitalized)"
        case .vanilla:
            return "I like \(Flavor.vanilla.rawValue.capitalized)"
        case .strawberry:
            return "I like \(Flavor.strawberry.rawValue.capitalized)"

        }
    }
    
}

struct ContentView: View {
    
    @State private var selectedFlavor = Flavor.chocolate
    
    var body: some View {
        VStack {
            
            Text("Selected because: \(selectedFlavor.display)")
                .padding()
            
            Picker("Select", selection: $selectedFlavor) {
                ForEach(Flavor.allCases) { flavor in
                    Text(flavor.rawValue.capitalized)
                        .tag(flavor)
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

