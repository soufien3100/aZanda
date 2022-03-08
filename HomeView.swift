
//
//  home.swift
//  aZenda
//
//  Created by Anne SaintGeorges on 02/11/2020.
//

import SwiftUI



struct Home: View {
    
    private var listeTachesPlanifiees:[Task] = [ task1, coursPiano, task2 ]
    
    @State var horaires: [Hours] = listHoraires
    
    @State var cpt = true
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                Spacer()
                Text("Voici votre semaine type")
                    .font(.title)
                Spacer()
                
                ForEach(horaires) { horaire in
                    
                    HoraireCellView(horaire: $horaires[horaires.firstIndex(of: horaire)!])
                }
                
                Spacer()
                
            }
            .frame(width: 410, height: 800)
            .background(backgroundColor)
            .navigationTitle("Semaine type")
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading:
                                    Button(action: {}, label: {
                                        Text("")
                                    })
                                
                                , trailing:
                                    Button(action: {
                                        let newHoraire = Hours(day: "Lundis", start: changeStringToDate(date:"24-11-2021 09:00")!, end: changeStringToDate(date:"24-11-2021 17:00")!)
                                        horaires.append(newHoraire)
                                        cpt.toggle()
                                    }, label: {
                                        Image(systemName: "plus")
                                            
                                    })
            )
            
        }
        .accentColor(fontColor)
        
            
            
        }
        
        
        
        
                                              
        
        
    }

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
struct HoraireCellView: View {

    @Binding  var horaire: Hours

    var body: some View {
       
            HStack{
                
                 Text(" Les")
                    .padding(.leading)
                 Picker( "", selection: $horaire.day){
                     ForEach(allDays.indices) { index in
                         Text(allDays[index]).tag(allDays[index])
                     }

                 }
                 .pickerStyle(WheelPickerStyle())
                 .frame(width: 100, height: 40, alignment: .center)
                 .clipped()


                 Text("de")
                    .padding(.leading, 2.0)
                    .padding(.trailing, -26.0)

                    //.padding(.trailing, -8)
                 DatePicker("", selection: $horaire.start, displayedComponents: .hourAndMinute)
                    .padding(.trailing, -4.0)
                    .padding(.leading, -22.0)

                   
                 Text("à")
                    .padding(.leading, 2.0)
                 DatePicker("", selection: $horaire.end, displayedComponents: .hourAndMinute)
                    .padding(.trailing, 18.0)
                    .padding(.leading, -27.0)

            }
    }
}

/////////////////////////////////////
func convertDateToString(tache: Date) -> String{
    
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    
    return formatter.string(from: tache)
}

//let dateSelectionee = convertDateToString(tache: dateFixe)
/////////////////////////////////////

var dateAconvert = "03-11-2010"

func convertStringToDate(date: String) -> Date? {
    
    let formatter1 = DateFormatter()
    formatter1.dateFormat = "HH:mm"
    
    return formatter1.date(from: date)
}
var dateConvertie = convertStringToDate(date: dateAconvert)






