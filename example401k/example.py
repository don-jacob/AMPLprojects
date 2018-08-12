# -*- coding: utf-8 -*-
"""
Created on Sat Aug 11 17:20:23 2018

@author: donja
"""

from amplpy import AMPL, Environment

ampl = AMPL(Environment('D:\\amplide.mswin64\\amplide.mswin64'))
ampl.option['solver'] = 'cplexamp'
ampl.read('example.mod') #read the model
ampl.eval('objective z; solve;')
ampl.display('z', 'roth', 'traditional', 'surplus')

pstring = """
objective function = {z}
bi-weekly roth contribution = ${roth}
bi-weekly traditional contribution = ${traditional}
surplus (amount left after optimal allocation) = ${surplus}
total (without surplus)  = ${total}
total (with surplus)  = ${totalS}
"""
z=ampl.getValue('z')
roth=ampl.getValue('roth')
traditional=ampl.getValue('traditional')
surplus=ampl.getValue('surplus')
                     
annual_roth_amt = roth*12*2
annual_traditional_amt = traditional*12*2

print(pstring.format(z=z,
                     roth=roth,
                     traditional=traditional,
                     surplus=surplus,
                     total=annual_roth_amt+annual_traditional_amt,
                     totalS=annual_roth_amt+annual_traditional_amt+surplus))