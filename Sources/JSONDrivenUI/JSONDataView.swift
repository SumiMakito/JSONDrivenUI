//
//  JSONDataView.swift
//  
//
//  Created by Enes Karaosman on 27.11.2020.
//

import SwiftUI

public struct JSONDataView: View, JSONDataViewProtocol {
    
    public var json: Data
    public var date: Date? = nil
    
    public init(json: Data) {
        self.json = json
    }
    
    public init(json: Data, date: Date) {
        self.json = json
        self.date = date
    }
    
    @ViewBuilder public func toPresentable() -> some View {
        if let material = try? JSONDecoder().decode(
            ViewMaterial.self,
            from: json
        ) {
            ViewFactory(material: material).toPresentable()
        } else {
            Text("Serialization Error")
        }
    }
    
    public var body: some View {
        toPresentable()
    }
}

//struct JSONDataView_Previews: PreviewProvider {
//    static var previews: some View {
//        JSONDataView()
//    }
//}
