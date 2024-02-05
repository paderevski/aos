# My document

This is a paragraph.

```{.sageplot executable=foo foo=100 width=50mm height=60mm}

x,y = var('x','y')
def p1(f, xmin=-10, ymin=-10, xmax = 10, ymax = 10):
		c = 10
		xrange = list(range(xmin,xmax+1,2))
		yrange = list(range(ymin,ymax+1,2))
		p=implicit_plot(f,(xmin,xmax),(ymin,ymax),
		linewidth=4,fill=False,axes=True,gridlines=True,frame=False,ticks=[xrange,yrange],fontsize=12)
		return(p)

G=p1(x^2-y^2-5)
```
# Title

Paragraph

```{.graphviz width=50mm height=60mm}
digraph D {

  A [shape=diamond]
  B [shape=box]
  C [shape=circle]

  A -> B [style=dashed, color=grey]
  A -> C [color="black:invis:black"]
  A -> D [penwidth=5, arrowhead=none]

}
```
Bye
