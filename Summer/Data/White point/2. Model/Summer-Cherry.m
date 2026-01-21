xyzd=CCT2uv(d_v_m(:,1),d_v_m(:,3));
xyzm=CCT2uv(d_v_m(:,2),d_v_m(:,4));
labd=xyz2lab(xyzd);
labm=xyz2lab(xyzm);
D=cielabde(labd,labm);