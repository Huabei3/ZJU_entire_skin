function eth = ethnicity_from_label(label)
if startsWith(label,'BK'), eth = "African";       return; end
if startsWith(label,'BR'), eth = "South Asian";   return; end
if startsWith(label,'GU'), eth = "Caucasian";     return; end
if startsWith(label,'YO'), eth = "Oriental(YO)";  return; end
if startsWith(label,'YY'), eth = "Oriental(YY)";  return; end
if startsWith(label,'CY'), eth = "Oriental(CY)";  return; end
eth = "Unknown";
end
