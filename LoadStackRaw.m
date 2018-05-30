function S = LoadStackRaw(filedir)
%function S=LoadStackRaw(filedir)
%
%Imports STXM raw data from input directoy filedir
%filedir needs to contain the STXM header file (.hdr) and the STXM data files (.xim)
%R.C. Moffet, T.R. Henn February 2009
%
%Modified by Matthew Fraund November 2015
%
%Inputs
%------
%filedir        path to STXM raw data directory
%
%Outputs
%-------
%S              structure array containing imported STXM data
%S.spectr       STXM absorption images
%S.eVenergy     Photon energies used to record images
%S.Xvalue       length of horizontal STXM image axis in µm
%S.Yvalue       length of vertical STXM image axis in µm
tic
cd(filedir) 

FileStruct=dir;


spccnt=1;
for i=1:length(FileStruct)
    stridx=strfind(FileStruct(i).name,'xim');
    hdridx=strfind(FileStruct(i).name,'hdr');

    if ~isempty(stridx)
        S.spectr(:,:,spccnt)=flipud(load(FileStruct(i).name));
        spccnt=spccnt+1;
    elseif ~isempty(hdridx) 
        [S.eVenergy,S.Xvalue,S.Yvalue,~,Position]=ReadHdrMulti(FileStruct(i).name);
    end
end

% truncate crashed stacks:
if size(S.spectr,3)<length(S.eVenergy)
    
    S.eVenergy((size(S.spectr,3)+1):length(S.eVenergy))=[];
    
end
toc
end