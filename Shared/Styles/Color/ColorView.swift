//
//  ColorView.swift
//  Solar Design System Catalog
//
//  Created by Brandon McQuilkin on 3/13/20.
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

/// Displays the information for a single color.
struct ColorView: View {
    
    // MARK: - Properties
    
    @Environment(\.theme) var theme
    @Environment(\.sizeCategory) var sizeCategory
    
    var item: ColorManifest.ColorItem
    
    private let percentFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    private let floatFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 4
        formatter.minimumFractionDigits = 4
        return formatter
    }()
    
    #if os(iOS) || os(tvOS)
    private let lightTraitCollection: PlatformTraitCollection = UITraitCollection(traitsFrom: [
        UITraitCollection(),
        UITraitCollection(userInterfaceStyle: .light),
        UITraitCollection(accessibilityContrast: .normal)
    ])
    
    private let darkTraitCollection: PlatformTraitCollection = UITraitCollection(traitsFrom: [
        UITraitCollection(),
        UITraitCollection(userInterfaceStyle: .dark),
        UITraitCollection(accessibilityContrast: .normal)
    ])
    
    private let lightHighContrastTraitCollection: PlatformTraitCollection = UITraitCollection(traitsFrom: [
        UITraitCollection(),
        UITraitCollection(userInterfaceStyle: .light),
        UITraitCollection(accessibilityContrast: .high)
    ])
    
    private let darkHighContrastTraitCollection: PlatformTraitCollection = UITraitCollection(traitsFrom: [
        UITraitCollection(),
        UITraitCollection(userInterfaceStyle: .dark),
        UITraitCollection(accessibilityContrast: .high)
    ])
    #else
    private let lightTraitCollection: PlatformTraitCollection = nil
    private let darkTraitCollection: PlatformTraitCollection = nil
    private let lightHighContrastTraitCollection: PlatformTraitCollection = nil
    private let darkHighContrastTraitCollection: PlatformTraitCollection = nil
    #endif
    
    // MARK: - View
    
    private func hex(for color: PlatformColor, traitCollection: PlatformTraitCollection) -> some View {
        #if os(iOS) || os(tvOS)
        let resolvedColor = color.resolvedColor(with: traitCollection)
        #else
        let resolvedColor = color
        #endif
        
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        resolvedColor.getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb: Int = (Int)(r * 255) << 16 | (Int)(g * 255) << 8 | (Int)(b * 255) << 0
        
        let hexString = String(format: "#%06x", rgb)
        let opacityString = percentFormatter.string(for: a)!
        
        return colorInformationCell(format: "RGB Hex", componentNames: ["Hex", "Opacity"], componentValues: [hexString, opacityString])
    }
    
    private func floats(for color: PlatformColor, traitCollection: PlatformTraitCollection) -> some View {
        #if os(iOS) || os(tvOS)
        let resolvedColor = color.resolvedColor(with: traitCollection)
        #else
        let resolvedColor = color
        #endif
        
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        resolvedColor.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let redString = floatFormatter.string(for: r)!
        let greenString = floatFormatter.string(for: g)!
        let blueString = floatFormatter.string(for: b)!
        let opacityString = percentFormatter.string(for: a)!
        
        return colorInformationCell(format: "RGB", componentNames: ["R", "G", "B", "Opacity"], componentValues: [redString, greenString, blueString, opacityString])
    }
    
    private func hsb(for color: PlatformColor, traitCollection: PlatformTraitCollection) -> some View {
        #if os(iOS) || os(tvOS)
        let resolvedColor = color.resolvedColor(with: traitCollection)
        #else
        let resolvedColor = color
        #endif
        
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        resolvedColor.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        
        let hueString = floatFormatter.string(for: h)!
        let saturationString = floatFormatter.string(for: s)!
        let brightnessString = floatFormatter.string(for: b)!
        let opacityString = percentFormatter.string(for: a)!
        
        return colorInformationCell(format: "HSB", componentNames: ["H", "S", "B", "Opacity"], componentValues: [hueString, saturationString, brightnessString, opacityString])
    }
    
    private func colorInformationCell(format: String, componentNames: [String], componentValues: [String]) -> some View {
        #if os(iOS) || os(tvOS) || os(macOS)
        if sizeCategory >= .accessibilityMedium {
            return AnyView(
                VStack {
                    Text(format)
                        .foregroundColor(theme.systemColor.secondaryLabel)
                        .padding(.bottom)
                    
                    VStack {
                        ForEach(0..<componentNames.count) { (index) in
                            HStack {
                                Text(componentNames[index])
                                Spacer()
                                Text(componentValues[index])
                                    .font(.system(.body, design: .monospaced))
                            }
                        }
                    }
                }
                .foregroundColor(theme.systemColor.label)
            )
        } else {
            return AnyView(
                HStack {
                    Text(format)
                        .foregroundColor(theme.systemColor.secondaryLabel)
                    Spacer()
                    HStack {
                        VStack(alignment: .trailing) {
                            ForEach(componentNames) { (element) in
                                ZStack(alignment: .trailing) {
                                    Text(element)
                                    Text("Opacity")
                                        .hidden()
                                }
                            }
                        }
                        Divider()
                        VStack(alignment: .trailing) {
                            ForEach(componentValues) { (element) in
                                ZStack(alignment: .trailing) {
                                    Text(element)
                                    Text("#000000")
                                        .hidden()
                                }
                            }
                        }.font(.system(.body, design: .monospaced))
                    }
                }
                .foregroundColor(theme.systemColor.label)
            )
        }
        #elseif os(watchOS)
        return HStack {
            Spacer()
            VStack {
                Text(format)
                    .foregroundColor(theme.systemColor.secondaryLabel)
                Spacer()
                HStack {
                    VStack(alignment: .trailing) {
                        ForEach(componentNames) { (element) in
                            ZStack(alignment: .trailing) {
                                Text(element)
                                Text("Opacity")
                                    .hidden()
                            }
                        }
                    }
                    Divider()
                    VStack(alignment: .trailing) {
                        ForEach(componentValues) { (element) in
                            ZStack(alignment: .trailing) {
                                Text(element)
                                Text("#000000")
                                    .hidden()
                            }
                        }
                    }.font(.system(.body, design: .monospaced))
                }
            }
            Spacer()
        }
        .foregroundColor(theme.systemColor.label)
        #endif
    }
    
    private func sectionHeader(color: PlatformColor, name: String, traitCollection: PlatformTraitCollection) -> some View {
        #if os(iOS) || os(tvOS)
        let resolvedColor = color.resolvedColor(with: traitCollection)
        #else
        let resolvedColor = color
        #endif
        
        return HStack(alignment: .center) {
            SwatchView(color: Color(resolvedColor))
                .customize(for: .tvOS) {
                    $0.frame(width: 64.0, height: 64.0).padding([.top, .leading, .bottom])
                }
                .customize(for: .iOS, .watchOS, .macOS) {
                    $0.frame(width: 32.0, height: 32.0)
                }
            
            Text(name.uppercased())
            Spacer()
        }.padding([.top, .bottom], 4.0)
    }
    
    private func colorInfoView(traitCollection: PlatformTraitCollection) -> some View {
        Group {
            hex(for: item.nativeColor, traitCollection: traitCollection)
                .customize(for: .iOS, modifier: {
                    $0.padding([.top, .bottom], 4.0)
                })
                .customize(for: .tvOS, modifier: { (view) in
                    Button(action: { }, label: { view.padding() })
                })
                .customize(for: .watchOS) {
                    $0.padding([.top, .bottom])
                }
            floats(for: item.nativeColor, traitCollection: traitCollection)
                .customize(for: .iOS, modifier: {
                    $0.padding([.top, .bottom], 4.0)
                })
                .customize(for: .tvOS, modifier: { (view) in
                    Button(action: { }, label: { view.padding() })
                })
                .customize(for: .watchOS) {
                    $0.padding([.top, .bottom])
                }
            hsb(for: item.nativeColor, traitCollection: traitCollection)
                .customize(for: .iOS, modifier: {
                    $0.padding([.top, .bottom], 4.0)
                })
                .customize(for: .tvOS, modifier: { (view) in
                    Button(action: { }, label: { view.padding() })
                })
                .customize(for: .watchOS) {
                    $0.padding([.top, .bottom])
                }
        }
    }
    
    var list: some View {
        List {
            Section {
                Text(item.description)
                    .customize(for: .tvOS, .watchOS) {
                        $0.padding()
                    }
            }
            Section(header: sectionHeader(color: item.nativeColor, name: "Light", traitCollection: lightTraitCollection)) {
                colorInfoView(traitCollection: lightTraitCollection)
            }
            Section(header: sectionHeader(color: item.nativeColor, name: "Dark", traitCollection: darkTraitCollection)) {
                colorInfoView(traitCollection: darkTraitCollection)
            }
            Section(header: sectionHeader(color: item.nativeColor, name: "Light - High Contrast", traitCollection: lightHighContrastTraitCollection)) {
                colorInfoView(traitCollection: lightHighContrastTraitCollection)
            }
            Section(header: sectionHeader(color: item.nativeColor, name: "Dark - High Contrast", traitCollection: darkHighContrastTraitCollection)) {
                colorInfoView(traitCollection: darkHighContrastTraitCollection)
            }
        }
        .navigationTitle(item.name)
    }
    
    var body: some View {
        #if os(iOS) || os(tvOS)
        return list
            .listStyle(GroupedListStyle())
        #else
        return list
            .listStyle(DefaultListStyle())
        #endif
    }
    
}



struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(item: ColorManifest().colors[0].items[0])
    }
}

