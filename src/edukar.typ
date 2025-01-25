#import "@preview/cetz:0.3.1"
#import "@preview/grayness:0.2.0": transparent-image

#let bg_color = color.rgb(20, 57, 100)
#let primary_color = color.rgb(76, 182, 146)

#let center-rect(body) = {
  set text(hyphenate: false)
  rect(
    width: 100%,
    height: 100%,
    fill: bg_color,
    [
      #align(horizon)[
        #body
      ]
    ]
  )
}

#let wsp_img = box(image("assets/whatsapp.png", width: 4%), baseline: 30%)
#let yt_img = box(image("assets/youtube.png", width: 4%), baseline: 30%)
#let fb_img = box(image("assets/facebook.png", width: 4%), baseline: 30%)
#let ig_img = box(image("assets/instagram.png", width: 4%), baseline: 30%)

#let page_height = 841.89pt
#let page_width = 595.28pt
#let panel_width = 55pt
#let left-panel() = {
  set text(white, weight: "bold")
  place(
    center + horizon,
    [
      #rotate(-90deg)[
        #move(dy:(-1 * (page_width / 2)) + (panel_width / 2))[
          #rect(
            width: page_height,
            height: panel_width,
            fill: bg_color,
          )[
            #align(horizon + center)[
              #grid(
                columns: (auto, auto, auto),
                gutter: 20pt,
                center-rect()[
                  Dictamos clases de reforzamiento para más información escribir al Whatsapp: #wsp_img +51 924 271 370
                ],
                center-rect()[
                  Para la compra de solucionarios de los exámenes entra a nuestra página web en #link("https://aedukar.com")[#text(primary_color)[www.aedukar.com]]
                ],
                center-rect()[
                  Síguenos en nuestras redes: \
                  #yt_img \@Edukar1 #h(10pt) #fb_img edukar1 #h(10pt) #ig_img \@edukar1
                ]
              )
            ]
          ]
        ]
      ]
    ]
  )
}

#let header-banner(title, area) = {
  set text(white, weight: "bold")
  set par(leading: 0.55em, justify: false)

  rect(
    width: 100%,
    height: 100%,
    fill: bg_color,
    [
      #align(horizon + center)[
        #grid(
          columns: (90pt, 240pt, 90pt),
          gutter: 3pt,
          center-rect()[#image("assets/dark-logo.png", width: 100%)],
          center-rect()[#title],
          center-rect()[#area]
        )
      ]
    ]
  )
}

#let custom-footer(page, is-ppt) = {
  set par(leading: 0.55em, justify: false)
  let text-size

  if is-ppt {
    text-size = 14pt
  } else {
    text-size = 10pt
  }

  set text(size: text-size)

  rect(
    width: 100%,
    height: 100%,
    stroke: none,
    [
        #grid(
          columns: (80%, 20%),
          gutter: 3pt,
          [#text(red, weight: "bold")[Prohibida su reproducción total o parcial sin autorización de los titulares de la obra. Derechos reservados D. LEG Nº 822]],
          [
            #align(right)[
              #counter(page).display("1")
            ]
          ]
        )
    ]
  )
}

// Custom Functions
#let get-between(p1, p2, perc) = {
 (
   (p1.first() + p2.first()) * perc,
   (p1.last() + p2.last()) * perc
 )
}

#let scr(it) = text(
  features: ("ss01",),
  box($cal(it)$),
)

#let circlebox(body) = {
  box(baseline: 40%, inset: 0%)[
    #set align(center + horizon)
    #circle(inset: 0%, outset: 0%)[#body]
  ]
}

// Function to show a series
#let show-series(
	  start, sep, items,
		variable: none,
		num-subs: none,
		text-size: 8pt,
		is-start: false,
		is-final: false
	) = {
   import cetz.draw: *
   set-style(
     stroke: 0.4pt,
   )

   let current-coord = start
   let num = items.len()

   if variable != none {
     let variable-pos = cetz.vector.add(start, (-(sep/2),0))
     content(variable-pos, text(size: text-size)[#variable], anchor: "south-east", padding: .1)
   }

   if is-start {
     let comma-pos = cetz.vector.add(start, (sep/2,0))
     for i in range(num - 1) {
       content(comma-pos, text(size: text-size)[;], anchor: "south")
       comma-pos = cetz.vector.add(comma-pos, (sep,0))
     }
   }

   for i in range(num) {
     content(current-coord, text(size: text-size)[#items.at(i)], anchor: "south", padding: .1)
     current-coord = cetz.vector.add(current-coord, (sep, 0))
   }

   let start-point = cetz.vector.add(start, (.1, 0))
   let down = (sep / 2) - .1

   if not is-final {
     let total-downs = items.len() - 1
     if num-subs != none {
       total-downs = num-subs
     }

     for i in range(total-downs) {
       let end-point = cetz.vector.add(start-point, (sep - .2, 0))
       bezier-through(
         start-point, (rel: (down, -.25)), end-point
       )
       start-point = cetz.vector.add(start-point, (sep, 0))
     }
   }
	}

#let underline-thickness = 0.5pt
#let underline-offset = 1pt
#set underline(stroke: underline-thickness, offset: underline-offset)
// Underline box
#let ubox(width: 45pt) = box(
  width: width,
  stroke: (bottom: underline-thickness),
  outset: (bottom: underline-offset),
)

#let answertitle = {
  text(
    primary_color,
    size: 14pt,
    weight: "semibold",
  )[Resolución]
}
#let topictext(topic) = {
  text(
    primary_color,
  )[_Tema_: #topic]
}
#let answertext(clave, value) = {
  text(
    primary_color,
  )[_*Respuesta:*_ #clave) #value]
}

#let finishquestion(is-ppt) = {
  if is-ppt {
    pagebreak()
  }
}

#let conf(
  header-title: none,
  header-area: none,
  portada: none,
  is-exam: true,
  is-ppt: false,
  doc
) = {

  // Global sets
  set par(leading: 0.55em, justify: true)
  set enum(
    numbering: "1.A)",
    number-align: start + top,
  )

  if not is-ppt {
    set text(hyphenate: true, size: 10pt)
    let bg_logo = read("assets/new-logo.jpg", encoding:none)

    set page(
      margin: 0pt,
    )
    [#portada]

    set page(
      paper: "a4",
      margin: auto,
      header: header-banner(header-title, header-area),
      columns: 2,
      background: move(
        dx: 0pt, dy: -40pt,
        rotate(-45deg)[#transparent-image(bg_logo,alpha:25%)]
      ),
      foreground: left-panel(),
      number-align: right,
      numbering: "1",
      footer: context [#custom-footer(page, is-ppt)]
    )
    doc

  } else {
    set text(hyphenate: true, size: 14pt)
    let bg_logo = read("assets/logo-ppt.jpg", encoding:none)

    set page(
      paper: "presentation-16-9",
      margin: (
        top: 12pt,
        bottom: auto,
        left: 12pt,
        right: 12pt,
      ),
      columns: 2,
      background: transparent-image(bg_logo,alpha:25%),
      number-align: right,
      numbering: "1",
      footer: context [#custom-footer(page, is-ppt)]
    )
    doc
  }
}
