function actualizarFecha() {
  const ahora = new Date();

  try {
    // Intentamos usar Intl con timeZone (forma precisa)
    const weekday = new Intl.DateTimeFormat('es-PE', { weekday: 'long', timeZone: 'America/Lima' }).format(ahora);
    const day    = new Intl.DateTimeFormat('es-PE', { day: '2-digit', timeZone: 'America/Lima' }).format(ahora);
    let month    = new Intl.DateTimeFormat('es-PE', { month: 'short', timeZone: 'America/Lima' }).format(ahora);
    const year   = new Intl.DateTimeFormat('es-PE', { year: 'numeric', timeZone: 'America/Lima' }).format(ahora);

    // Limpieza y formato: quitar posible punto final y tomar 3 primeras letras
    month = month.replace('.', '').substring(0,3);

    // Capitalizar día y mes (primera letra mayúscula)
    const diaTexto = weekday.charAt(0).toUpperCase() + weekday.slice(1);
    const mesTexto = month.charAt(0).toUpperCase() + month.slice(1);

    document.getElementById('fecha').textContent = `${diaTexto}, ${day} ${mesTexto} ${year}`;
  } catch (e) {
    // Fallback sencillo: calcular UTC -> Lima (UTC-5)
    const utc = ahora.getTime() + (ahora.getTimezoneOffset() * 60000);
    const limaDate = new Date(utc + (-5 * 3600000));

    const diasSemana = ['Domingo','Lunes','Martes','Miércoles','Jueves','Viernes','Sábado'];
    const meses = ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'];

    const diaTexto = diasSemana[limaDate.getDay()];
    const day = String(limaDate.getDate()).padStart(2,'0');
    const mesTexto = meses[limaDate.getMonth()];
    const year = limaDate.getFullYear();

    document.getElementById('fecha').textContent = `${diaTexto}, ${day} ${mesTexto} ${year}`;
  }
}

// Ejecutar ahora y luego cada minuto (la fecha cambia por día, pero actualizar cada minuto es suficiente)
actualizarFecha();
setInterval(actualizarFecha, 60_000);
