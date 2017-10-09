
function out_image=DMD2im(DMDvec)

%convert a 1-bit DMD vector into a 1024 x 768 image
%DMDvec should be an 8-bit, 98304 x 1 vector
out_image=reshape(de2bi(DMDvec,8)',1024,768);


