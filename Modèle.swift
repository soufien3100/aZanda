//
//  modèle.swift
//  aZenda
//
//  Created by Anne SaintGeorges on 02/11/2020.
//

import SwiftUI

struct Task: Identifiable {
  let id = UUID()
  var name: String
  var dateTime: Date
  var durationMinutes: Int
  var icon: Icons?
  var details: String
  var address: String
  var isPlanned: Bool = false
}

let allDays = ["lundis","mardis", "mercredis", "jeudis", "vendredis", "samedis", "dimanches"]

struct Hours: Identifiable, Equatable {
    let id = UUID()
    var day: String
    var start: Date
    var end: Date


var heureDebut: String{
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    return formatter.string(from: start)
}
var heureFin: String{
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    return formatter.string(from: end)
}
}

var taskArray:[Task] = []

//EXEMPLES TACHES ---------


var dodo: Task = Task(name: "Aller dormir", dateTime: Date(), durationMinutes: 0, icon: nil, details: "", address: "")

var dodoFull: Task = Task(name: "Aller dormir", dateTime: changeStringToDate(date: "12-04-2020 10:00") ?? Date(), durationMinutes: 300, icon: Icons.stylo, details: "", address: "maison", isPlanned : true)

var coursPiano = Task(name: "Cours de piano", dateTime: changeStringToDate(date: "12-12-2020 12:33") ?? Date(), durationMinutes: 120, icon: Icons.musique, details: "ne pas oublier partitions", address: "24 rue Mozart 54993 Plouf", isPlanned: true)

var coursPianoVide = Task(name: "Cours de piano", dateTime: Date(), durationMinutes: 0, icon: nil, details: "", address: "")

var task1 = Task(name: "Faire les tableaux de tasks", dateTime: Date(), durationMinutes: 30, icon: Icons.stylo, details: "non", address: "non plus")

var task2 = Task(name: "Faire marcher la planification de taches", dateTime: Date(), durationMinutes: 30, icon: Icons.stylo, details: "non", address: "non plus")

var task3 = Task(name: "Manger", dateTime: Date(), durationMinutes: 45, icon:Icons.bolt, details: "aaaaaaa", address: "la-bas")

var horaire1: Hours = Hours(day: "Lundis", start: changeStringToDate(date:"24-11-2021 11:31")!, end: changeStringToDate(date:"24-11-2021 12:31")!)
var horaire2: Hours = Hours(day: "Mardis",start: changeStringToDate(date:"24-10-2021 11:31")!, end: changeStringToDate(date:"24-10-2021 12:31")!)
var horaire3: Hours = Hours(day: "Mercredis",start: changeStringToDate(date:"24-12-2021 11:31")!, end: changeStringToDate(date:"24-12-2021 12:31")!)

let listHoraires = [horaire1, horaire2, horaire3]

var taskTab: [Task] = [task1, task2, task3]
//------------------------------.

var backgroundColor = Color(red: 249 / 255, green: 221 / 255, blue: 208 / 255)

var fontColor = Color(red: 20/255, green: 20/255, blue: 192/255)

var boxColor = Color(red: 253 / 255, green: 243 / 255, blue: 236 / 255)

var boxRadius: CGFloat = 15.0

var boxFrame: CGFloat = 300.00

func changeDateToString(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE dd MMM yyyy HH'h'mm"
    formatter.locale = Locale(identifier: "FR-fr")
    return formatter.string(from: date)
}

func changeStringToDate (date: String) -> Date? {
    let formatter1 = DateFormatter()
    formatter1.dateFormat = "dd-MM-yyyy HH:mm"
    return formatter1.date(from: date)
}



enum Icons: CaseIterable {
    case rdv, musique, stylo, sport, jeuVideo, chant, hautparleur, médecin, coeur, cinéma, courses, marche, appeler, bolt
    var imageName: String {
        switch self {
        case .rdv: return "book"
        case .musique: return "pianokeys"
        case .stylo: return "pencil"
        case .sport: return "sportcourt"
        case .jeuVideo: return "gamecontroller"
        case .chant: return "music.mic"
        case .hautparleur: return "megaphone"
        case .médecin: return "cross.circle"
        case .coeur: return "heart.fill"
        case .cinéma: return "film"
        case .courses: return "cart"
        case .marche: return "figure.walk"
        case .appeler: return "phone"
        case .bolt: return "bolt"
        }
    }
    var image: some View{
        return Image(systemName: self.imageName)
            .foregroundColor(self.color)
    }
    var color: Color {
        switch self {
        case .rdv:
            return Color.blue
        case .appeler:
            return Color.yellow
        case .chant:
            return Color.green
        case .cinéma:
            return Color.gray
        case .coeur:
            return Color.red
        case .courses:
            return Color.pink
        case .hautparleur:
            return Color.orange
        case .jeuVideo:
            return Color.black
        case .marche:
            return Color.purple
        case .médecin:
            return Color.blue
        case .stylo:
            return Color.yellow
        case .musique:
            return Color.red
        case .sport:
            return Color.orange
        case .bolt:
            return Color.yellow
        }
    }
}


struct Modèle_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
