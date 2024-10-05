import wollok.game.*
import granja.*
class Aspersor {
    var property position = game.at(0,0)
    const posicionesAdyacentes = [
        game.at(position.x() + 1, position.y()),   // Derecha
        game.at(position.x() - 1, position.y()),   // Izquierda
        game.at(position.x(), position.y() + 1),   // Arriba
        game.at(position.x(), position.y() - 1)    // Abajo
    ]


    method regar(posicion) {
        granja.plantasEn(posicion).forEach({ planta => planta.crecer()})
    } 

    method regarperimetro(){
        posicionesAdyacentes.forEach({posAdyacente => self.regar(posAdyacente)})
    }


    method image(){
        return "aspersor.png"
    }

    method plantar(_position){
        position = _position
        game.addVisual(self)
    }
}
