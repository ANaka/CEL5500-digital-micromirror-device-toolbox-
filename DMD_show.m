function DMD_show(x)
%Diplay a particular frame in the DMD cache
%x should be a scalar in range [0 959]

calllib('DMD','DLP_Source_SetDataSource','SL_AUTO')
DMD_order(x);
calllib('DMD','DLP_Display_DisplayPatternAutoStepRepeatForMultiplePasses');
end