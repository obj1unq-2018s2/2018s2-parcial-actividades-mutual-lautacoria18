class Actividad {
	//Punto 1
	var property idiomas = #{}
	method implicaEsfuerzo()= false
	method sirveBroncearse()= false
	method diasQueLleva()= 0
	
	//Punto 2
	method esViajeInteresante() {return idiomas.size() > 1}
	
	//Punto 6
	method actividadRecomendable(socio){return self.esViajeInteresante() 
												and socio.actividadLeAtrae(self)
													and not (socio.actividadesQueRealizo().contains(self))
}
}

class ViajeDePlaya inherits Actividad {
	//Punto 1
	var property largoDePlaya= 0
	
	override method diasQueLleva() {return largoDePlaya / 500}
	
	override method implicaEsfuerzo() {return largoDePlaya > 1200}
	
	override method sirveBroncearse()= true
	
}

class ExcursionACiudad inherits Actividad {
	//Punto 1
	var property cantDeAtracciones =0
	
	override method diasQueLleva() {return cantDeAtracciones / 2}
	
	override method implicaEsfuerzo() {return cantDeAtracciones >= 5 }
	
	override method sirveBroncearse() = false
	
	//Punto 2
	
	override method esViajeInteresante() {return super() or cantDeAtracciones == 5 }

}

class ExcursionACiudadTropical inherits ExcursionACiudad {
	//Punto 1
	override method diasQueLleva() {return super() + 1}
	
	override method sirveBroncearse() = true
	
}

class SalidaDeTraking inherits Actividad {
	//Punto 1
	var property kilometrosDeSenderos=0
	var property diasDeSol=0
	override method diasQueLleva() {return kilometrosDeSenderos / 50}
	
	override method implicaEsfuerzo() {return kilometrosDeSenderos > 80 }
	
	override method sirveBroncearse() {return diasDeSol > 200 or (diasDeSol.between(100, 200) and kilometrosDeSenderos > 120)}
	
	//Punto 2
	override method esViajeInteresante() {return super() and  diasDeSol > 140}
	}
	
object clasesDeGimnasia inherits Actividad {
	//Punto 3
	
 	 method idiomas() = "espaniol"
	override method implicaEsfuerzo()= true
	override method sirveBroncearse()= false
	override method diasQueLleva()= 1
	
	
	//Punto 6
	override method actividadRecomendable(socio){return socio.edad().between(20, 30)}
}


object tallerLiterario inherits Actividad{

	var property libros= #{}
	
	method idiomas(){return libros.flatMap{libro=> libro.idioma().asSet()}}
	

	
	 method hayLibroMayorA500() {return libros.any{libro=> libro.cantPaginas() > 500}}

	
 method sonDelMismoAutor() {return libros.all{libro => libro.autor() == libros.anyOne().autor()}}

	override method implicaEsfuerzo(){return libros.any{libro=> libro.cantPaginas() > 500} or (self.sonDelMismoAutor() and libros.size() > 1) } 
	
	override method sirveBroncearse()= false
	
	override method diasQueLleva(){return libros.size() + 1}
	
	
	
	override method actividadRecomendable(socio){return socio.idiomasQueHabla().size() > 1}
}
	
	

class Libro {
	var property idioma
	var property cantPaginas= 0
	var property autor
}



	
