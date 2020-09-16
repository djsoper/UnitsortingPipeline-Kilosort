outFilename = 'X:\Projects\IntraOp_Micro\PEDOTPtNRSpikeSorting\IntraopMG16\IntraopMG16_PEDOTBlackrock-101414\AllKilosorted_v2\IntraopMG16BRALL.bin';

disp('Started Writing the Binary File!')
fid = fopen( outFilename, 'w' );
fwrite( fid, RAWDataALL, 'int16' );
fclose( fid );

disp('Done Writing the Binary File!')
%% Edit RAW before making Binary -- Everything Below here handles trimming artifacts
% Expects a raw data value, an Onset matrix, and an Offset matrix
% The onset and Offset matrices should be in seconds
PatNumber = 25;

movtArray = EventsMovementAll{PatNumber}; 

stimArray = EventsStimAll{PatNumber}; 

sampMovt = round(movtArray * 30000);
sampStim = round(stimArray * 30000);

sampMovt = [sampMovt; sampStim];

[x , y] = find(sampMovt == 0);

if(numel(x) > 1)
    return;
elseif(numel(x) == 0)
    disp('Doesn''t start at 0. Beginning change.');
else
    sampMovt(x,y) = 1;
    disp('Started At 0. Changed to 1 for matrix operations on Samples because the people who made MATLAB were at best lazy and at worst without Foresight')
end

%ArtifactFreeRaw = RAWDataALL;

for i = 1:length(sampMovt)
    
    RAWDataALL(:, sampMovt(i , 2):sampMovt(i , 3)) = 0;

end

disp('Done Padding the Raw Data!')

