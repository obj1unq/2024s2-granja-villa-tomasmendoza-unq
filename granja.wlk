import mercado.*
import wollok.game.*
object granja {
    const mercado1 = new Mercado(position = game.at(0, 0), monedas = 2000)
    const mercado2 = new Mercado(position = game.at(3, 0), monedas = 10)
    const mercado3 = new Mercado(position = game.at(8, 0), monedas = 3000)
    const property cultivos = #{}
    const property plantasCosechadas = []
    const property aspersores = []
    const mercados = [mercado1,mercado2,mercado3]

    method sembroUna (planta){
        cultivos.add(planta)
    }

    method plantarMercados(){
        mercados.forEach({mercado => game.addVisual(mercado)})
    }

    method agregarAspersor(aspersor){
        aspersores.add(aspersor)
    }

    method aspersoresRegar(){
        aspersores.forEach({aspersor => aspersor.regar()})
    }

    method plantasEn(position){
        return game.getObjectsIn(position).filter({obj => cultivos.contains(obj)})
    }

    method ganaciasDeVender(){
        return plantasCosechadas.sum({planta => planta.valor()})
    }

    method vaciarAlmacen(){
        plantasCosechadas.clear()
    }

    method almacenarCosecha(position){
        plantasCosechadas.addAll(self.plantasMadurasEn(position))
    }

    method plantasMadurasEn(position){
        return self.plantasEn(position).filter({planta => planta.esCosechable()})
    }

    method hayPlantaEn(position){
        return not self.plantasEn(position).isEmpty()
    }

    method hayMercadoEn(position){
        return game.getObjectsIn(position).any({obj => mercados.contains(obj)})
    }

    method mercandoEn(position){
        return game.getObjectsIn(position).filter({obj => mercados.contains(obj)}).get(0)
    }
}