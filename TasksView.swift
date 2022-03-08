//
//  tasks.swift
//  aZenda
//
//  Created by Anne SaintGeorges on 02/11/2020.
//

import SwiftUI

struct TasksView: View {
    @State private var showCreateTask: Bool = false
    @State var taskList: [Task] = taskTab
    var body: some View {
        NavigationView {
            ZStack {
                backgroundColor
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    ScrollView {
                        Spacer()
                        Spacer()
                        ForEach (taskList.indices, id:\.self) { index in
                            TaskBoxStyle(task2: $taskList[index])
                        }
                    }
                    
                    .navigationTitle("Tâches Libres")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(trailing:
                                            Button(action: {
                                                showCreateTask = true
                                            }, label: {
                                                Image(systemName: "plus")
                                            })
                                            .sheet(isPresented: $showCreateTask) {
                                                CreateTaskView(showCreateTask: $showCreateTask, tasks: $taskList)
                                            })
                    
                }
                .padding(15)
            }
            
            
        }
        
    }
    
    
    
    
    //NE PAS TOUCHER--------------
    struct TasksView_Previews: PreviewProvider {
        static var previews: some View {
            TasksView()
        }
    }
    //------------------------
    struct TaskBoxStyle: View {
        @Binding var task2: Task
        var body: some View {
            
            NavigationLink(destination:
                            DetailsView(myTask: $task2),
                           label:{
                            HStack(alignment: .top){
                                Spacer()
                                task2.icon?.image
                                
                                Text(task2.name)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            
                           })
                
                .padding(8)
                .background(boxColor)
                .cornerRadius(boxRadius)
                .padding(.bottom, 10)
                .multilineTextAlignment(.center)
            
        }
        
    }
    
    struct FreeTasksNavView: View {
        var task = Task(name: "Erreur", dateTime: Date(), durationMinutes: 1, icon: Icons.rdv, details: "Erreur", address: "Non")
        var body: some View {
            VStack {
                Image(systemName: String(describing: task.icon))
                    .padding()
                Text(task.name)
                
            }
        }
    }
}
