//
//  LoginView.swift
//  Login
//


import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
let bottomPadding:CGFloat = 20
let imageBottomPadding:CGFloat = 75
let imageHeighWidth:CGFloat = 150
let buttonHeight:CGFloat = 60
let buttonWidth:CGFloat = 300
let buttonRadius:CGFloat = 15

struct LoginView : View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var shouldAnimate = false
    
    let cornerRadius:CGFloat = 5.0
    var viewModel: ILoginViewModel?
    
    var body: some View {
        
        VStack {
            WelcomeText()
            UserImage()
            TextField(LoginViewConstants.enterUsername, text: $email)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(cornerRadius)
                .padding(.bottom, bottomPadding)
            SecureField(LoginViewConstants.enterPassword, text: $password)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(cornerRadius)
                .padding(.bottom, bottomPadding)
            ActivityIndicator(shouldAnimate: self.$shouldAnimate)
            Button(action: {
                self.shouldAnimate = !self.shouldAnimate
                viewModel?.login(email: email, password: password)
            }) {
                ButtonContent(text: LoginViewConstants.login)
            }.padding()
        }
        .onAppear(){
            self.shouldAnimate = false
            self.email = ""
            self.password = ""
        }
        .padding()
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        LoginView()
            .previewInterfaceOrientation(.portrait)
    }
}
#endif

struct WelcomeText : View {
    var body: some View {
        return Text(LoginViewConstants.welcomeMsg)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, bottomPadding)
    }
}

struct UserImage : View {
    var body: some View {
        return Image("bank_icon")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: imageHeighWidth, height: imageHeighWidth)
            .clipped()
            .padding(.bottom, imageBottomPadding)
    }
}

struct ButtonContent : View {
    @State var text: String = ""
    var body: some View {
        return Text(text)
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: buttonWidth, height: buttonHeight)
            .background(Color.cyan)
            .cornerRadius(buttonRadius)
    }
}

struct ActivityIndicator: UIViewRepresentable {
    
    @Binding var shouldAnimate: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }

    func updateUIView(_ uiView: UIActivityIndicatorView,
                      context: Context) {
        if self.shouldAnimate {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
        
    }
    
}
