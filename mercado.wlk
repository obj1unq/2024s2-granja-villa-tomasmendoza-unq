import wollok.game.*
import granja.*
class Mercado {
    var property position = game.at(0,0)

    var property monedas = 1000

    const property productos = [] 

    method comprarProductos(precio, listaProductos){
        self.verificarSiPuedeComprar(precio)
        monedas -= precio
        self.agregarProductos(listaProductos)
    }

    method agregarProductos(listaDeProductos){
        productos.addAll(listaDeProductos)
    }

    method verificarSiPuedeComprar(precio){
        return if(not self.puedeComprar(precio)) self.error("No tengo el dinero suficiente")
    } 
    method puedeComprar(precio){
        return monedas >= precio
    }

    method image(){
        return "market.png"
    }
}