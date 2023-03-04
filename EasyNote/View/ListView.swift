//
//  ListView.swift
//  EasyNote
//
//  Created by Erdem Özbaykuş on 26.03.2023.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModal: ListViewModal
    @State private var isHover = false
    
    
        var body: some View {
            ZStack{
                if listViewModal.items.isEmpty{
                    onBoardView()
                }else{
                    VStack {
                        List{
                            ForEach(listViewModal.items) { item in
                                ListRowView(item: item)
                                    .onTapGesture {
                                        withAnimation(.easeOut(duration: 0.2)){
                                            listViewModal.updateItem(item: item)
                                        }
                                    }
                            }
                            .onDelete(perform: listViewModal.deleteItem)
                            .onMove(perform: listViewModal.moveItem)
                        }
                        .padding(.top, 20)
                        .listStyle(.plain)
                        
                        HStack{
                            Spacer()
                            ZStack {
                                Circle()
                                    .frame(height: 70)
                                
                                NavigationLink(destination: AddView()){
                                    Image(systemName: "plus")
                                        .font(.system(size: 25))
                                        .fontWeight(.heavy)
                                        .foregroundColor(.cyan)
                                }
                            }
                            .hoverEffect(.lift)
                            .padding(.trailing)
                            .shadow(radius:10, x:5, y:5)
                            
                        }
                    }
                }
            }
            .navigationTitle("EasyNote")
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(){
            ListView()
        }
        .environmentObject(ListViewModal())
    }
}

