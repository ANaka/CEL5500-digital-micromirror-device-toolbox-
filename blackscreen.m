function blackscreen()

%Upload a blank 'black' image to the DMD's cache
calllib('DMD','DLP_Source_SetDataSource','SL_AUTO')
final = zeros(98304,1);
DMD_upload(final,0);
DMD_order(0);
calllib('DMD','DLP_Display_DisplayPatternAutoStepRepeatForMultiplePasses');