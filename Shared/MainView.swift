//
//  MainView.swift
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

/// The top level navigation structure for the catalog.
struct MainView: View {
    
    // MARK: - Properties
    
    #if os(iOS) || os(macOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
    
    // MARK: - View
    
    #if os(iOS) || os(macOS)
    var sidebarLayout: some View {
        NavigationView {
            SidebarView()
            ColorsView(colors: ColorManifest().colors)
            ColorView(item: ColorManifest().colors[0].items[0])
        }
    }
    #endif
    
    var tabLayout: some View {
        TabView {
            StylesView()
                .tabItem {
                    Image(systemName: "paintbrush")
                        .imageScale(.large)
                    Text("Styles")
                }
        }
    }
    
    var body: some View {
        #if os(iOS) || os(macOS)
        if horizontalSizeClass == .regular {
            return AnyView(sidebarLayout)
        } else {
            return AnyView(tabLayout)
        }
        #else
        return AnyView(tabLayout)
        #endif
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
