object neo {
  var energia = 100
  method energia() = energia
  method saltar(){
    energia = energia / 2
  }
  method vitalidad(){
    energia = energia / 10
  }
  method esElElegido() = true
}
object morfeo {
  var vitalidad = 8
  var estaCansado = false
  method vitalidad() = vitalidad
  method esElElegido() = false
  method saltar(){
    vitalidad = 0.max(vitalidad - 1)
    estaCansado = !estaCansado
  }
}
object trinity {
  method vitalidad() = 0
  method saltar(){

  }
  method esElElegido() = false
}
object nave {
  const pasajeros = []
  method cantPasajeros(){
    return pasajeros.size()
  }
  method subirPasajero(unPasajero){
    pasajeros.add(unPasajero)
  }
  method bajarPasajero(unPasajero){
    pasajeros.remove(unPasajero)
  }
  method pasajeroMayorVitalidad(){
    return pasajeros.max({e=> e.vitalidad()})
  }
  method pasajeroConMenorVitalidad(){
    return pasajeros.min({e => e.vitalidad()})
  }
  method estaEquilibrada(){
    return self.pasajeroMayorVitalidad().vitalidad() < 2 * self.pasajeroConMenorVitalidad().vitalidad()
  }
  method elElegidoEstaEnLaNave(){
    return pasajeros.any({e=> e.esElElegido()})
  }
  method naveChoca(){
    pasajeros.forEach({e=> e.saltar()})
    pasajeros.clear()
  }
  method naveAcelera(){
    pasajeros.pasajeroNoElegido().forEach({e=>e.saltar()})
  }
  method pasajeroNoElegido(){
    pasajeros.filter({e=>!e.esElElegido()})
  }
}