for i=1:6
    bb(i,:)=mean(dd1(i*24-23:i*24,:));
end
bb(7,:)=mean(bb);