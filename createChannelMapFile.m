%% Generate a ChanMap
% PEDOT -- PEDOT -- PEDOT -- PEDOT
PatNumber = 13;

Nchannels = 128;
connected = false(Nchannels, 1);
connected( [ ChannelNumUseSpikeSortAll{PatNumber} ] ) = true;
chanMap   = 1:Nchannels;
chanMap0ind = chanMap - 1;

xcoords   = Coordinates{PatNumber}(:,1);
ycoords   = Coordinates{PatNumber}(:,2);
kcoords   = ones(Nchannels,1); % grouping of channels (i.e. tetrode groups)

fs = 30000; % sampling frequency

save(['/home/bourbon-the-huckster/Documents/MATLAB/Kilosort2/ChanMaps/Intraop' PatN{PatNumber} 'PEDOTChanMap.mat'], ...
    'chanMap','connected', 'xcoords', 'ycoords', 'chanMap0ind', 'fs')

% Save to Config Files Folder Because this Program is silly
save(['/home/bourbon-the-huckster/Documents/MATLAB/Kilosort2/configFiles/Intraop' PatN{PatNumber} 'PEDOTChanMap.mat'], ...
    'chanMap','connected', 'xcoords', 'ycoords', 'chanMap0ind', 'fs')
%% Generate a ChanMap
% LAMINAR -- LAMINAR -- LAMINAR -- LAMINAR
Nchannels = 23;
connected = true(Nchannels, 1);
chanMap   = 1:Nchannels;
chanMap0ind = chanMap - 1;

xcoords   = LaminarCoordinates(:,1);
ycoords   = LaminarCoordinates(:,2);
kcoords   = ones(Nchannels,1); % grouping of channels (i.e. tetrode groups)

fs = 20000; % sampling frequency

save('/home/bourbon-the-huckster/Documents/MATLAB/Kilosort2/ChanMaps/LaminarChanMap.mat', ...
    'chanMap','connected', 'xcoords', 'ycoords', 'chanMap0ind', 'fs')

% Save to Config Files Folder Because this Program is silly
save('/home/bourbon-the-huckster/Documents/MATLAB/Kilosort2/configFiles/LaminarChanMap.mat', ...
    'chanMap','connected', 'xcoords', 'ycoords', 'chanMap0ind', 'fs')
%%

% kcoords is used to forcefully restrict templates to channels in the same
% channel group. An option can be set in the master_file to allow a fraction 
% of all templates to span more channel groups, so that they can capture shared 
% noise across all channels. This option is

% ops.criterionNoiseChannels = 0.2; 

% if this number is less than 1, it will be treated as a fraction of the total number of clusters

% if this number is larger than 1, it will be treated as the "effective
% number" of channel groups at which to set the threshold. So if a template
% occupies more than this many channel groups, it will not be restricted to
% a single channel group. 