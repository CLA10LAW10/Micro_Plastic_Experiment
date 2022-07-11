function [ output_args ] = ReadNokiaRaw( input_args )
%This function reads the RAW .dng image and converts it into RAW 16bit
%matrix values for further processing. It discards every post processing
%step. Requires dcraw.exe to be in the same folder
%
input_args=strrep(input_args, '.dng','');

system(['dcraw -w -H 1 -o 0 -q 3 -4 -T ' input_args '.dng']);
output_args=imread(strcat(input_args,'.tiff'));

end

% -v is for getting information about RAW development process
% -w is for using the white balance that was adjusted in the camera while
% shooting.

