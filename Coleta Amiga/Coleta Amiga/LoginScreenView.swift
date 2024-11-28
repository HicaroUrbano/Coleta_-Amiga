import SwiftUI

struct LoginScreenView: View {
    @State private var isSignedIn = false // Variável para controlar a navegação
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Fundo com gradiente
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.purple.opacity(0.7)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                // Conteúdo principal
                VStack(spacing: 30) {
                    // Ícone ou imagem no topo
                    Image(systemName: "hand.thumbsup.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                    
                    // Formulário de login
                    VStack(spacing: 20) {
                        // Campo de e-mail
                        TextField("Enter your email", text: .constant(""))
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 2)
                        
                        // Campo de senha
                        SecureField("Enter your password", text: .constant(""))
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 2)
                        
                        // Botão de Login
                        Button(action: {
                            isSignedIn = true // Atualiza o estado de navegação
                        }) {
                            Text("Sign In")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                    .padding(.horizontal, 30)
                    
                    // Link para "Esqueceu a senha"
                    Button(action: {
                        print("Forgot Password tapped")
                    }) {
                        Text("Forgot password?")
                            .font(.footnote)
                            .foregroundColor(.white)
                            .underline()
                    }
                    
                    Spacer()
                }
                .padding(.top, 100)
                
                // Navegação condicional
                NavigationLink(destination: ContentView(), isActive: $isSignedIn) {
                    EmptyView() // Garante a navegação sem botão explícito
                }
            }
        }
    }
}


// Preview
struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenView()
    }
}
