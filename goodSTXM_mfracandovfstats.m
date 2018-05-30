
%% preallocation and titles
naclsucstats_columnheaders = cell(7,4);
naclsucstats_columnheaders(1,:) = {'C mfrac average','std','std err','Calculated'};
naclsucstats_columnheaders(2,:) = {'N mfrac average','std','std err','Calculated'};
naclsucstats_columnheaders(3,:) = {'O mfrac average','std','std err','Calculated'};
naclsucstats_columnheaders(4,:) = {'Na mfrac average','std','std err','Calculated'};
naclsucstats_columnheaders(5,:) = {'S mfrac average','std','std err','Calculated'};
naclsucstats_columnheaders(6,:) = {'Cl mfrac average','std','std err','Calculated'};
naclsucstats_columnheaders(7,:) = {'OVF average','std','std err','Calculated'};
%naclsucstats_columnheaders(8,:) = {'C/O ratio average','std','std err','Calculated');

stdtitle = cell(6,1);
stdtitle{1} = 'naclsuc11';
stdtitle{2} = 'naclsuc110';
stdtitle{3} = 'naclsuc101';
stdtitle{4} = 'amsulfsuc11';
stdtitle{5} = 'amsulfsuc110';
stdtitle{6} = 'amsulfsuc101';
currstdstats = zeros(7,4);

%% calculating statistics
prevsum = 0; %sum of previous FOV numbers
for b = 1:6
    systemFOVnum = sum(groupings(b,:));
    tempvolfracmat = [];
    
    for q = 1:systemFOVnum
        tempvolfracmat = cat(1,tempvolfracmat,volfrac_totmat{q+prevsum});
        
        
    end
    prevsum = prevsum + systemFOVnum;
    
    currstdstats(7,1) = nanmean(tempvolfracmat);
    currstdstats(7,2) = nanstd(tempvolfracmat);
    currstdstats(7,3) = nanstd(tempvolfracmat) .* 2.1 ./ sqrt(size(tempvolfracmat,1));  
    %I'm using 2.1 instead of 1.96 because some systems have very few
    %particles but I'm not putting in the work to figure out the
    %calculation until the end.  figures first then polish
    
    currstatstitle = [stdtitle{b},'stats'];
    eval([stdtitle{b},'stats = currstdstats;']);
    
    
    
    
end

%% calculated mfracs and OVFs
naclsuc11stats(1,4) = (1./2) .* (12.01  .*12 ./ 342.2965); %mass fraction of Carbon
naclsuc11stats(2,4) = 0; %N
naclsuc11stats(3,4) = (1./2) .* (15.994 .*11 ./ 342.2965); %O
naclsuc11stats(4,4) = (1./2) .* (22.9897.*1 ./ 58.4); %Na
naclsuc11stats(5,4) = 0; %S
naclsuc11stats(6,4) = (1./2) .* (35.453 .*1 ./ 58.4); %Cl
naclsuc11stats(7,4) = (1./1.59) ./ ((1./1.59) + (1./2.16)); %OVF

naclsuc110stats(1,4) = (10./11) .* (12.01  .*12 ./ 342.2965); %mass fraction of Carbon
naclsuc110stats(2,4) = 0; %N
naclsuc110stats(3,4) = (10./11) .* (15.994 .*11 ./ 342.2965); %O
naclsuc110stats(4,4) = (1./11) .* (22.9897.*1 ./ 58.4); %Na
naclsuc110stats(5,4) = 0; %S
naclsuc110stats(6,4) = (1./11) .* (35.453 .*1 ./ 58.4); %Cl
naclsuc110stats(7,4) = (10./1.59) ./ ((10./1.59) + (1./2.16)); %OVF

naclsuc101stats(1,4) = (1./11) .* (12.01  .*12 ./ 342.2965); %mass fraction of Carbon
naclsuc101stats(2,4) = 0; %N
naclsuc101stats(3,4) = (1./11) .* (15.994 .*11 ./ 342.2965); %O
naclsuc101stats(4,4) = (10./11) .* (22.9897.*1 ./ 58.4); %Na
naclsuc101stats(5,4) = 0; %S
naclsuc101stats(6,4) = (10./11) .* (35.453 .*1 ./ 58.4); %Cl
naclsuc101stats(7,4) = (1./1.59) ./ ((1./1.59) + (10./2.16)); %OVF


amsulfsuc11stats(1,4) = (1./2) .* (12.01  .*12 ./ 342.2965); %mass fraction of Carbon
amsulfsuc11stats(2,4) = (1./2) .* (14.0067 .* 2 ./ 132.14); %N
amsulfsuc11stats(3,4) = ((1.* (15.994 .* 11)./ 342.2965) + (1 .* (15.994 .* 4)./132.14))./2; %O 
amsulfsuc11stats(4,4) = 0; %Na
amsulfsuc11stats(5,4) = (1./2) .* (32.065 .* 1 ./ 132.14); %S
amsulfsuc11stats(6,4) = 0; %Cl
amsulfsuc11stats(7,4) = (1./1.59) ./ ((1./1.59) + (1./1.77)); %OVF

amsulfsuc110stats(1,4) = (10./11) .* (12.01  .*12 ./ 342.2965); %mass fraction of Carbon
amsulfsuc110stats(2,4) = (1./11) .* (14.0067 .* 2 ./ 132.14); %N
amsulfsuc110stats(3,4) = ((10.* (15.994 .* 11)./ 342.2965) + (1 .* (15.994 .* 4)./132.14))./11; %O 
amsulfsuc110stats(4,4) = 0; %Na
amsulfsuc110stats(5,4) = (1./11) .* (32.065 .* 1 ./ 132.14); %S
amsulfsuc110stats(6,4) = 0; %Cl
amsulfsuc110stats(7,4) = (10./1.59) ./ ((10./1.59) + (1./1.77)); %OVF

amsulfsuc101stats(1,4) = (1./11) .* (12.01  .*12 ./ 342.2965); %mass fraction of Carbon
amsulfsuc101stats(2,4) = (10./11) .* (14.0067 .* 2 ./ 132.14); %N
amsulfsuc101stats(3,4) = ((1.* (15.994 .* 11)./ 342.2965) + (10 .* (15.994 .* 4)./132.14))./11; %O 
amsulfsuc101stats(4,4) = 0; %Na
amsulfsuc101stats(5,4) = (10./11) .* (32.065 .* 1 ./ 132.14); %S
amsulfsuc101stats(6,4) = 0; %Cl
amsulfsuc101stats(7,4) = (1./1.59) ./ ((1./1.59) + (10./1.77)); %OVF


statsmatrix = zeros(7,4,5);

%This puts each in order of increasing OVF
statsmatrix(:,:,2) = naclsuc11stats;
statsmatrix(:,:,3) = naclsuc110stats;
statsmatrix(:,:,1) = naclsuc101stats;
statsmatrix(:,:,5) = amsulfsuc11stats;
statsmatrix(:,:,6) = amsulfsuc110stats;
statsmatrix(:,:,4) = amsulfsuc101stats;