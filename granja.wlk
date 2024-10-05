import wollok.game.*
object granja {

    const property cultivos = #{}
    const property plantasCosechadas = []

    method sembroUna (planta){
        cultivos.add(planta)
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


}