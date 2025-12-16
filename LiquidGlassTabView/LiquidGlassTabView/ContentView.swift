//
//  ContentView.swift
//  LiquidGlassTabView
//
//  Created by 윤병일 on 12/16/25.
//

import SwiftUI

enum Tabs: String {
  case home, profile, settings, search
}

struct ContentView: View {
  
  @State var selectedTab: Tabs = .home
  @State var searchString: String = ""
  
  var body: some View {
    TabView(selection: $selectedTab) {
      Tab("Home", systemImage: "house", value: .home) {
        Color.green.ignoresSafeArea()
      }
      
      Tab("Profile", systemImage: "person", value: .profile) {
        Color.orange.ignoresSafeArea()
      }
      
      Tab("Settings", systemImage: "gearshape", value: .settings) {
        Color.blue.ignoresSafeArea()
      }
      
      Tab(value: .search, role: .search) {
        NavigationStack {
          List {
            Text("Search Screen")
          }
          .navigationTitle("Search")
          .searchable(text: $searchString)
        }
      }
    }
    .tabViewBottomAccessory {
      Text(selectedTab.rawValue)
    }
  }
}

#Preview {
  ContentView()
}
