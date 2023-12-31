//
//  GridList.swift
//  ListasGrids
//
//  Created by Yery Castro on 17/2/23.
//

import SwiftUI

struct GridList: View {
    
    //let gridItem = [
      //  GridItem(.flexible())
    //]
    
   //let gridItem: [GridItem] = Array(repeating: .init(.flexible(maximum: 80)), count: 2)
    @ObservedObject var grid = ModeloColumnas()
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                LazyVGrid(columns: grid.gridItem, spacing: 30) {
                    ForEach(lista){ item in
                        Text(item.emoji)
                            .font(.system(size: 80))
                    }
                }
            }
            .navigationTitle("Grids")
            .toolbar {
                ToolbarItem {
                    Menu("Opciones") {
                        Section {
                            Button("1 columna"){
                                grid.columnas(num: 1)
                            }
                            Button("2 columnas"){
                                grid.columnas(num: 2)
                            }
                            Button("3 columnas"){
                                grid.columnas(num: 3)
                            }
                            Button("4 columnas"){
                                grid.columnas(num: 4)
                            }
                            Button("destruir users defaults"){
                                UserDefaults.standard.removeObject(forKey: "numero")
                            }
                        }
                    }
                }
            }
        }
    }
}

struct GridList_Previews: PreviewProvider {
    static var previews: some View {
        GridList()
    }
}
