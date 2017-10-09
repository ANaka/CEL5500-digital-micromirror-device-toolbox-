
function DMD_order(imageOrder)
%designate the order to play images from the DMD cache
%imageOrder should be a vector of numbers in range [0 959]

calllib('DMD','DLP_RegIO_WriteImageOrderLut',1, imageOrder, length(imageOrder));
end