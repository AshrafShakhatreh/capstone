//
//  ProfileView.swift
//  Coursera Assigment
//
//  Created by ashraf shakhatreh on 26/03/2023.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
@State private var userName = ""
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Circle()
                        .fill(Color("headerColor"))
                        .frame(width: 40,height: 40)
                    Image(systemName: "arrow.left")
                        .foregroundColor(.white)
                }.onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
                Spacer()
                // Replace With Logo image
                Image("Logo 1")
                    .resizable()
                    .frame(width: 200,height: 50)
                Spacer()
                ZStack {
                    Circle()
                        .stroke(Color.gray)
                        .frame(width: 40,height: 40)
                    
                    Image("profile")
                        .resizable()
                        .clipShape(Circle()
                        )
                        .frame(width: 50,height: 50)

                }
            }
            .padding(.horizontal)
 
            Divider()
                .padding(.top)
            VStack(alignment: .leading) {
                ScrollView {
                    HStack {
                        Text("Personal information")
                            .bold()
                            .padding(.leading)
                        Spacer()
                    }
                    VStack(alignment: .leading) {
                        Text("Avatar")
                            .foregroundColor(Color.gray)
                        
                        HStack {
                            ZStack {
                                Circle()
                                    .stroke(Color.gray)
                                    .frame(width: 60,height: 60)
                                
                                Image("profile")
                                    .resizable()
                                    .frame(width: 40,height: 40)

                            }
                            HStack(spacing: 10) {
                                Button {} label: {
                                    
                                    Text("Change")
                                        .bold()
                                        .foregroundColor(Color.white)
                                        .padding(10)
                                        .background(Color("headerColor"))
                                        .cornerRadius(12)
                                }
                                
                                Button {} label: {
                                    Text("Remove")
                                        .bold()
                                        .foregroundColor(Color.gray)
                                        .padding(10)
                                        .border(Color("headerColor"))
                                        
                                }
                            }
                            Spacer()
                        }
                    }
                    .padding()
                    
                    VStack(alignment: .leading) {
                        Text("First Name")
                            .bold()
                            .foregroundColor(Color(uiColor: UIColor.gray))
                            .padding(.leading)
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(uiColor: UIColor.lightGray))
                            TextField("name", text: $userName)
                                .padding(.leading,6)
                        }
                        .padding(.horizontal)
                        .frame(height: 50)
                        
                    }
                    .padding(.top)
                    VStack(alignment: .leading) {
                        Text("Last Name")
                            .bold()
                            .foregroundColor(Color(uiColor: UIColor.gray))
                            .padding(.leading)
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(uiColor: UIColor.lightGray))
                            TextField("email", text: $userName)
                                .padding(.leading,6)
                        }
                        .padding(.horizontal)
                        .frame(height: 50)
                        
                    }
                    .padding(.top)
                    
                    VStack(alignment: .leading) {
                        Text("Email")
                            .bold()
                            .foregroundColor(Color(uiColor: UIColor.gray))
                            .padding(.leading)
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(uiColor: UIColor.lightGray))
                            TextField("email", text: $userName)
                                .padding(.leading,6)
                        }
                        .padding(.horizontal)
                        .frame(height: 50)
                        
                    }
                    .padding(.top)
                    
                    VStack(alignment: .leading) {
                        Text("Phone Number")
                            .bold()
                            .foregroundColor(Color(uiColor: UIColor.gray))
                            .padding(.leading)
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(uiColor: UIColor.lightGray))
                            TextField("email", text: $userName)
                                .padding(.leading,6)
                        }
                        .padding(.horizontal)
                        .frame(height: 50)
                        
                        Text("Email Notifications")
                            .bold()
                            .padding(.leading)
                            .padding(.top)
                        
                    }
                    .padding(.top)
                    
                    VStack(alignment: .leading) {
                    HStack {
                        checkBoxView()
                        Text("Order Statuses")
                        Spacer()
                    }
                     
                    HStack {
                        checkBoxView()
                        Text("Password Changes")
                    }
                    
                    HStack {
                        checkBoxView()
                        Text("Special Offers")
                    }
                    
                    HStack {
                        checkBoxView()
                        Text("NewsLetter")
                    }
                    }
                    .padding(.leading)
                    
                    Button {
                        
                    } label: {
                        ZStack {
                            Color.yellow
                            Text("Log out")
                                .foregroundColor(Color.black)
                        }
                        .border(Color.orange)
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .padding(.horizontal)
                        .padding(.top)
                    }
                    
                    HStack {
                        HStack(spacing: 10) {
                            Button {} label: {
                                Text("Save Change")
                                    .bold()
                                    .foregroundColor(Color.white)
                                    .padding(10)
                                    .background(Color("headerColor"))
                                    .cornerRadius(12)
                                    
                            }
                            Spacer()
                            Button {} label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color("headerColor"))
                                    Text("Discard Changes")
                                        .bold()
                                        .foregroundColor(Color.gray)
                                }
                            }
                            .frame()
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                        .padding(.horizontal)

                }
            }
            Spacer()
        }.navigationBarBackButtonHidden()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct checkBoxView: View {
    @State private var isTapped: Bool = false
    var body: some View {
        ZStack {
            Rectangle()
                .fill(isTapped ? Color("headerColor") : Color.white)
                .frame(width: 15,height: 16)
                .border(Color.black)
                .onTapGesture {
                    isTapped.toggle()
                }
            Image(systemName:"checkmark")
                .resizable()
                .frame(width: 9,height: 9)
                .foregroundColor(Color.white)
        }
    }
}
