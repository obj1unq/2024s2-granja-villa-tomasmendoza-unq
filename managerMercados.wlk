import mercado.*
import wollok.game.*
object managerMercados {
    const mercado1 = new Mercado(position = game.at(0, 0), monedas = 2000)
    const mercado2 = new Mercado(position = game.at(3, 0), monedas = 10)
    const mercado3 = new Mercado(position = game.at(8, 0), monedas = 3000)

    const mercados = [mercado1,mercado2,mercado3]

    method hayMercadoEn(position){
        return game.getObjectsIn(position).any({obj => mercados.contains(obj)})
    }

    method mercandoEn(position){
        return game.getObjectsIn(position).filter({obj => mercados.contains(obj)}).get(0)
    }

    method plantarMercados(){
        mercados.forEach({mercado => game.addVisual(mercado)})
    }

}