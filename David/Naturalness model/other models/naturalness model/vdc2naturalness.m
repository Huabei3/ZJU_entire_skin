function Qn = vdc2naturalness(VDC)
    Qn =  VDC * [0.0254,0.0312,-0.001]'+0.067;