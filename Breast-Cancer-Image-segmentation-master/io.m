clear all;
close all;
fileFolder= fullfile('G:/', 'data400','test','malignant');
files= dir(fullfile(fileFolder,'*.png'));
fileNames= {files.name};
for i = 1: length(fileNames)
    fname{i} = fullfile(fileFolder,fileNames{i});
    I{i} = imread(fname{i});
end

for i = 1:length(fileNames)
    [N_Objects,N_Ho,Avgeob,E,Arnf1,eccnmed,eccnm,eccnvar, eccnkurtosis,eccnskew] = Segmentation(I{i}, i);
    N_O(i) = N_Objects;
    N_Holes(i)=N_Ho;
    AvgEOB(i)=Avgeob;
    Euler(i)= E;
    Arnf(i) = Arnf1;
    eccnmedian(i) = eccnmed;
    eccnmean(i) = eccnm;
    eccnv(i) = eccnvar;
    eccnkurt(i) = eccnkurtosis;
    eccnsk(i) = eccnskew;
end

COUNT=int32(length(fileNames)/2);
%% plotting
%Updating the Variance of Eccentricity
for i = 1:COUNT
    if(isnan(eccnv(i)))
        ECCNVIDC(i)=0;
    else
        ECCNVIDC(i)=eccnv(i);
    end
end

for i = (COUNT+1):length(fileNames)
    if(isnan(eccnv(i)))
        ECCNVN(i-COUNT)=0;
    else
        ECCNVN(i-COUNT)=eccnv(i);
    end
end

%%
%Updating Kurtosis
for i = 1:COUNT
    if(isnan(eccnkurt(i)))
        EOIDC_kurt(i)=0;
    else
        EOIDC_kurt(i)=eccnkurt(i);
    end
end

for i = COUNT+1:length(fileNames)
    if(isnan(eccnkurt(i)))
        EON_kurt(i-COUNT)=0;
    else
        EON_kurt(i-COUNT)=eccnkurt(i);
    end
end

%%
%Updating Skewness
for i = 1:COUNT
    if(isnan(eccnsk(i)))
        EOIDC_skew(i)=0;
    else
        EOIDC_skew(i)=eccnsk(i);
    end
end

for i = COUNT+1:length(fileNames)
    if(isnan(eccnsk(i)))
        EON_skew(i-COUNT)=0;
    else
        EON_skew(i-COUNT)=eccnsk(i);
    end
end


%%
figure(121), scatter3(ECCNVN,EON_kurt,EON_skew, 'r');
hold on;

scatter3(ECCNVIDC,EOIDC_kurt,EOIDC_skew,'b');
title('Eccentricities variance vs Kurtosis vs skewness ');
legend('Holes of Normal Tissue - Eccentricity','Holes of Cancer tissue - Eccentricity');
xlabel('Variance of Eccentricity'); ylabel('Kurtosis of Eccentricity'); zlabel('Skewness of Eccentricity');
%%
figure(122);
plot(ECCNVN, EON_kurt,'ro');
hold on;
plot(ECCNVIDC, EOIDC_kurt,'b*');
hold on;
title('Eccentricity Kurtosis vs Eccentricity Variance');
legend('Normal Tissue','Cancer Tissue')
xlabel('Variance of Eccentricity'); ylabel('Kurtosis of Eccentricity');

figure(123);
plot(ECCNVN, EON_skew,'ro');
hold on;
plot(ECCNVIDC, EOIDC_skew,'b*');
hold on;
title('Eccentricity Skewness vs Eccentricity Variance');
legend('Normal Tissue','Cancer Tissue')
xlabel('Variance of Eccentricity'); ylabel('Skewness of Eccentricity');

figure(124);
plot( EON_skew,EON_kurt,'ro');
hold on;
plot(EOIDC_skew, EOIDC_kurt,'b*');
hold on;
title('Eccentricity Kurtosis vs Eccentricity Skewness');
legend('Normal Tissue','Cancer Tissue')
xlabel('Variance of Eccentricity'); ylabel('Kurtosis of Eccentricity');

%%
%Variance of Ratio of the Area of the nucleus to the total area of the
%chain

for i = 1:COUNT
    if(isnan(Arnf(i)))
        ArvIDC(i)=0;
    else
        ArvIDC(i)=Arnf(i);
    end
end

for i = COUNT+1:length(fileNames)
    if(isnan(Arnf(i)))
        ArvN(i-COUNT)=0;
    else
        ArvN(i-COUNT)=Arnf(i);
    end
end

figure(125);
plot(ECCNVN, ArvN,'ro');
hold on;
plot(ECCNVIDC, ArvIDC,'b*');
hold on;
title('Variance of ratio of Nuclei area to total area  vs Eccentricity Variance');
legend('Normal Tissue','Cancer Tissue')
xlabel('Variance of Eccentricity'); 
ylabel('Variance of the ratio of the Nuclei area to the total area of the chain');