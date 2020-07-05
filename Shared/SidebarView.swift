//
//  SidebarView.swift
//  Solar Design System Catalog
//
//  Created by Brandon McQuilkin on 7/4/20.
//

import SwiftUI
import SolarDesignSystem

/// The top level sidebar for the catalog.
struct SidebarView: View {
    
    // MARK: - Properties
    
    @Environment(\.theme) var theme
    
    // MARK: - View
    
    var body: some View {
        List {
            Section(header: Text("Styles")) {
                NavigationLink(
                    destination: ColorsView(colors: ColorManifest().colors),
                    label: {
                        Image(systemName: "eyedropper")
                            .imageScale(.large)
                        Text("Solar Design System Colors")
                            .customize(for: .watchOS) {
                                $0.padding()
                            }
                    })
                NavigationLink(
                    destination: ColorsView(colors: ColorManifest().systemColors),
                    label: {
                        Image(systemName: "eyedropper")
                            .imageScale(.large)
                        Text("System Colors")
                            .customize(for: .watchOS) {
                                $0.padding()
                            }
                    })
            }
        }
        .listStyle(SidebarListStyle())
    }
    
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
