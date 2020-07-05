//
//  StylesView.swift
//  Solar Design System Catalog
//
//  Created by Brandon McQuilkin on 7/3/20.
//  Copyright © 2020 Brandon McQuilkin (Marxon13).
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import SwiftUI
import SolarDesignSystem

/// The navigation structure for the styles tab.
struct StylesView: View {
    
    // MARK: - View
    
    var list: some View {
        List {
            Section(header: Text("Color")) {
                NavigationLink(
                    destination: ColorsView(colors: ColorManifest().colors),
                    label: {
                        Image(systemName: "eyedropper")
                            .imageScale(.large)
                            .customize(for: .tvOS, .watchOS) {
                                $0.padding([.top, .leading, .bottom])
                            }
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
                            .customize(for: .tvOS, .watchOS) {
                                $0.padding([.top, .leading, .bottom])
                            }
                        Text("System Colors")
                            .customize(for: .watchOS) {
                                $0.padding()
                            }
                    })
            }
        }
        .navigationTitle("Styles")
    }
    
    var body: some View {
        NavigationView {
            #if os(iOS) || os(tvOS)
            list
                .listStyle(GroupedListStyle())
            #else
            list
            #endif
        }
    }
    
}

struct StylesView_Previews: PreviewProvider {
    static var previews: some View {
        StylesView()
    }
}
