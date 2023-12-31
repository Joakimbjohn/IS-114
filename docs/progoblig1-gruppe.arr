include image
include color

stolpe = circle(5, "solid", "black") 
#Definerer "stolpen" som brikkene trees på. Stolpen tegnes over alle brikkene slik at den ikke forsvinner

piece1 = overlay-align(  #Største brikken
  "center", "middle", stolpe,
  circle(50, "solid", "green")
  ) 

piece2 = overlay-align( #Nest største brikken
  "center", "middle", stolpe,
  circle(40, "solid", "red")
  ) 

piece1n2 = overlay-align("center", "middle", piece2, piece1)
#piece1n2 består av både den største og den nest største brikken

piece3 = overlay-align(    #Nest minste brikken
  "center", "middle", stolpe,
  circle(30, "solid", "blue")
  ) 
#Nest minste brikken

piece4 = overlay-align(    #Minste brikken
  "center", "middle", stolpe,
  circle(20, "solid", "pink")
  ) 

piece3n4 = overlay-align("center", "middle", piece4, piece3)  #piece3n4 består av både den minste og den nest minste brikken

komplett = overlay-align(   #Komplett tårn med alle brikker
  "center", "middle", piece4, overlay-align(
    "center", "middle", piece3, overlay-align(
      "center", "middle", piece3, overlay-align(
        "center", "middle", piece2, piece1)
      )
    )
  )

stolpe-a = put-image(  #Plasserer stolpe A til venstre i midten av en tom scene
  stolpe,
  50, 60,
  empty-scene(340, 120)
  )
 
stolpe-b = put-image(  #Plasserer stolpe B i midten av en tom scene
  stolpe,
  170, 60,
  empty-scene(340, 120)
  )

stolpe-c = put-image(  #Plasserer stolpe C til høyre i midten av en tom scene
  stolpe,
  290, 60,
  empty-scene(340, 120)
  )

brett = overlay-align(  #Lager ett brett som inneholder stolpe A, B, C og scenen.
  "center", "middle", stolpe-a, overlay-align(
    "center", "middle", stolpe-b, stolpe-c)
  )

start = overlay-align("left", "middle", brett, komplett)  #Starttilstanden der alle brikkene er på stolpe A

s1 = overlay-align(
  "center", "middle", piece4, overlay-align(
    "left", "middle", brett, overlay-align(
      "center", "middle", piece3,overlay-align(
        "center", "middle", piece2, piece1)
      )
    )
  ) 

s2 = overlay-align(  #Benytter put-image for å kunne plassere brikkene der vi vil ha dem. Fikk problemer med at de mindre brikkene ble plassert inntil "veggen" av scenen hvis vi ikke benyttet put-image
  "left", "middle", piece1n2, overlay-align(
    "center", "middle", piece4, put-image(
      piece3,
      290, 60,
      empty-scene(340, 120)
      )
    )
  )

s3 = overlay-align(  #Benytter piece1n2 og piece3n4 siden vi fikk problemer med å sentralisere brikkene over hverandre når vi benyttet brikkene hver for seg
  "left", "middle", piece1n2, overlay-align(
    "left", "middle", brett, put-image(
      piece3n4, 
      290, 60, 
      empty-scene(340, 120)
      )
    )
  )

s4 = overlay-align(
  "left", "middle", piece1, overlay-align(
    "center", "middle", piece2, put-image(
      piece3n4, 
      290, 60, 
      empty-scene(340, 120)
      )
    )
  )

s5 = overlay-align(
  "left", "center", put-image(
    piece4,
    50, 60,
    empty-scene(340, 120)), overlay-align(
     "left", "center", piece1, overlay-align(
      "center", "middle", piece2, put-image(
          piece3,
          290, 60,
          empty-scene(340, 120)
          )
        )
      )
    )
  
s6 = overlay-align(
  "left", "center", put-image(
    piece4,
    50, 60,
    empty-scene(340, 120)), overlay-align(
     "left", "center", piece1, overlay-align(
      "center", "middle", piece3, overlay-align(
        "center", "middle", piece2, stolpe-c)
      )
    )
  )
   
s7 = overlay-align(
  "center", "middle", piece3n4, overlay-align(
    "center", "middle", piece2, overlay-align(
      "left", "middle", piece1, stolpe-c)
    )
  )

#Observerer at steg 8 er det speilvendte av steg 7 i den mentale modellen, benytter flip-horizontal funksjonen for å speile outputen
s8 = flip-horizontal(s7)

#Innser at resten av stegene kan løses ved å speile trekkene i motsatt rekkefølge. Konkluderer med at siden starttilstanden og sluttilstanden er lik bare speilet ovenfor hverandre; vil de optimale trekkene fra halveis i spillet tilsvare de samme trekkene fra første halvdel, men speilet i motsatt rekkefølge
s9 = flip-horizontal(s6)

s10 = flip-horizontal(s5)

s11 = flip-horizontal(s4)

s12 = flip-horizontal(s3)

s13 = flip-horizontal(s2)

s14 = flip-horizontal(s1)

s15 = flip-horizontal(start)

start

s1

s2

s3

s4

s5

s6

s7

s8

s9

s10

s11

s12

s13

s14

s15
