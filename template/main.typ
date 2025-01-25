#import "@preview/edukar:0.1.0": *

#let is-ppt = false

#show: conf.with(
  header-title: [Solucionario I Examen General UCSM 2025],
  header-area: [Ordinario],
  is-exam: false,
  is-ppt: is-ppt
)

// Pregunta 1
1. Al vender una cocina eléctrica en 650 soles, se ganó el 30%, ¿con qué precio se compró la cocina?
  + 500
  + 450
  + 540
  + 465
  + 480

  // Respuesta 1

  #answertitle

  $
    P_v = P_c + G -> 650 = P_c + 30%P_c
  $
  $
    650 = 130%P_c -> 650 = 130/100P_c
  $
  $
    65000/130 = P_c -> 500 = P_c
  $

  #answertext("A")[500]

#finishquestion(is-ppt)

// Pregunta 2
2. El sueldo de un empleado es proporcional al cuadrado de su edad. Si actualmente tiene 18 años, ¿dentro de cuántos años cuadruplicará su sueldo?
  + 18
  + 20
  + 16
  + 15
  + 19

  // Respuesta 2

  #answertitle

  S: sueldo

  E: edad

  $
  S/E^2 = "constante"
  $

  Planteamos la ecuación
  $
    S/18^2 = (4S)/X^2 -> x = sqrt(4.18^2)
  $
  $
    x = 18.2 -> x = 36
  $

  Entonces su sueldo se cuadruplicará después de 18 años.

  #answertext("A")[18]
#finishquestion(is-ppt)
