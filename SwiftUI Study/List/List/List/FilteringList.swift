//
//  FilteringList.swift
//  List
//
//  Created by 장희선 on 2022/01/19.
//

import SwiftUI

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let photo: String
}
func getPlaces() -> [Place] {
    return [Place(name: "서울", photo: "costa-rica"),
            Place(name: "제주", photo: "cuba"),
            Place(name: "부산", photo: "denver"),
            Place(name: "광주", photo: "seattle"),
            Place(name: "대구", photo: "ny")]
}

struct FilteringList: View {
    @State private var search: String = ""
    @State private var places = getPlaces()
    var body: some View {
        NavigationView {
            List(places) {place in
                HStack(alignment: .top) {
                    Image(place.photo)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(
                            cornerRadius: 16,
                            style: .continuous
                        )
                        )
                    Text(place.name)
                        .font(.title)
                }
                .listStyle(.plain)
                .searchable(text: $search)
                .onChange(of: search, perform: {value in
                    if !value.isEmpty && value.count >= 1 {
                        places = places.filter { place in
                            place.name.lowercased().hasPrefix(value.lowercased())
                        }
                    } else {
                        places = getPlaces()
                    }
                })
                .navigationTitle("Places")
            }
        }
    }
}

struct FilteringList_Preivews: PreviewProvider {
    static var previews: some View {
        FilteringList()
    }
}
