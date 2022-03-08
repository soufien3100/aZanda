//
//  details.swift
//  aZenda
//
//  Created by Anne SaintGeorges on 02/11/2020.
//

import SwiftUI


struct DetailsView: View {
    //@State private var  showCreateTask = false
    @Binding var myTask : Task 
    // @State private var showCreateTask : Bool = false
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Spacer()
                
                /*Image(systemName: "arrowshape.turn.up.backward")
                 .imageScale(.large)
                 
                 
                 Spacer()
                 Text ("Details")
                 .font(.system(size: 20))
                 .bold()
                 .font(.title2)
                 
                 Spacer()*/
                
                
                
                
                Spacer()
            }
            
            Spacer ()
            
            VStack {
                Spacer()
                    TextField("Nom de tache ", text: $myTask.name)
                        .padding()
                        . frame(width: 380, height: 50)
                        .background(boxColor)
                        .cornerRadius(boxRadius)
                Spacer()
                Spacer()
                    IconView(task: $myTask)
                        .padding(.bottom,-8)
                        
                    DatePicker("", selection : $myTask.dateTime)
                        .padding()
                        .frame(width: 380, height: 50)
                        .background(boxColor)
                        .cornerRadius(boxRadius)
                        .labelsHidden()
                
                    TextField("Adresse",text : $myTask.address)
                        .padding()
                        . frame(width: 380, height: 50)
                        .background(boxColor)
                        .cornerRadius(boxRadius)
                
                    TextField("Details",text:$myTask.details)
                        .padding()
                        . frame(width: 380, height: 50)
                        .background(boxColor)
                        .cornerRadius(boxRadius)
                Spacer()
                Spacer()
            }
            
        }
        .padding(100)
        .background(backgroundColor)
        .ignoresSafeArea()
        .navigationBarTitle("Détails")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
    //-----------Ne pas toucher
    
    struct detailsView_Previews: PreviewProvider {
        static var previews: some View {
            DetailsView(myTask: .constant(dodoFull))
        }
    }
    
}

