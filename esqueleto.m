function esq = esqueleto(im_bin)
mascara = 0;
while( find(mascara==0) )
    %Primeiro Passo______________________________________________
    mascara = im_bin*0 + 1;
    for i=2:size(im_bin,1)-1
        for j=2:size(im_bin,2)-1
            if(im_bin(i,j)==1)
                vizi = [im_bin(i-1,j) im_bin(i-1,j+1) im_bin(i,j+1)...
                    im_bin(i+1,j+1) im_bin(i+1,j) im_bin(i+1,j-1)...
                    im_bin(i,j-1) im_bin(i-1,j-1)];
                n_vizi = sum(vizi);
                if(n_vizi >= 2)&&(n_vizi<=6)
                    vizi = [vizi vizi(1)];
                    tran = diff(vizi);
                    tran = tran>0;
                    tran = sum(tran);
                    if (tran==1)
                        p = im_bin(i-1:i+1,j-1:j+1);
                        p = p==1;
                        if( (~p(8))||(~p(6))||( (~p(4))&&(~p(2)) ) )
                            mascara(i,j)=0;
                        end
                    end
                end
            end
        end
    end
    %Segundo Passo______________________________________________
    im_bin = im_bin.*mascara;
    %Terceiro Passo_____________________________________________
    mascara = im_bin*0 + 1;
    for i=2:size(im_bin,1)-1
        for j=2:size(im_bin,2)-1
            if(im_bin(i,j)==1)
                vizi = [im_bin(i-1,j) im_bin(i-1,j+1) im_bin(i,j+1)...
                    im_bin(i+1,j+1) im_bin(i+1,j) im_bin(i+1,j-1)...
                    im_bin(i,j-1) im_bin(i-1,j-1)];
                n_vizi = sum(vizi);
                if(n_vizi >= 2)&&(n_vizi<=6)
                    vizi = [vizi vizi(1)];
                    tran = diff(vizi);
                    tran = tran>0;
                    tran = sum(tran);
                    if (tran==1)
                        p = im_bin(i-1:i+1,j-1:j+1);
                        p = p==1;
                        if( (~p(4))||(~p(2))||( (~p(8))&&(~p(6)) ) )
                            mascara(i,j)=0;
                        end
                    end
                end
            end
        end
    end
    %Quarto Passo
    im_bin = im_bin.*mascara;
    imshow(im_bin);
    pause(.01);
end
esq = im_bin;