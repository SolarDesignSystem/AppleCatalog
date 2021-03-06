//
//  ColorsView.swift
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

/// Displays a list of colors.
struct ColorsView: View {
    
    // MARK: - Properties
    
    @Environment(\.theme) var theme
    
    @State var colors: [ColorManifest.ColorSection]
    
    // MARK: - View
    
    var list: some View {
        List {
            ForEach(colors) { (section) in
                Section(header: Text(section.name)) {
                    ForEach(section.items) { (item) in
                        NavigationLink(destination: ColorView(item: item)) {
                            ColorListItem(item: item)
                                .padding([.top, .bottom], 2.0)
                        }
                    }
                }
            }
        }
        .navigationTitle("Colors")
    }
    
    var body: some View {
        #if os(iOS) || os(tvOS)
        return list
            .listStyle(GroupedListStyle())
        #else
        return list
        #endif
    }
    
}

struct ColorsView_Previews: PreviewProvider {
    static var previews: some View {
        ColorsView(colors: ColorManifest().colors)
    }
}
