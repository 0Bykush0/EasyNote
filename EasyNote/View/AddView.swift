//
//  AddView.swift
//  EasyNote
//
//  Created by Erdem Özbaykuş on 28.03.2023.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModal: ListViewModal
    @State var textFieldText: String = ""
    @State var isPin: Bool = false
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
        
    
    var body: some View {
        ScrollView {
            VStack{
                TextField("Write something", text: $textFieldText)
                    .fontWeight(.heavy)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(12)
                    
                
                Button( action:saveButtonPressed,
                        label: {
                Text("Save")
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(12)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .shadow(radius: 10, y:5)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add New Note")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed(){
        if textIsAppropriate(){
            listViewModal.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count == 0{
            alertTitle = "There is nothing to save!!!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModal())
    }
    
}
