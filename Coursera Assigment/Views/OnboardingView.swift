//
//  OnboardingView.swift
//  Coursera Assigment
//
//  Created by ashraf shakhatreh on 26/03/2023.
//
import SwiftUI

struct Onboarding: View {
    @State private var searchText = ""
    @State private var isVisible = false
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var isLoggedIn = false 
    @State private var showAlert = false
    @State private var alertMessage = ""
    var body: some View {
        NavigationView {
            VStack {
                Image("Logo")
                    .resizable()
                    .frame(width: 160,height: 30)
                    .padding(.bottom, 5)
                    
                
                ZStack{
                    Rectangle().foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                    VStack(){
                        HStack{
                            Text("Little Lemon")
                                .foregroundColor(Color(red: 244/255, green: 206/255, blue: 20/255))
                                .font(Font.custom("Georgia", size: 40))
                                .bold()
                                .padding([.leading], 20)
                            Spacer()
                        }
                        .frame(height: 45)
                        HStack{
                            VStack(alignment: .leading) {
                                Text("Chicago")
                                    .foregroundColor(Color(red: 237/255, green: 239/255, blue: 238/255))
                                    .font(Font.custom("Georgia", size: 30))
                                    .fontWeight(.medium)
                                    .frame(height: 40)
                                Text("We are family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                                    .foregroundColor(.white)
                                    .font(Font.system(size: 16, weight: .medium))
                            }
                            Rectangle()
                                .aspectRatio(1, contentMode: .fit)
                                .overlay(
                                Image("resturentimage")
                                    .resizable()
                                    .scaledToFill()
                                )
                                .clipShape(Rectangle())
                                .cornerRadius(15)
                                .frame(width: 150, height: 150)
                        }
                        .padding([.leading, .trailing])
                        .padding(.bottom, 20)
                    }
                    
                }
                .frame(height: 240)
                
                VStack(alignment: .leading) {
                    NavigationLink(destination: HomeView(), isActive: $isLoggedIn) {
                        EmptyView()
                    }

                    CustomTextField(hintName: "First Name", placeHolder: "first Name", bindedText: $firstName)
                        .padding(.top)
                    CustomTextField(hintName: "Last Name", placeHolder: "Last Name", bindedText: $lastName)
                        .padding(.top)
                    CustomTextField(hintName: "E-mail", placeHolder: "Email", bindedText: $email)
                        .padding(.top)
                }
                
                Button {
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                        UserDefaults.standard.set(firstName, forKey: StorageCases.kFirstName.rawValue)
                        UserDefaults.standard.set(lastName, forKey: StorageCases.kLastName.rawValue)
                        UserDefaults.standard.set(email, forKey: StorageCases.kEmail.rawValue)
                        UserDefaults.standard.set(true, forKey: StorageCases.kIsLoggedIn.rawValue)
                        isLoggedIn = true
                        print("its ok")
                        
                    } else {
                        validateForm()
                    }
                } label: {
                    ZStack {
                        Text("Register")
                    }
                    .font(Font.system(size: 18, weight: .medium))
                        .frame(maxWidth: UIScreen.main.bounds.width - 65)
                        .padding([.leading, .trailing])
                        .padding([.top, .bottom], 10)
                        .foregroundColor(.white)
                        .background(Color(red: 73/255, green: 94/255, blue: 87/255))
                        
                        .cornerRadius(10)
                }
                .padding(.top)
                .alert(alertMessage, isPresented: $showAlert) {
                                Button("OK", role: .cancel) { }
                            }
                Spacer()
            } .onAppear {
                if UserDefaults.standard.bool(forKey: StorageCases.kIsLoggedIn.rawValue) {
                    isLoggedIn = true
                }
            }
        }
    }
    
    private func validateForm() {
        let firstNameIsValid = isValid(name: firstName)
        let lastNameIsValid = isValid(name: lastName)
        let emailIsValid = isValid(email: email)
        guard firstNameIsValid && lastNameIsValid && emailIsValid
        else {
            var invalidNameMessage = ""
            if firstName.isEmpty || lastName.isEmpty || !isValid(name: firstName) || !isValid(name: lastName) {
                invalidNameMessage = "Names can only contain letters and must have at least 2 characters\n\n"
            }
            var invalidEmailMessage = ""
            if email.isEmpty || !isValid(email: email) {
                
                invalidEmailMessage = "The email is invalid and cannot be blank"
            }
            
            self.alertMessage = "Found these error in the form: \n\n \(invalidNameMessage) \(invalidEmailMessage)"
            
            showAlert.toggle()
            return
        }
    }
    
    func isValid(name: String) -> Bool {
        guard !name.isEmpty,
              name.count > 1
        else { return false }
        for chr in name {
            if (!(chr >= "a" && chr <= "z") && !(chr >= "A" && chr <= "Z") && !(chr == " ") ) {
                return false
            }
        }
        return true
    }
    
    func isValid(email:String) -> Bool {
        guard !email.isEmpty else { return false }
        let emailValidationRegex = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$"
        let emailValidationPredicate = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)
        return emailValidationPredicate.evaluate(with: email)
    }
 
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}


struct CustomTextField: View {
    @State var hintName: String
    @State var placeHolder: String
    @Binding var bindedText: String
    var body: some View {
        VStack (alignment: .leading,spacing: 0) {
            Text("\(hintName)*")
                .foregroundColor(Color(red: 175/255, green: 175/255, blue: 175/255))
                .padding([.leading, .trailing])
                .bold()
            TextField(placeHolder, text: $bindedText)
                .padding([.leading, .trailing])
                .padding([.top, .bottom], 10)
                .overlay(
                RoundedRectangle(cornerRadius: 7)
                    .stroke(Color.gray, lineWidth: 1)
                )
                .padding([.leading, .trailing])
        }
    }
}
