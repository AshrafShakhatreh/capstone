//
//  ContentView.swift
//  Coursera Assigment
//
//  Created by ashraf shakhatreh on 25/03/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var isProfileButtonTapped = false
    var body: some View {
        NavigationView {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                // this will be little lemon logo
                Image("Logo 1")
                    .resizable()
                    .frame(width: 200,height: 50)
                Spacer()
                // replace with person image
                Image("profile")
                    .resizable()
                    .clipShape(Circle()
                    )
                    .frame(width: 50,height: 50)
                    .onTapGesture {
                        isProfileButtonTapped.toggle()
                    }
                
            }
            ZStack {
                Color("headerColor")
                VStack(alignment: .leading){
                    Text("Little Lemon")
                        .foregroundColor(Color("logoYellowColor"))
                        .font(.title)
                        .bold()
                    
                    Text("Chicago")
                        .foregroundColor(Color.white)
                        .font(.title2)
                        .bold()
                        .padding(1)
                    
                    Text("we are family owned\n Mediterranean restaurant\n focused on traditional\n recipes served with a\n modern twist  ")
                        .foregroundColor(Color.white)
                        .font(.title2)
                        .padding(.top)
                    
                    HStack {
                        Button {
                            
                        } label: {
                            ZStack {
                                Circle()
                                    .fill(Color.gray)
                                    .frame(width: 50,height: 50)
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(Color.black)
                            }
                        }
                        Spacer()
                    }
                    
                }
                .padding(.leading)
            }
            .frame(height: 330)
            VStack {
                Text("ORDER FOR DELIVERY!")
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(viewModel.foodSections) { item in
                            ZStack {
                                //ADD Dishes to this list
                                // fix background color
                                Text(item.name)
                                    .bold()
                                    .padding(10)
                                    .background(Color(uiColor: UIColor.lightGray))
                                    .foregroundColor( Color("headerColor"))
                                    .cornerRadius(22)
                            }
                            
                        }
                    }
                }
                Divider().padding(.top)
            }
            .padding(.leading)
            VStack {
                
                ScrollView (.vertical,showsIndicators: false){
                    ForEach(viewModel.foodItems) { items in
                        // extract this v stack into separte component and fill it with model array
                        VStack(alignment: .leading, spacing: 0) {
                            Text(items.dishName)
                                .font(.title3)
                                .bold()
                            HStack {
                                Text(items.description)
                                    .lineLimit(2)
                                // add images
                                Spacer()
                                Image("")
                                    .frame(width: 70, height: 70)
                                    .background(Color.red)
                                    .padding(.trailing,4)
                            }
                            
                            Text(items.price)
                            Divider()
                        }
                    }
                }
            }.padding(.leading)
            Spacer()
            
            NavigationLink(destination: ProfileView(), isActive: $isProfileButtonTapped) {
                EmptyView()
            }
        }
        }.navigationBarBackButtonHidden(true)
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
