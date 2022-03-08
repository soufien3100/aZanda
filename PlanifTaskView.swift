//
//  planifTask.swift
//  aZenda
//
//  Created by Anne SaintGeorges on 02/11/2020.
//

import SwiftUI


/*var date = Detail(text: "Date", placehold: "JJ/MM/AAAA")
var heure = Detail(text: "Heure", placehold: "12h30")
var adresse = Detail(text: "Adresse", placehold: "124 Rue Jean-Macé")

var detailTab: [Detail] = [date, heure, adresse]
*/

struct PlanifTaskView: View {
    @Binding var task: Task 
    @Binding var showingPlanification: Bool
    var body: some View {
        NavigationView {
        VStack {
            HStack{
                Spacer()
                
            }
            VStack{
                       Spacer()
                DatePicker("Date", selection: $task.dateTime, in: Date()...)
                    .labelsHidden()
                Spacer()
                            TextField("Adresse", text: $task.address)
                                .padding(12)
                                .background(boxColor)
                                .cornerRadius(boxRadius)
                                .padding(.bottom,  10.0)
                               Spacer()
            }
        }
        .padding(15)
        .background(backgroundColor)
        .ignoresSafeArea(.all)
        .navigationTitle("Planification")
        .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: Button(action: {
                    task.address = ""
                    task.isPlanned = false
                    showingPlanification = false
                }, label: {
                    Text("Annuler")
                }), trailing:
                    Button(action: {
                        task.isPlanned = true
                        showingPlanification = false
                             }, label: {
                        Text("Planifier")
                    }))
            }
    
        }
}
// NE PAS TOUCHER--------------------
struct PlanifTaskView_Previews: PreviewProvider {
    static var previews: some View {
        PlanifTaskView(task: .constant(coursPianoVide), showingPlanification: .constant(true))
    }
}
//---------------------------
