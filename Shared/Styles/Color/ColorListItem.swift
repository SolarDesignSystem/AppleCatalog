//
//  ColorListItem.swift
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

/// Represents a single color in a list of colors.
struct ColorListItem: View {
    
    // MARK: - Properties
    
    @Environment(\.theme) var theme
    @Environment(\.sizeCategory) var sizeCategory
    
    var item: ColorManifest.ColorItem
    
    // MARK: - View
    
    var normalRow: some View {
        HStack {
            SwatchView(color: theme.for(item.color))
                .customize(for: .iOS, modifier: {
                    $0.frame(width: 32.0, height: 32.0)
                })
                .customize(for: .tvOS) {
                    $0.frame(width: 64.0, height: 64.0).padding([.top, .leading, .bottom])
                }
            VStack(alignment: .leading, spacing: 2.0) {
                Text(item.name)
                    .font(.body)
                    .foregroundColor(theme.systemColor.label)
                Text(item.description)
                    .font(.caption)
                    .foregroundColor(theme.systemColor.secondaryLabel)
            }
        }
    }
    
    var largeRow: some View {
        VStack(alignment: .leading, spacing: 2.0) {
            HStack {
                SwatchView(color: theme.for(item.color))
                    .customize(for: .iOS, modifier: {
                        $0.frame(width: 48.0, height: 48.0)
                    })
                    .customize(for: .tvOS) {
                        $0.frame(width: 64.0, height: 64.0)
                    }
                    
                Text(item.name)
                    .font(.body)
                    .foregroundColor(theme.systemColor.label)
            }
            Text(item.description)
                .font(.caption)
                .foregroundColor(theme.systemColor.secondaryLabel)
        }
    }
    
    var smallCell: some View {
        HStack(spacing: 8.0) {
            SwatchView(color: theme.for(item.color))
                .frame(width: 24.0, height: 24.0)
            Text(item.name)
                .font(.body)
                .foregroundColor(theme.systemColor.label)
        }
        .padding()
    }
    
    var body: some View {
        #if os(iOS) || os(tvOS)
        if sizeCategory >= .accessibilityMedium {
            return AnyView(largeRow)
        }
        return AnyView(normalRow)
        #else
        return AnyView(smallCell)
        #endif
    }
    
}

struct ColorListItem_Previews: PreviewProvider {
    static var previews: some View {
        ColorListItem(item: ColorManifest().colors[0].items[0])
    }
}
