//
//  LoginView.swift
//  EksiPlus
//
//  Created by Erdem Koçer on 5.03.2022.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @State private var isShowingMainView = false

    var body: some View {
            VStack {
                Form {
                    TextField("e-mail", text: $email)

                    TextField("şifre", text: $password)

                    Button("Giriş yap") {
                        RequestManager.getToken(username: email, password: password) { token in
                            if token != nil {
                                UserService.shared.bearer = token!
                                UserService.shared.isLoggedIn = true
                                isShowingMainView = true
                            } else {
                                debugPrint("error")
                            }
                        }
                    }
                    .foregroundColor(.green)
                    .font(.headline)

                    Section("") {
                        Button("Giriş yapmadan devam et") {
                            RequestManager.getAnonymousToken { token in
                                if token != nil {
                                    UserService.shared.bearer = token!
                                    isShowingMainView = true
                                } else {
                                    debugPrint("error")
                                }
                            }
                        }
                        .foregroundColor(.green)
                        .font(.headline)
                    }

                }
                Spacer()
            }
            .fullScreenCover(isPresented: $isShowingMainView) {
            } content: {
                MainView()
            }

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
