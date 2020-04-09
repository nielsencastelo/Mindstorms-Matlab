function classificacao(net,f)

    t1 = im2bw(f);
    [i j] = size(t1);
    t1 = reshape(t1,i*j,1);
    y = sim(net,t1);
    yy = round(y);
    t = eye(4);
    if (yy == t(:,1))
        figure;imshow(f);title('Imagem reconhecida');
    end
%     else if (yy == t(:,2))
%         figure;imshow(f);title('Imagem reconhecida');
%         s1 = imread('D:\Matlab\reconhecimento faces\Train\2.jpg');
%         figure;imshow(s1);title('Imagem do banco');
%         else
%             disp('Nenhuma imagem foi reconhecida');
%         end
%     end
end