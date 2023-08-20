//
//  SosyalimTabView.swift
//  SosyalimApp
//
//  Created by Ozan Çiçek on 19.08.2023.
//

import SwiftUI

struct SosyalimTabView: View {
    
    
    
    
    @State var selectedIndex: Int = 0
    
    var body: some View {
       
            
            
            TabView {
                HomeScreen_view(PPurl: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
                    .tabItem {
                        Label("Şarj İşlemleri", systemImage: "externaldrive.fill.badge.wifi")
                    }
            }
            
            
            /*
             CustomTabView(tabs: TabType.allCases.map({ $0.tabItem }), selectedIndex: $selectedIndex) { index in
             let type = TabType(rawValue: index) ?? .home
             getTabView(type: type)
             
             */
            
            
            
            
            
            
            
        
        
        
    }
  
      
      
      @ViewBuilder
      func getTabView(type: TabType) -> some View {
          switch type {
          case .home:
              HomeScreen_view(PPurl: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
          case .myFile:
              HomeScreen_view(PPurl: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
          case .profile:
              HomeScreen_view(PPurl: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
          }
      }



}

struct SosyalimTabView_Previews: PreviewProvider {
    static var previews: some View {
        SosyalimTabView()
            .environment(\.locale, .init(identifier: "tr"))
    }
}


struct TabItemData {
    let image: String
    let selectedImage: String
    let title: String
}

struct TabItemView: View {
    let data: TabItemData
    let isSelected: Bool
    
    var body: some View {
        VStack {
            
            
            Image(systemName: isSelected ? data.selectedImage :  data.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width * 0.08, height: 32)
                .animation(.default)
            
            Spacer().frame(height: 4)
            
            Text(data.title)
                .foregroundColor(isSelected ? .black : .gray)
                .font(.caption2)
        }
    }
}

struct TabBottomView: View {
    
    let tabbarItems: [TabItemData]
    var height: CGFloat = 70
    var width: CGFloat = UIScreen.main.bounds.width - 32
    @Binding var selectedIndex: Int
    
    var body: some View {
        HStack {
            Spacer()
            
            ForEach(tabbarItems.indices) { index in
                let item = tabbarItems[index]
                Button {
                    self.selectedIndex = index
                } label: {
                    let isSelected = selectedIndex == index
                    TabItemView(data: item, isSelected: isSelected)
                }
                Spacer()
            }
        }
        .frame(width: width, height: height)
        .background(Color.white)
        .cornerRadius(13)
        .shadow(radius: 5, x: 0, y: 4)
    }
}

struct CustomTabView<Content: View>: View {
    
    let tabs: [TabItemData]
    @Binding var selectedIndex: Int
    @ViewBuilder let content: (Int) -> Content
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedIndex) {
                ForEach(tabs.indices) { index in
                    content(index)
                        .tag(index)
                }
            }
            
            VStack {
                Spacer()
                TabBottomView(tabbarItems: tabs, selectedIndex: $selectedIndex)
            }
            .padding(.bottom, 8)
        }
    }
}

enum TabType: Int, CaseIterable {
    case home = 0
    case myFile
    case profile
    
    var tabItem: TabItemData {
        switch self {
        case .home:
            return TabItemData(image: "house", selectedImage: "house.fill", title: "Home")
        case .myFile:
            return TabItemData(image: "ic_myfile", selectedImage: "ic_myfile_selected", title: "My File")
        case .profile:
            return TabItemData(image: "ic_profile", selectedImage: "ic_profile_selected", title: "Me")
        }
    }
}
