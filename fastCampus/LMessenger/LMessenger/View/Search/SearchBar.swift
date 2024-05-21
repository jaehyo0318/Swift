//
//  SearchBar.swift
//  LMessenger
//
//  Created by  서재효 on 5/7/24.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    
    @Binding var text: String
    @Binding var shouldBecomeFirstResponder: Bool
    
    var onClickedSearchButton: (() -> Void)?
    
    init(text: Binding<String>,
         shouldBecomeFirstResponder: Binding<Bool>,
         onClickedSearchButton: (() -> Void)?) {
        self._text = text
        self._shouldBecomeFirstResponder = shouldBecomeFirstResponder
        self.onClickedSearchButton = onClickedSearchButton
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text,
                    shouldBecomeFirstResponder: $shouldBecomeFirstResponder,
                    onClickedSearchButton: onClickedSearchButton)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ searchView: UISearchBar, context: Context) {
        updateSearchText(searchView, context: context)
        updateBecomeFirstResponder(searchView, context: context)
        
    }
    
    private func updateSearchText(_ searchBar: UISearchBar, context: Context) {
        context.coordinator.setSearchText(searchBar, text: text)
    }
    
    private func updateBecomeFirstResponder(_ searchBar: UISearchBar, context: Context) {
        guard searchBar.canBecomeFirstResponder else { return }
        
        DispatchQueue.main.async {
            if shouldBecomeFirstResponder {
                guard !searchBar.isFirstResponder else { return }
                searchBar.becomeFirstResponder()
            } else {
                guard searchBar.isFirstResponder else { return }
                searchBar.resignFirstResponder()
            }
        }
    }
    
}

extension SearchBar {
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        @Binding var shouldBecomeFirstResponder: Bool
        
        var onClickedSearchButton: (() -> Void)?
        
        
        init(text: Binding<String>,
             shouldBecomeFirstResponder: Binding<Bool>,
             onClickedSearchButton: (() -> Void)?) {
            self._text = text
            self._shouldBecomeFirstResponder = shouldBecomeFirstResponder
            self.onClickedSearchButton = onClickedSearchButton
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//            searchBar.autocorrectionType = .no
//            searchBar.spellCheckingType = .no
            self.text = searchText
            
        }
        
        func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
            self.shouldBecomeFirstResponder = false
        }
        
        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            self.shouldBecomeFirstResponder = true
        }
        
        func setSearchText(_ searchBar: UISearchBar, text: String) {
            searchBar.text = text
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            onClickedSearchButton?()
        }
    }
}
