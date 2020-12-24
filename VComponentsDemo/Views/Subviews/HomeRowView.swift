//
//  HomeRowView.swift
//  VComponentsDemo
//
//  Created by Vakhtang Kontridze on 12/22/20.
//

import SwiftUI
import VComponents

// MARK:- Home Row View
struct HomeRowView<Content>: View where Content: View {
    // MARK: Properties
    private let rowType: RowType
    enum RowType {
        case link(_ destination: Content)
        case custom(_ action: () -> Void)
    }
    
    private let title: String
    
    private let showSeparator: Bool
    
    // MARK: Initalizers
    init(
        title: String,
        destination: Content,
        showSeparator: Bool = true
    ) {
        self.title = title
        self.rowType = .link(destination)
        self.showSeparator = showSeparator
    }
}

extension HomeRowView where Content == Never {
    init(
        title: String,
        action: @escaping () -> Void,
        showSeparator: Bool = true
    ) {
        self.title = title
        self.rowType = .custom(action)
        self.showSeparator = showSeparator
    }
}

// MARK:- Body
extension HomeRowView {
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            switch rowType {
            case .link(let destination): NavigationLink(destination: destination, label: { rowView })
            case .custom(let action): Button(action: action, label: { rowView })
            }
            
            if showSeparator {
                Divider().padding(.vertical, 5)
            }
        })
    }
    
    private var rowView: some View {
        HStack(content: {
            Text(title)
                .font(.body)
                .foregroundColor(VComponents.ColorBook.primary)
            
            Spacer()
            
            VChevronButton(.plain(), direction: .right, action: {})
                .allowsHitTesting(false)
        })
    }
}

// MARK:- Preview
struct HomeRowView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView_Previews.previews
    }
}