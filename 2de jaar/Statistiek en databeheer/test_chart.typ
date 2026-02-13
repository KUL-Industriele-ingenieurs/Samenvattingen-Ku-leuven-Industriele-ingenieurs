#import "@preview/cetz:0.4.2"

#cetz.canvas({
  import cetz.chart
  import cetz.draw: *

  chart.pie(
    data: (("A", 30), ("B", 40), ("C", 30)),
    radius: 2,
    slice-style: (stroke: none),
    outer-label: (content: "%"),
  )
})
