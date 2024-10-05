import wollok.game.*
import cultivos.*
import granja.*
import aspersor.*
import managerAspersores.*
import managerMercados.*
object hector {
	var property position = game.at(0,0)
	const property image = "player.png"
	var property billetera = 0

	method sembrar(planta) {
		planta.sembrado(position)
		granja.sembroUna(planta)
	}

	method regar() {
		self.verificarSiHayPlanta("No hay planta para regar")
		granja.plantasEn(position).forEach({planta => planta.crecer()})
			
	}

	method cosechar(){
		self.verificarSiHayPlanta("No hay planta para cosechar")
		granja.almacenarCosecha(position)
		granja.plantasEn(position).forEach({planta => planta.cosechar()})
	}

	method verificarSiHayPlanta(message){
		return if(not granja.hayPlantaEn(position)) self.error(message) 
	}

	method inventario(){
		game.say(self, "Plantas cosechadas"+ granja.plantasCosechadas() + "Monedas actual: " + billetera)
	}

	method vender(){
		self.validarSiEstaEnMercado()
		managerMercados.mercandoEn(position).comprarProductos(granja.ganaciasDeVender(), granja.plantasCosechadas())
		billetera += granja.ganaciasDeVender()
		granja.vaciarAlmacen()
	}

	method validarSiEstaEnMercado(){
		return if(not self.estaEnMercado()) self.error("No puedo vender si no estoy en un mercado")
	}

	method estaEnMercado(){
		return managerMercados.hayMercadoEn(position)
	}

	method plantarAspersor(aspersor){
		aspersor.plantar(position)
		managerAspersores.agregarAspersor(aspersor)
	}
}