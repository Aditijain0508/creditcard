//
//  LoginView.swift
//  Login
//


import SwiftUI

enum ViewLayoutConstants:CGFloat {
    case bottomPadding = 20
    case imageBottomPadding = 75
    case imageHeighWidth = 150
    case buttonHeight = 60
    case buttonWidth = 300
    case buttonRadius = 15
}

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

struct LoginView<Model>: View where Model: ILoginViewModel{
    
    @State private var email: String = ""
    @State private var password: String = ""
//
    let cornerRadius:CGFloat = 5.0
    
    @ObservedObject var viewModel: Model
    
    var body: some View {
        
        VStack {
            WelcomeText()
            UserImage()
            TextField(LoginViewConstants.enterUsername, text: $email)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(cornerRadius)
                .padding(.bottom, ViewLayoutConstants.bottomPadding.rawValue)
                .foregroundColor(Color.black)
            SecureField(LoginViewConstants.enterPassword, text: $password)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(cornerRadius)
                .foregroundColor(Color.black)
                .padding(.bottom, ViewLayoutConstants.bottomPadding.rawValue)
            
            ActivityIndicator(shouldAnimate: self.$viewModel.isLoading)
            Button(action: {
               // self.shouldAnimate = !self.shouldAnimate
                viewModel.login(email: email, password: password)
            }) {
                ButtonContent(text: LoginViewConstants.login)
            }.padding()
        }
        .onAppear(){
          //  self.shouldAnimate = false
            self.email = ""
            self.password = ""
        }
        .padding()
    }
}

//#if DEBUG
//struct ContentView_Previews : PreviewProvider {
//    static var previews: some View {
//        LoginView()
//            .previewInterfaceOrientation(.portrait)
//    }
//}
//#endif

struct WelcomeText : View {
    var body: some View {
        return Text(LoginViewConstants.welcomeMsg)
            .foregroundColor(.blue)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, ViewLayoutConstants.bottomPadding.rawValue)
    }
}

struct UserImage : View {
    var body: some View {
        return Image("bank_icon")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: ViewLayoutConstants.imageHeighWidth.rawValue, height: ViewLayoutConstants.imageHeighWidth.rawValue)
            .clipped()
            .padding(.bottom, ViewLayoutConstants.imageBottomPadding.rawValue)
    }
}

struct ButtonContent : View {
    @State var text: String = ""
    var body: some View {
        return Text(text)
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: ViewLayoutConstants.buttonWidth.rawValue, height: ViewLayoutConstants.buttonHeight.rawValue)
            .background(Color.cyan)
            .cornerRadius(ViewLayoutConstants.buttonRadius.rawValue)
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
