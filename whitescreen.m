function whitescreen()

%Upload a blank 'white' image to the DMD's cache
calllib('DMD','DLP_Source_SetDataSource','SL_AUTO')
final = ones(98304,1)*255;
DMD_upload(final,0);
DMD_order(0);
calllib('DMD','DLP_Display_DisplayPatternAutoStepRepeatForMultiplePasses');