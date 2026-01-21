for i = 2:2
    scatter(depth((i-1)*30+1:(i-1)*30+25,1),zscore((i-1)*25+1:(i-1)*25+25,:));
    hold on
end