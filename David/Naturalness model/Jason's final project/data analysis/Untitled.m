for i = 1:10
    scatter(skylab((i-1)*49+1,2),skylab((i-1)*49+1,3),'r');
    hold on
    scatter(skycenter(i,2),skycenter(i,3),'g');
    arrow([skylab((i-1)*49+1,2),skylab((i-1)*49+1,3)],[skycenter(i,2),skycenter(i,3)]);
end