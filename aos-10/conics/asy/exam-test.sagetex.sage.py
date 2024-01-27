## -*- encoding: utf-8 -*-


# This file was *autogenerated* from the file exam-test.sagetex.sage
from sage.all_cmdline import *   # import sage library

_sage_const_18 = Integer(18); _sage_const_5 = Integer(5); _sage_const_10 = Integer(10); _sage_const_1 = Integer(1); _sage_const_4 = Integer(4); _sage_const_12 = Integer(12); _sage_const_0 = Integer(0); _sage_const_2 = Integer(2); _sage_const_35 = Integer(35); _sage_const_67 = Integer(67); _sage_const_68 = Integer(68); _sage_const_69 = Integer(69)## This file (exam-test.sagetex.sage) was *autogenerated* from exam-test.tex with sagetex.sty version 2021/10/16 v3.6.
import sagetex
_st_ = sagetex.SageTeXProcessor('exam-test', version='2021/10/16 v3.6', version_check=True)
_st_.current_tex_line = _sage_const_18 
_st_.blockbegin()
try:
 x,y = var('x','y')
 
 def p1(f, xmin=-_sage_const_5 , ymin=-_sage_const_5 , xmax = _sage_const_5 , ymax = _sage_const_5 ):
   c = _sage_const_10 
   xrange = list(range(xmin,xmax+_sage_const_1 ))
   yrange = list(range(ymin,ymax+_sage_const_1 ))
   p=implicit_plot(f,(xmin,xmax),(ymin,ymax),
 linewidth=_sage_const_4 ,fill=False,axes=True,gridlines=True,frame=False,ticks=[xrange,yrange],fontsize=_sage_const_12 )
   return(p)
 
 def hyperbola(a=_sage_const_1 ,b=_sage_const_1 ,h=_sage_const_0 ,k=_sage_const_0 ,vertical=False):
   z = p1((x-h)**_sage_const_2 /a**_sage_const_2 -(y-k)**_sage_const_2 /b**_sage_const_2  - _sage_const_1 )
   z = z+ plot(b/a*(x-h)+k,(-_sage_const_5 ,_sage_const_5 ),color="gray",linestyle="dashed")
   z = z+ plot(-b/a*(x-h)+k,(-_sage_const_5 ,_sage_const_5 ),color="gray",linestyle="dashed")
   z.set_axes_range(-_sage_const_5 ,_sage_const_5 ,-_sage_const_5 ,_sage_const_5 )
   return z
except:
 _st_.goboom(_sage_const_35 )
_st_.blockend()
try:
 _st_.current_tex_line = _sage_const_67 
 _st_.plot(_sage_const_0 , format='notprovided', _p_=hyperbola(_sage_const_1 ,_sage_const_2 ,_sage_const_1 ,_sage_const_1 ))
except:
 _st_.goboom(_sage_const_67 )
try:
 _st_.current_tex_line = _sage_const_68 
 _st_.plot(_sage_const_1 , format='notprovided', _p_=hyperbola(_sage_const_2 ,_sage_const_1 ,_sage_const_1 ,_sage_const_1 ))
except:
 _st_.goboom(_sage_const_68 )
try:
 _st_.current_tex_line = _sage_const_69 
 _st_.plot(_sage_const_2 , format='notprovided', _p_=hyperbola(_sage_const_1 ,_sage_const_1 ,-_sage_const_2 ,_sage_const_1 ))
except:
 _st_.goboom(_sage_const_69 )
_st_.endofdoc()

