//
//  ContentView.swift
//  aZenda
//
//  Created by Anne SaintGeorges on 02/11/2020.
//

import SwiftUI
import Foundation

var emptyTask = Task(name: "", dateTime: Date(), durationMinutes: 0, icon: nil, details: "", address: "", isPlanned: false)

struct CreateTaskView: View {
    @Binding var showCreateTask: Bool
    @Binding var tasks: [Task]
    @State private var task: Task = emptyTask
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                Spacer()
                
                    TextField("À faire", text: $task.name)
                        .padding(12)
                        //.frame(width: boxFrame, alignment: .leading)
                        .background(boxColor)
                        .cornerRadius(boxRadius)
                        .padding(.bottom,  10.0)
                    
                    IconView(task: $task)
                
                TextField("Note", text: $task.details)
                    .padding(12)
                    //.frame(width: boxFrame, height: 70, alignment: .leading)
                    .background(boxColor)
                    .cornerRadius(boxRadius)
                    .padding(.bottom,  10.0)
                Spacer()
                PlanView(task: $task)
                Spacer()
            }
            .padding(15)
            .background(backgroundColor)
            .ignoresSafeArea()
            .navigationBarItems(leading: Button(action: {
                showCreateTask = false
            }, label: {
                Text("Annuler")
            }),
            trailing: Button(action: {
                tasks.append(task)
                    tasks.sort(by: {first,second in
                        return first.dateTime < second.dateTime
                    })
                
                showCreateTask = false
            }, label: {
                Text("Créer")
            }))
            .navigationTitle("Nouvelle tâche")
            .navigationBarTitleDisplayMode(.inline)
            
            }
        
            }
    
    }
// NE PAS TOUCHER---------
struct CreateTaskView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTaskView(showCreateTask: .constant(true), tasks: .constant([]))
    }
}
//--------------------

struct IconView: View {
    @Binding var task: Task
    var body: some View {
        ScrollView(.horizontal) {
            HStack{
                if task.icon == nil{
                    ForEach(Icons.allCases.indices) {
                        index in
                        let icon = Icons.allCases[index]
                        Button(
                            action: {
                                task.icon = icon
                            }, label: {
                                icon.image
                            })
                    }
                }else {
                    Button(
                        action: {
                            task.icon = nil
                        }, label: {
                            task.icon!.image
                            
                        })
                }
            }
        }
        .font(.title)
        .padding(8)
        .frame(width: 380,height: 50, alignment: .leading)
        .background(boxColor)
        .cornerRadius(boxRadius)
        .padding(.bottom, 10)
      
    }
}
struct PlanView: View {
    @Binding var task: Task
    @State private var showingPlanification: Bool = false
    var body: some View {
        HStack {
         Button(action: {
                showingPlanification = true
            },label: {
                if task.address.isEmpty {
                    Image(systemName: "map.fill")
                        .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                        .frame(width: 50, height: 50)
                        .background(boxColor)
                        .foregroundColor(.black)
                        .cornerRadius(15)
                } else {
                    Text(task.address)
                        .multilineTextAlignment(.center)
                        .padding(5)
                        .foregroundColor(.black)
                        .background(boxColor)
                        .cornerRadius(boxRadius)
                        .frame(maxHeight: 100)
                }
            })
            .frame(width: 100)
            .sheet(isPresented: $showingPlanification) {
                PlanifTaskView(task: $task, showingPlanification: $showingPlanification)
            }
            Spacer()
            Button(action: {
                showingPlanification = true
            },label: {
                if task.isPlanned == false {
                    Image(systemName: "calendar.badge.clock")
                        .font(.largeTitle)
                        .frame(width: 50, height: 50)
                        .background(boxColor)
                        .foregroundColor(.black)
                        .cornerRadius(15)
                } else if task.isPlanned == true {
                    Text(changeDateToString(date: task.dateTime))
                        .multilineTextAlignment(.center)
                        .padding(5)
                        .foregroundColor(.black)
                        .background(boxColor)
                        .cornerRadius(boxRadius)
                }
            })
            .sheet(isPresented: $showingPlanification, content: {
                PlanifTaskView(task: $task, showingPlanification: $showingPlanification
           ) })
            .frame(width: 100)
        }
        .padding(50)
    }
}


