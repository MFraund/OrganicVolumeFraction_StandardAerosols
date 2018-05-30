


% load('standardsfilelist_allSTXM.mat');
% matlabels_3rdDim = {...
%     'NaClSuc11B','C','D';   '110B','C','D'; '101B','C','D';...
%     'AmsulfSuc11B','C','D'; '110B','C','D'; '101B','C','D'};
% groupings = [...
%     2,2,3; 2,2,1; 3,2,2;...
%     2,2,2; 3,3,2; 2,2,1;];




load('standardsfilelist_onlygoodSTXM3.mat');
matlabels_3rdDim = {...
    'NaClSuc11B','C','D';   '110B','C','D'; '101B','C','D';...
    'AmsulfSuc11B','C','D'; '110B','C','D'; '101B','C','D'};

%groupings for onlygoodSTXM2
% groupings = [...
%     1,1,1; 3,2,1; 2,2,1;...
%     3,6,2; 1,2,1; 2,2,2;];

%groupings for onlygoodSTXM3
groupings = [...
    1,1,1; 3,2,1; 1,1,1;...
    3,6,2; 1,2,1; 2,2,2;];

standardsfilelist = standardsfilelist_onlygoodSTXM;


%coratio_vec = cell(1,length(standardsfilelist));    
volfrac_totmat = cell(1,length(standardsfilelist));
thickmap_totmat = cell(1,length(standardsfilelist));
RGBmap_totmat = cell(1,length(standardsfilelist));
size_totmat = cell(1,length(standardsfilelist));

if any(exist('sillystring','file'))
	hwait = waitbar(0,sillystring);
else
	hwait = waitbar(0,'plz w8');
end

for q = 1:length(standardsfilelist)
    cd(standardsfilelist{q});
    currdir = dir;
    
    for y = 1:length(currdir)
        hdrtest = strfind(currdir(y).name,'.hdr');
        if ~isempty(hdrtest)
            matname = ['F',currdir(y).name(1:hdrtest-1),'.mat'];
            break
        end
        
    end
    
    
%     [~,foldername,~] = fileparts(standardsfilelist{i});
    cd('..');
%     load(['F',foldername,'.mat']);
    load(matname);
	
	
	%%% THIS SECTION IS FOR TESTING NACL/ADIPIC ASSUMPTIONS.  COMMENT THIS
	%%% OUT UNDER NORMAL CIRCUMSTANCES
% 	Snew = DirLabelOrgVolFrac(Snew,'NaCl','adipic');
	%%%
	%%%
	
	
    %Snew = elemassvec(Snew,'C');
    %Snew = elemassvec(Snew,'O');
    %coratio_vec{1,q} = Snew.Cmassvec./Snew.Omassvec;
    size_totmat{1,q} = Snew.Size';
    RGBmap_totmat{1,q} = Snew.RGBCompMap;
    volfrac_totmat{1,q} = Snew.VolFrac;
    thickmap_totmat{1,q} = Snew.ThickMap(:,:,3);
    waitbar(q./length(standardsfilelist));
end
close(hwait);