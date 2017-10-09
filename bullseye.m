function bullseye(~)

finalmask = zeros(1024,768);
finalmask(:,379:390)=1;
finalmask(507:518,:)=1;

center=[512.5,384.5];

R=[95:105 195:205 295:305];

for j = 1:length(R)
    for i = -pi:0.01:pi

        thiscoord=([cos(i) sin(i)])*R(j);
        finalmask(round(center(1)+thiscoord(1)),round(center(2)+thiscoord(2)))=1;

    end
end  

x=reshape(finalmask,8,98304)';
final = bi2de(x);

DMD_upload(final,0);

DMD_show(0);
