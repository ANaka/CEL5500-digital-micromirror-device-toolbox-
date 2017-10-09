
function DMD_upload(DMDvec,cache_position)
%Upload a formatted image to the DMD's cache
%DMDvec should be the vector output of im2DMD()
%cache_position is a scalar in the range [0 959] designating where in the
%cache the image goes
calllib('DMD','DLP_Img_DownloadBitplanePatternToExtMem',DMDvec,98304,cache_position);
end