//
//  MainView.swift
//  aZenda
//
//  Created by Berta Munoz on 05/11/2020.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
          
            TabView {
                     
                    Home()
                        .tabItem {
                            Image(systemName: "clock.arrow.circlepath")
                            Text("Réglages")
                        }
                    PlannedTasksView()
                        .tabItem {
                            Image(systemName: "list.star")
                            Text("Planifiées")
                        }
                    TasksView()
                        .tabItem {
                            Image(systemName: "bolt")
                            Text("Libres")
                        }
            }
                
                //.accentColor(.black)
                
        
               
                
                
            .onAppear(){
                                UITabBar.appearance().barTintColor = UIColor(backgroundColor)
                            
                    
                }
        
            }
        }

    
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
