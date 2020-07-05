//
//  ColorManifest.swift
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

/// Information on the colors provided by the Solar Design System.
struct ColorManifest {
    
    // MARK: - Constants
    
    /// A grouping of like colors.
    struct ColorSection: Identifiable {
        
        // MARK: - Properties
        
        var id: String {
            name
        }
        
        /// The name of the section.
        var name: String
        
        /// The items contained in the section.
        var items: [ColorItem]
        
    }
    
    /// A color provided by the design system.
    struct ColorItem: Identifiable {
        
        // MARK: - Properties
        
        var id: String {
            name
        }
        
        /// The name of the color.
        var name: String
        
        /// The description of the color.
        var description: String
        
        /// The color.
        var color: KeyPath<Theme, Color>
        
        /// The native color (Only needed to retreive the color's values).
        var nativeColor: PlatformColor
    }
    
    
    // MARK: - Properties
    
    var colors: [ColorSection] = [
        ColorSection(name: "Tints", items: [
            ColorItem(name: "Brand", description: "The color for branded elements in their normal state.", color: \.color.brand, nativeColor: .systemIndigo),
            ColorItem(name: "Positive", description: "The color for elements that are associated a positive trend or additive action in their normal state.", color: \.color.positive, nativeColor: .systemGreen),
            ColorItem(name: "Callout", description: "The color for elements that need to grab the user's attention in their normal state.", color: \.color.callout, nativeColor: .systemPurple),
            ColorItem(name: "Neutral", description: "The color for elements that are associated with a neutral trend in their normal state.", color: \.color.neutral, nativeColor: .systemBlue),
            ColorItem(name: "Warning", description: "The color for elements that need to grab the user's attention in their normal state.", color: \.color.warning, nativeColor: .systemOrange),
            ColorItem(name: "Negative", description: "The color for elements that are associated a negative trend or destructive action in their normal state.", color: \.color.negative, nativeColor: .systemRed)
        ]),
        ColorSection(name: "Backgrounds", items: [
            ColorItem(name: "Brand", description: "The background color for branded elements in their normal state.", color: \.color.brandBackground, nativeColor: PlatformColor.systemIndigo.withAlphaComponent(0.20)),
            ColorItem(name: "Positive", description: "The background color for elements that are associated a positive trend or additive action in their normal state.", color: \.color.positiveBackground, nativeColor: PlatformColor.systemGreen.withAlphaComponent(0.14)),
            ColorItem(name: "Callout", description: "The background color for elements that need to grab the user's attention in their normal state.", color: \.color.calloutBackground, nativeColor: PlatformColor.systemPurple.withAlphaComponent(0.20)),
            ColorItem(name: "Neutral", description: "The background color for elements that are associated with a neutral trend in their normal state.", color: \.color.neutralBackground, nativeColor: PlatformColor.systemBlue.withAlphaComponent(0.17)),
            ColorItem(name: "Warning", description: "The background color for elements that need to grab the user's attention in their normal state.", color: \.color.warningBackground, nativeColor: PlatformColor.systemOrange.withAlphaComponent(0.15)),
            ColorItem(name: "Negative", description: "The background color for elements that are associated a negative trend or destructive action in their normal state.", color: \.color.negativeBackground, nativeColor: PlatformColor.systemRed.withAlphaComponent(0.17))
        ])
    ]
    
    #if os(iOS)
    var systemColors: [ColorSection] = [
        ColorSection(name: "Labels", items: [
            ColorItem(name: "Label", description: "The color for text labels that contain primary content.", color: \.systemColor.label, nativeColor: PlatformColor.label),
            ColorItem(name: "Secondary Label", description: "The color for text labels that contain secondary content.", color: \.systemColor.secondaryLabel, nativeColor: PlatformColor.secondaryLabel),
            ColorItem(name: "Tertiary Label", description: "The color for text labels that contain tertiary content.", color: \.systemColor.tertiaryLabel, nativeColor: PlatformColor.tertiaryLabel),
            ColorItem(name: "Quaternary Label", description: "The color for text labels that contain quaternary content.", color: \.systemColor.quaternaryLabel, nativeColor: PlatformColor.quaternaryLabel),
            ColorItem(name: "Inverse Label", description: "The color for labels that contain primary content layered on top of a tint color.", color: \.systemColor.inverseLabel, nativeColor: UIColor(dynamicProvider: { (traits) -> UIColor in
                switch traits.userInterfaceStyle {
                case .light, .unspecified:
                    return .white
                case .dark:
                    return .black
                @unknown default:
                    return .white
                }
            }))
        ]),
        ColorSection(name: "Fills", items: [
            ColorItem(name: "Fill", description: "An overlay fill color for thin and small shapes.", color: \.systemColor.fill, nativeColor: PlatformColor.systemFill),
            ColorItem(name: "Secondary Fill", description: "An overlay fill color for medium-size shapes.", color: \.systemColor.secondaryFill, nativeColor: PlatformColor.secondarySystemFill),
            ColorItem(name: "Tertiary Fill", description: "An overlay fill color for large shapes.", color: \.systemColor.tertiaryFill, nativeColor: PlatformColor.tertiarySystemFill),
            ColorItem(name: "Quaternary Fill", description: "An overlay fill color for large areas that contain complex content.", color: \.systemColor.quaternaryFill, nativeColor: PlatformColor.quaternarySystemFill)
        ]),
        ColorSection(name: "Text", items: [
            ColorItem(name: "Placeholder", description: "The color for placeholder text in controls or text views.", color: \.systemColor.placeholderText, nativeColor: PlatformColor.placeholderText)
        ]),
        ColorSection(name: "Content", items: [
            ColorItem(name: "Link", description: "The color to use for links.", color: \.systemColor.link, nativeColor: PlatformColor.link)
        ]),
        ColorSection(name: "Backgrounds", items: [
            ColorItem(name: "Background", description: "The color for the main background of your interface.", color: \.systemColor.background, nativeColor: PlatformColor.systemBackground),
            ColorItem(name: "Secondary Background", description: "The color for content layered on top of the main background.", color: \.systemColor.secondaryBackground, nativeColor: PlatformColor.secondarySystemBackground),
            ColorItem(name: "Tertiary Background", description: "The color for content layered on top of secondary backgrounds.", color: \.systemColor.tertiaryBackground, nativeColor: PlatformColor.tertiarySystemBackground),
            ColorItem(name: "Grouped Background", description: "The color for the main background of your grouped interface.", color: \.systemColor.groupedBackground, nativeColor: PlatformColor.systemGroupedBackground),
            ColorItem(name: "Secondary Grouped Background", description: "The color for content layered on top of the main background of your grouped interface.", color: \.systemColor.secondaryGroupedBackground, nativeColor: PlatformColor.secondarySystemGroupedBackground),
            ColorItem(name: "Tertiary Grouped Background", description: "The color for content layered on top of secondary backgrounds of your grouped interface.", color: \.systemColor.tertiaryGroupedBackground, nativeColor: PlatformColor.tertiarySystemGroupedBackground)
        ]),
        ColorSection(name: "Separators", items: [
            ColorItem(name: "Separator", description: "The color for thin borders or divider lines that allows some underlying content to be visible.", color: \.systemColor.separator, nativeColor: PlatformColor.separator),
            ColorItem(name: "Opaque Separator", description: "The color for borders or divider lines that hides any underlying content.", color: \.systemColor.opaqueSeparator, nativeColor: PlatformColor.opaqueSeparator)
        ])
    ]
    #elseif os(tvOS)
    var systemColors: [ColorSection] = [
        ColorSection(name: "Labels", items: [
            ColorItem(name: "Label", description: "The color for text labels that contain primary content.", color: \.systemColor.label, nativeColor: PlatformColor.label),
            ColorItem(name: "Secondary Label", description: "The color for text labels that contain secondary content.", color: \.systemColor.secondaryLabel, nativeColor: PlatformColor.secondaryLabel),
            ColorItem(name: "Tertiary Label", description: "The color for text labels that contain tertiary content.", color: \.systemColor.tertiaryLabel, nativeColor: PlatformColor.tertiaryLabel),
            ColorItem(name: "Quaternary Label", description: "The color for text labels that contain quaternary content.", color: \.systemColor.quaternaryLabel, nativeColor: PlatformColor.quaternaryLabel),
            ColorItem(name: "Inverse Label", description: "The color for labels that contain primary content layered on top of a tint color.", color: \.systemColor.inverseLabel, nativeColor: UIColor(dynamicProvider: { (traits) -> UIColor in
                switch traits.userInterfaceStyle {
                case .light, .unspecified:
                    return .white
                case .dark:
                    return .black
                @unknown default:
                    return .white
                }
            }))
        ]),
        ColorSection(name: "Text", items: [
            ColorItem(name: "Placeholder", description: "The color for placeholder text in controls or text views.", color: \.systemColor.placeholderText, nativeColor: PlatformColor.placeholderText)
        ]),
        ColorSection(name: "Content", items: [
            ColorItem(name: "Link", description: "The color to use for links.", color: \.systemColor.link, nativeColor: PlatformColor.link)
        ]),
        ColorSection(name: "Separators", items: [
            ColorItem(name: "Separator", description: "The color for thin borders or divider lines that allows some underlying content to be visible.", color: \.systemColor.separator, nativeColor: PlatformColor.separator),
            ColorItem(name: "Opaque Separator", description: "The color for borders or divider lines that hides any underlying content.", color: \.systemColor.opaqueSeparator, nativeColor: PlatformColor.opaqueSeparator)
        ])
    ]
    #elseif os(watchOS)
    var systemColors: [ColorSection] = [
        ColorSection(name: "Labels", items: [
            ColorItem(name: "Label", description: "The color for text labels that contain primary content.", color: \.systemColor.label, nativeColor: PlatformColor.white),
            ColorItem(name: "Secondary Label", description: "The color for text labels that contain secondary content.", color: \.systemColor.secondaryLabel, nativeColor: PlatformColor.systemTextGrey),
            ColorItem(name: "Inverse Label", description: "The color for labels that contain primary content layered on top of a tint color.", color: \.systemColor.inverseLabel, nativeColor: UIColor.black)
        ]),
        ColorSection(name: "Backgrounds", items: [
            ColorItem(name: "Background", description: "The color for the main background of your interface.", color: \.systemColor.background, nativeColor: PlatformColor.black),
            ColorItem(name: "Secondary Background", description: "The color for content layered on top of the main background.", color: \.systemColor.secondaryBackground, nativeColor: PlatformColor.systemBackground.withAlphaComponent(0.14))
        ]),
        ColorSection(name: "Separators", items: [
            ColorItem(name: "Separator", description: "The color for thin borders or divider lines that allows some underlying content to be visible.", color: \.systemColor.separator, nativeColor: PlatformColor.darkGray),
        ])
    ]
    #elseif os(macOS)
    var systemColors: [ColorSection] = [
        ColorSection(name: "Labels", items: [
            ColorItem(name: "Label", description: "The color for text labels that contain primary content.", color: \.systemColor.label, nativeColor: PlatformColor.labelColor),
            ColorItem(name: "Secondary Label", description: "The color for text labels that contain secondary content.", color: \.systemColor.secondaryLabel, nativeColor: PlatformColor.secondaryLabelColor),
            ColorItem(name: "Tertiary Label", description: "The color for text labels that contain tertiary content.", color: \.systemColor.tertiaryLabel, nativeColor: PlatformColor.tertiaryLabelColor),
            ColorItem(name: "Quaternary Label", description: "The color for text labels that contain quaternary content.", color: \.systemColor.quaternaryLabel, nativeColor: PlatformColor.quaternaryLabelColor),
            ColorItem(name: "Inverse Label", description: "The color for labels that contain primary content layered on top of a tint color.", color: \.systemColor.inverseLabel, nativeColor: NSColor(name: "Inverse Label", dynamicProvider: { (appearance) -> NSColor in
                let appearanceName = appearance.bestMatch(from: [NSAppearance.Name.aqua, NSAppearance.Name.darkAqua])!
                switch appearanceName {
                case .aqua, .vibrantLight, .accessibilityHighContrastAqua, .accessibilityHighContrastVibrantLight:
                    return .white
                case .darkAqua, .vibrantDark, .accessibilityHighContrastDarkAqua, .accessibilityHighContrastVibrantDark:
                    return .black
                default:
                    return .white
                }
            }))
        ]),
        ColorSection(name: "Text", items: [
            ColorItem(name: "Text", description: "The color to use for text.", color: \.systemColor.text, nativeColor: PlatformColor.textColor),
            ColorItem(name: "Placeholder", description: "The color for placeholder text in controls or text views.", color: \.systemColor.placeholderText, nativeColor: PlatformColor.placeholderTextColor),
            ColorItem(name: "Selected Text", description: "The color to use for selected text.", color: \.systemColor.selectedText, nativeColor: PlatformColor.selectedTextColor),
            ColorItem(name: "Text Background", description: "The color to use for the background area behind text.", color: \.systemColor.textBackground, nativeColor: PlatformColor.textBackgroundColor),
            ColorItem(name: "Selected Text Background", description: "The color to use for the background of selected text.", color: \.systemColor.selectedTextBackground, nativeColor: PlatformColor.selectedTextBackgroundColor),
            ColorItem(name: "Keyboard Focus Indicator", description: "The color to use for the keyboard focus ring around controls.", color: \.systemColor.keyboardFocusIndicator, nativeColor: PlatformColor.keyboardFocusIndicatorColor),
            ColorItem(name: "Unemphasized Selected Text", description: "The color to use for selected text.", color: \.systemColor.unemphasizedSelectedText, nativeColor: PlatformColor.unemphasizedSelectedTextColor),
            ColorItem(name: "Unemphasized Selected Text Background", description: "The color to use for the text background in an unemphasized context.", color: \.systemColor.unemphasizedSelectedTextBackground, nativeColor: PlatformColor.unemphasizedSelectedTextBackgroundColor)
        ]),
        ColorSection(name: "Content", items: [
            ColorItem(name: "Link", description: "The color to use for links.", color: \.systemColor.link, nativeColor: PlatformColor.linkColor),
            ColorItem(name: "Selected Content Background", description: "The color to use for the background of selected and emphasized content.", color: \.systemColor.selectedContentBackground, nativeColor: PlatformColor.selectedContentBackgroundColor),
            ColorItem(name: "Unemphasized Selected Content Background", description: "The color to use for selected and unemphasized content.", color: \.systemColor.unemphasizedSelectedContentBackground, nativeColor: PlatformColor.unemphasizedSelectedContentBackgroundColor)
        ]),
        ColorSection(name: "Menu", items: [
            ColorItem(name: "Selected Menu Item Text", description: "The color to use for the text in menu items.", color: \.systemColor.selectedMenuItemText, nativeColor: PlatformColor.selectedMenuItemTextColor)
        ]),
        ColorSection(name: "Table", items: [
            ColorItem(name: "Grid", description: "The color to use for the optional gridlines, such as those in a table view.", color: \.systemColor.grid, nativeColor: PlatformColor.gridColor),
            ColorItem(name: "Header Text", description: "The color to use for text in header cells in table views and outline views.", color: \.systemColor.headerText, nativeColor: PlatformColor.headerTextColor),
            ColorItem(name: "Alternating Content Backgrounds - 0", description: "The colors to use for alternating content, typically found in table views and collection views.", color: \.systemColor.alternatingContentBackgrounds[0], nativeColor: PlatformColor.alternatingContentBackgroundColors[0]),
            ColorItem(name: "Alternating Content Backgrounds - 1", description: "The colors to use for alternating content, typically found in table views and collection views.", color: \.systemColor.alternatingContentBackgrounds[1], nativeColor: PlatformColor.alternatingContentBackgroundColors[1]),
        ]),
        ColorSection(name: "Controls", items: [
            ColorItem(name: "Control Accent", description: "The user's current accent color preference.", color: \.systemColor.controlAccent, nativeColor: PlatformColor.controlAccentColor),
            ColorItem(name: "Control", description: "The color to use for the flat surfaces of a control.", color: \.systemColor.control, nativeColor: PlatformColor.controlColor),
            ColorItem(name: "Control Background", description: "The color to use for the background of large controls, such as scroll views or table views.", color: \.systemColor.controlBackground, nativeColor: PlatformColor.controlBackgroundColor),
            ColorItem(name: "Control Text", description: "The color to use for text on enabled controls.", color: \.systemColor.controlText, nativeColor: PlatformColor.controlTextColor),
            ColorItem(name: "Disabled Control Text", description: "The color to use for text on disabled controls.", color: \.systemColor.disabledControlText, nativeColor: PlatformColor.disabledControlTextColor),
            ColorItem(name: "Selected Control", description: "The color to use for the face of a selected control—that is, a control that has been clicked or is being dragged.", color: \.systemColor.selectedControl, nativeColor: PlatformColor.selectedControlColor),
            ColorItem(name: "Selected Control Text", description: "The color to use for text in a selected control—that is, a control being clicked or dragged.", color: \.systemColor.selectedControlText, nativeColor: PlatformColor.selectedControlTextColor),
            ColorItem(name: "Alternate Selected Control Text", description: "The color to use for text in a selected control.", color: \.systemColor.alternateSelectedControlText, nativeColor: PlatformColor.alternateSelectedControlTextColor),
            ColorItem(name: "Scrubber Textured Background", description: "The patterned color to use for the background of a scrubber control.", color: \.systemColor.scrubberTexturedBackground, nativeColor: PlatformColor.scrubberTexturedBackground)
        ]),
        ColorSection(name: "Window", items: [
            ColorItem(name: "Window Background", description: "The color to use for the window background.", color: \.systemColor.windowBackground, nativeColor: PlatformColor.windowBackgroundColor),
            ColorItem(name: "Window Frame Text", description: "The color to use for text in a window's frame.", color: \.systemColor.windowFrameText, nativeColor: PlatformColor.windowFrameTextColor),
            ColorItem(name: "Under Page Background", description: "The color to use in the area beneath your window's views.", color: \.systemColor.underPageBackground, nativeColor: PlatformColor.underPageBackgroundColor),
        ]),
        ColorSection(name: "Highlights and Shadows", items: [
            ColorItem(name: "Find Highlight", description: "The highlight color to use for the bubble that shows inline search result values.", color: \.systemColor.findHighlight, nativeColor: PlatformColor.findHighlightColor),
            ColorItem(name: "Highlight", description: "The color to use as a virtual light source on the screen.", color: \.systemColor.highlight, nativeColor: PlatformColor.highlightColor),
            ColorItem(name: "Shadow", description: "The color to use for virtual shadows cast by raised objects on the screen.", color: \.systemColor.shadow, nativeColor: PlatformColor.shadowColor),
        ]),
        ColorSection(name: "Separators", items: [
            ColorItem(name: "Separator", description: "The color for thin borders or divider lines that allows some underlying content to be visible.", color: \.systemColor.separator, nativeColor: PlatformColor.separatorColor),
        ])
    ]
    #endif
}
