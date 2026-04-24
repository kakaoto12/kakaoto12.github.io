import Foundation

class TimeManager: ObservableObject {
    @Published var currentTime = Date()
    private var timer: Timer?
    
    init() {
        // Iniciar el timer para actualizar cada segundo
        startTimer()
    }
    
    func startTimer() {
        // Asegurarse de que no haya un timer activo
        stopTimer()
        
        // Crear un nuevo timer que se actualiza cada segundo
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.updateTime()
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func updateTime() {
        currentTime = Date()
    }
    
    // Obtener la hora formateada para Lima, Perú (GMT-5)
    func formattedTime() -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: "America/Lima")
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: currentTime)
    }
    
    // Obtener solo la hora en formato HH:MM:SS para el rectángulo blanco
    func clockTime() -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: "America/Lima")
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: currentTime)
    }
    
    // Obtener la fecha formateada
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: "America/Lima")
        formatter.locale = Locale(identifier: "es_PE")
        formatter.dateFormat = "EEEE, dd MMM yyyy"
        return formatter.string(from: currentTime).capitalized
    }
    
    // Verificar si es horario de verano en Perú
    // Nota: Perú no observa el horario de verano actualmente, pero esta función
    // está incluida por si cambia la política en el futuro
    func isDaylightSavingTime() -> Bool {
        let timeZone = TimeZone(identifier: "America/Lima")!
        return timeZone.isDaylightSavingTime(for: currentTime)
    }
    
    deinit {
        stopTimer()
    }
}