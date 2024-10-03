import wollok.game.*

class Maiz {
	var property position = game.at(0, 0)
	var estado = "baby"

	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "corn_"+ estado +".png"
	}

	method estado(){
		return estado
	}

	method sembrado(posicion){
		position = posicion
		game.addVisual(self)
	}

	method crecer(){
		estado = "adult"
	}

	method cosechar(){
		if(self.esCosechable()){
			game.removeVisual(self)
		}
	}

	method valor() {
		return 150
	}

	method esCosechable(){
		return estado == "adult"
	}
}

class Trigo {
	var property position = game.at(0, 0)
	var etapa = 0 

	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "wheat_"+ etapa + ".png"
	}
	method sembrado(posicion){
		position = posicion
		game.addVisual(self)
	}

	method crecer(){
		etapa = (etapa + 1) % 4
	}

	method etapa(){
		return etapa
	}

	method cosechar(){
		if(self.esCosechable()){
			game.removeVisual(self)
		}

	}

	method valor() {
		return (etapa - 1)* 100
	} 


	method esCosechable(){
		return etapa >= 2
	}
}
class Tomaco {
	var property position = game.at(0, 0)

	method image() {
		return "tomaco.png"
	}

	method sembrado(posicion){
		position = posicion
		game.addVisual(self)
	}

	method valor() {
		return 80
		
	} 

	method crecer(){
		position = game.at(position.x(), (game.height() - 1).min(position.y() + 1))
	}

	method cosechar(){
		game.removeVisual(self)
	}
	method esCosechable(){
		return true
	}
}