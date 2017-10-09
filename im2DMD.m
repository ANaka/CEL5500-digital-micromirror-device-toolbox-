
function DMDvec=im2DMD(image)
%format a 1-bit image for uploading into the DMD
%image should be an 1024 x 768 double or binary

DMDvec = bi2de(reshape(image,8,98304)');