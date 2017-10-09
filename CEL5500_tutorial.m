
%Before starting, make sure the DMD is in the 'Structured Light' mode and using the 
% 'Static image buffer' data source in the CELconductor GUI

%First you have to load a dynamic link library to allow MATLAB to talk to
%CEL5500. You'll need to find the appropriate library and change the
%filepaths to its location on your computer. See below link:
%https://e2e.ti.com/support/dlp__mems_micro-electro-mechanical_systems/f/387/t/133594
filename = 'C:\Program Files (x86)\Texas Instruments-DLP\SampleApp64bit\lib\PortabilityLayer.dll';
headname ='C:\Program Files (x86)\Texas Instruments-DLP\SampleApp64bit\include\PortabilityLayer.h';
loadlibrary(filename, headname, 'alias', 'DMD');

%% 

% once the dynamic link library is loaded, you can use the 'calllib' function to allow
% MATLAB to issue commands to the DMD. Here's an example:

%Upload a blank 'white' image to the DMD's cache
x = ones(98304,1)*255;
cacheposition=1;
calllib('DMD','DLP_Img_DownloadBitplanePatternToExtMem',x,98304,cacheposition)
%Tell the DMD to display a 'sequence' consisting only of this frame
sequencelength=1;
calllib('DMD','DLP_RegIO_WriteImageOrderLut',1, cacheposition, sequencelength) %
% Set the DMD to use its internal trigger
calllib('DMD','DLP_Source_SetDataSource','SL_AUTO')
% Set the DMD to play on loop
calllib('DMD','DLP_Display_DisplayPatternAutoStepRepeatForMultiplePasses')
%The DMD should now be projecting a blank, uniform image

%% 

% Load a uniform 'black' image to the next position in the cache
y = zeros(98304,1);
cacheposition=2;
calllib('DMD','DLP_Img_DownloadBitplanePatternToExtMem',y,98304,cacheposition)

%Tell the DMD to display a 'sequence' consisting both frames
sequence = [1 2]
sequencelength=2;
calllib('DMD','DLP_RegIO_WriteImageOrderLut',1, sequence, sequencelength)

%% 

%Depending on your framerate, it might be too fast to see the alternation
%Tell the DMD to play the white frame 300x, followed by the black frame
%300x, to slow things down
sequence = ones(1,600);
sequence(301:600)=2;
sequencelength=600;
calllib('DMD','DLP_RegIO_WriteImageOrderLut',1, sequence, sequencelength)

%% 

%Tell the DMD change frames after receiving a TTL pulse rather than with the automatic trigger,
calllib('DMD','DLP_Source_SetDataSource','SL_EXT3P3')
calllib('DMD','DLP_Display_DisplayPatternManualForceFirstPattern')
calllib('DMD','DLP_Display_DisplayPatternManualStep')


%% 

%The MATLAB functions included here will do some of these things for you.
%Below are a few more to play around with:

calllib('DMD','DLP_Display_DisplayStop')
calllib('DMD','DLP_Display_DisplayPatternManualStep')
calllib('DMD','DLP_Display_DisplayPatternManualForceFirstPattern')
calllib('DMD','DLP_Display_DisplayPatternAutoStepForSinglePass')
calllib('DMD','DLP_Display_DisplayPatternAutoStepRepeatForMultiplePasses')
calllib('DMD','DLP_Display_ParkDMD')
calllib('DMD','DLP_Display_UnparkDMD')
calllib('DMD','DLP_Source_SetDataSource',3)
calllib('DMD','DLP_Source_SetDataSource','SL_SW')
calllib('DMD','DLP_Source_SetDataSource','SL_EXT1P8')
calllib('DMD','DLP_Source_SetDataSource','SL_EXT3P3')
calllib('DMD','DLP_Source_SetDataSource','SL_AUTO')
calllib('DMD','DLP_Source_GenerateSoftwareVsync')
calllib('DMD','DLP_Trigger_SetExternalTriggerEdge',  1)
calllib('DMD','DLP_Display_HorizontalFlip',  0)
calllib('DMD','DLP_Display_VerticalFlip',  0)
calllib('DMD','DLP_Display_SetDegammaEnable',  0)
calllib('DMD','DLP_LED_SetLEDEnable',  0, 0)
calllib('DMD','DLP_LED_SetLEDEnable', 1, 1)
calllib('DMD','DLP_LED_SetLEDEnable',  2, 0)
calllib('DMD','DLP_LED_SetLEDEnable',  3, 0)
calllib('DMD','DLP_PWM_SetDutyCycle',  0, 1023)
calllib('DMD','DLP_PWM_SetDutyCycle',  2, 1023)
calllib('DMD','DLP_PWM_SetDutyCycle',  1, 1023)
calllib('DMD','DLP_PWM_SetDutyCycle',  3, 1023)
calllib('DMD','WriteSYNC',  1, 1, 0, 0, 1)
calllib('DMD','WriteSYNC',  2, 1, 0, 0, 1)
calllib('DMD','WriteSYNC',  3, 1, 0, 0, 1)

