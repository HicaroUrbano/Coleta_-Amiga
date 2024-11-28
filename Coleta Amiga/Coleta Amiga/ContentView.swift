import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Fundo com gradiente para um visual mais atraente
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.purple.opacity(0.7)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                // Card central
                VStack(spacing: 20) {
                    Text("INICIE A COLETA DE DADOS AQUI")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                    
                    Text("SEJA FRANCO COM AS INFORMAÇÕES")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 20)
                    
                    // Botão
                    HStack(spacing: 20) {
                        NavigationLink(destination: FormularioView()) {
                            Text("Começar")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                .padding(.horizontal, 40)
            }
        }
    }
}

struct FormularioView: View {
    @State private var peso = ""
    @State private var idade = ""
    @State private var horasSono = ""
    @State private var showResult: Bool = false
    @State private var isEligible: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Fundo com gradiente para um visual mais atraente
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.purple.opacity(0.7)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
        VStack(alignment: .leading, spacing: 20) {
            
            
            
            Text("ANAMNESE VIRTUAL")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            Text("Essa é a área de coleta de informações, coloque todos os seus dados corretamente para dar validação para a sua doação.")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding(.horizontal, 20)
            
            // Campo de Peso
            TextField("Peso (kg)", text: $peso)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            // Campo de Idade
            TextField("Idade", text: $idade)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            // Campo de Horas de Sono
            TextField("Horas de Sono", text: $horasSono)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            // Botão de Enviar
            Button(action: {
                validarDados()
            }) {
                Text("Enviar")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            .padding(.top, 20)
            
            Spacer()
        }
        .padding(.top, 40)
        .navigationDestination(isPresented: $showResult) {
            if isEligible {
                TelaAptoView()
            } else {
                TelaNaoAptoView()
            }
        }
        }
        }
    }
    
    func validarDados() {
        guard let pesoValue = Double(peso), let idadeValue = Int(idade), let horasSonoValue = Double(horasSono) else {
            isEligible = false
            showResult = true
            return
        }
        
        if idadeValue >= 18 && idadeValue <= 69 && pesoValue >= 50 && horasSonoValue >= 8 {
            isEligible = true
        } else {
            isEligible = false
        }
        
        showResult = true
    }
}

struct TelaAptoView: View {
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Parabéns! Você está apto a doar!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                
                NavigationLink(destination: ContentView()) {
                    Text("Voltar à tela inicial")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.green)
                        .cornerRadius(8)
                }
                .padding(.horizontal, 40)
            }
        }
    }
}

struct TelaNaoAptoView: View {
    var body: some View {
        ZStack {
            Color.red.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Sentimos muito, você não está apto a doar.")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                
                NavigationLink(destination: ContentView()) {
                    Text("Voltar à tela inicial")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.red)
                        .cornerRadius(8)
                }
                .padding(.horizontal, 40)
            }
        }
    }
}

#Preview {
    ContentView()
}
