for i=1:29
    if a(i,4)>60
    e(i,2:3)=a(i,2:3);
    e(i,1)=sqrt(0.85.*a(i,5).^2-a(i,4).^2);
    else
        if a(i,4)>30
            e(i,1)=a(i,1);
            b=(0.9.*a(i,5).^2-a(i,1).^2)./(1+a(i,6).^2);
            if a(i,3)>0
                e(i,3)=sqrt(b);
            else
                e(i,3)=-sqrt(b);
            end
                e(i,2)=e(i,3).*a(i,6);
        else
           e(i,1:3)=a(i,1:3);
        end
    end
end   