## -*- encoding: utf-8 -*-
## This file (exam-test.sagetex.sage) was *autogenerated* from exam-test.tex with sagetex.sty version 2021/10/16 v3.6.
import sagetex
_st_ = sagetex.SageTeXProcessor('exam-test', version='2021/10/16 v3.6', version_check=True)
_st_.current_tex_line = 18
_st_.blockbegin()
try:
 x,y = var('x','y')
 
 def p1(f, xmin=-5, ymin=-5, xmax = 5, ymax = 5):
   c = 10
   xrange = list(range(xmin,xmax+1))
   yrange = list(range(ymin,ymax+1))
   p=implicit_plot(f,(xmin,xmax),(ymin,ymax),
 linewidth=4,fill=False,axes=True,gridlines=True,frame=False,ticks=[xrange,yrange],fontsize=12)
   return(p)
 
 def hyperbola(a=1,b=1,h=0,k=0,vertical=False):
   z = p1((x-h)^2/a^2-(y-k)^2/b^2 - 1)
   z = z+ plot(b/a*(x-h)+k,(-5,5),color="gray",linestyle="dashed")
   z = z+ plot(-b/a*(x-h)+k,(-5,5),color="gray",linestyle="dashed")
   z.set_axes_range(-5,5,-5,5)
   return z
except:
 _st_.goboom(35)
_st_.blockend()
try:
 _st_.current_tex_line = 68
 _st_.plot(0, format='notprovided', _p_=hyperbola(1,2,1,1))
except:
 _st_.goboom(68)
try:
 _st_.current_tex_line = 69
 _st_.plot(1, format='notprovided', _p_=hyperbola(2,1,1,1))
except:
 _st_.goboom(69)
try:
 _st_.current_tex_line = 70
 _st_.plot(2, format='notprovided', _p_=hyperbola(1,1,-2,1))
except:
 _st_.goboom(70)
_st_.endofdoc()
