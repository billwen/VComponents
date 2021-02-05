//
//  VMenuPickerDemoView.swift
//  VComponentsDemo
//
//  Created by Vakhtang Kontridze on 2/2/21.
//

import SwiftUI
import VComponents

// MARK:- V Menu Picker Demo View
struct VMenuPickerDemoView: View {
    // MARK: Properties
    static let navigationBarTitle: String = "Menu Picker"
    
    @State private var selection: ComponentRGBItem = .red
    @State private var state: VMenuPickerState = .enabled
    @State private var menuPickerButtonType: VNavigationLinkButtonTypeHelper = .secondary
    @State private var contentType: ComponentContentType = .text
}

// MARK:- Body
extension VMenuPickerDemoView {
    var body: some View {
        VBaseView(title: Self.navigationBarTitle, content: {
            DemoView(component: component, settings: settings)
        })
    }
    
    @ViewBuilder private func component() -> some View {
        switch (menuPickerButtonType.preset, contentType) {
        case (let preset?, .text):
            VMenuPicker(
                preset: preset,
                state: state,
                selection: $selection,
                title: buttonTitle
            )
        
        case (let preset?, .custom):
            VMenuPicker(
                preset: preset,
                state: state,
                selection: $selection,
                label: buttonContent
            )
            
        case (nil, _):
            VMenuPicker(
                state: state,
                selection: $selection,
                label: buttonContent
            )
        }
    }
    
    @DemoViewSettingsSectionBuilder private func settings() -> some View {
        DemoViewSettingsSection(content: {
            VSegmentedPicker(selection: $state, headerTitle: "State")
        })
        
        DemoViewSettingsSection(content: {
            VWheelPicker(
                selection: $menuPickerButtonType,
                headerTitle: "Type"
            )
                .onChange(of: menuPickerButtonType, perform: { type in
                    if type == .custom { contentType = .custom }
                })
            
            VSegmentedPicker(
                selection: $contentType,
                headerTitle: "Label Content",
                disabledItems: menuPickerButtonType == .custom ? [.text] : []
            )
        })
    }
    
    private var buttonTitle: String {
        switch menuPickerButtonType.preset {
        case .square: return "Lorem"
        default: return "Lorem ipsum"
        }
    }

    private func buttonContent() -> some View { DemoIconContentView() }
}

// MARK:- Helpers
extension VMenuPickerState: VPickableTitledItem {
    public var pickerTitle: String {
        switch self {
        case .enabled: return "Enabled"
        case .disabled: return "Disabled"
        }
    }
}

// MARK:- Preview
struct VMenuPickerDemoView_Previews: PreviewProvider {
    static var previews: some View {
        VMenuPickerDemoView()
    }
}