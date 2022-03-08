//
//  plannedTasks.swift
//  aZenda
//
//  Created by Anne SaintGeorges on 02/11/2020.
//

import SwiftUI

struct PlannedTasksView: View {

    @State var planned: [Task] = taskArray
    //    var event : Task
    @State private var showCreateTask: Bool = false
    var body: some View {
        ZStack{
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            NavigationView{
                
                ScrollView{
                    VStack{
                        HStack {
                            Spacer()
                            Spacer()
                        }
                        Spacer()
                        
                        
                        ForEach(planned.indices,id:\.self) { index in
                            
                            NavigationLink(destination: DetailsView(myTask: $planned[index]))
                            {
                                PlannedCellView(tachePlan: planned[index])
                                
                            }
                            
                        }
                        Spacer()
                    }
                    
                }
                .background(backgroundColor)
                .navigationTitle("Tâches planifiées")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button(action: {
                    showCreateTask = true
                } , label: {
                    Image(systemName: "plus")
                        .accentColor(.purple)

                })
                .sheet(isPresented: $showCreateTask, content: {
                    CreateTaskView(showCreateTask: $showCreateTask, tasks: $planned)
                }))
                
            }
            
        }
        
    }
}

struct PlannedTasksView_Previews: PreviewProvider {
    static var previews: some View {
        PlannedTasksView()
    }
}


struct PlannedCellView: View {


    var tachePlan: Task = task1 
    
    var iconName = "pianokeys"
    var body: some View {

        
        VStack{
            
            Text(changeDateToString(date: tachePlan.dateTime))
                .fontWeight(.heavy)
                .multilineTextAlignment(.leading)
            
            
            HStack{
                tachePlan.icon?.image
                    .foregroundColor(.green)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text(tachePlan.name)
                Text(tachePlan.details)
            }
            //.padding(.vertical)
            
        }
        .padding(15)
        .frame(width: 390.0)
        .background(boxColor)
        .cornerRadius(boxRadius)
        .accentColor(.black)
    }
}

