class Socio {
	//Punto 4
	var property actividadesQueRealizo= #{}
	var property maximoDeActividades= 0
	
	var property idiomasQueHabla = #{}
	var property edad=0
	
	method esAdoradorDeSol() {return actividadesQueRealizo.all{actividad=> actividad.sirveBroncearse()}}
	
	method actividadesForzadas() {return actividadesQueRealizo.filter{actividad => actividad.implicaEsfuerzo()}}
	
	method registrarActividad(actividad) {if (actividadesQueRealizo.size() == maximoDeActividades) self.error("No puede realizar mas actividades")
									else actividadesQueRealizo.add(actividad)
	}
	//Punto 5
	
	method actividadLeAtrae(actividad)= true
	
	
}

class SocioTranquilo inherits Socio{
	
	override method actividadLeAtrae(actividad){return actividad.diasQueLleva() >= 4}
	
	
}

class SocioCoherente inherits Socio{
	
	override	method actividadLeAtrae(actividad){return if(self.esAdoradorDeSol()) actividad.sirveBroncearse()
		
												else actividad.impicaEsfuerzo()
	}
	
}

class SocioRelajado inherits Socio{
	
	override method actividadLeAtrae(actividad){return idiomasQueHabla.any{idioma => actividad.idiomas().contains(idioma)}}
	
	
}
