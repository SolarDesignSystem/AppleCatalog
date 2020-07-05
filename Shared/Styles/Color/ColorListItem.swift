//
//  ColorListItem.swift
//  Solar Design System Catalog
//
//  Created by Brandon McQuilkin on 7/3/20.
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
