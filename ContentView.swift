import SwiftUI

struct ContentView: View {
    @StateObject private var timeManager = TimeManager()
    
    var body: some View {
        ZStack {
            // Fondo gris oscuro
            Color(red: 0.3, green: 0.3, blue: 0.3)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Barra superior
                HStack {
                    Button(action: {
                        // Acción para el botón de retroceso
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                    Text("TIU VIRTUAL")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                    
                    Spacer()
                }
                .background(Color(red: 0.2, green: 0.2, blue: 0.2))
                
                // Mensaje de información
                HStack {
                    Image(systemName: "info.circle")
                        .foregroundColor(.white)
                    
                    Text("El TIU virtual Offline (sin conexión a internet) se guardará por un periodo de 1 día")
                        .foregroundColor(.white)
                        .font(.caption)
                    
                    Spacer()
                }
                .padding()
                .background(Color.black)
                
                Spacer()
                
                // Reloj digital (rectángulo blanco)
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 200, height: 100)
                        .cornerRadius(5)
                    
                    Text(timeManager.clockTime())
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.black)
                }
                
                // Fecha
                Text(timeManager.formattedDate())
                    .foregroundColor(.white)
                    .padding(.top, 10)
                
                Spacer()
                
                // Aquí iría la imagen circular del perfil
                Circle()
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: 200, height: 200)
                
                // Información del estudiante
                Text("ESTUDIANTE GEA")
                    .foregroundColor(.white)
                    .font(.caption)
                    .padding(.top, 20)
                
                Text("ANDRÉ ALESSANDRO VELAZCO")
                    .foregroundColor(.red)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top, 5)
                
                VStack(alignment: .center, spacing: 5) {
                    Text("Código de alumno:")
                        .foregroundColor(.gray)
                    
                    Text("202318208")
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                    
                    Text("ID Banner:")
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                    
                    Text("N04087062")
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                    
                    Text("Ingeniería Industrial")
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                    
                    HStack {
                        Image(systemName: "mappin")
                            .foregroundColor(.red)
                        
                        Text("Campus Monterrico")
                            .foregroundColor(.gray)
                    }
                }
                .padding(.bottom, 30)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}