object managerAspersores {
    const property aspersores = []

        
    method agregarAspersor(aspersor){
        aspersores.add(aspersor)
    }

    method aspersoresRegar(){
        aspersores.forEach({aspersor => aspersor.regarperimetro()})
    }

}