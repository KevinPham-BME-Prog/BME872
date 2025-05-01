function []= imageWrite(image, info, imgformat, filename)
    % Function to save a CT image in DICOM or PNG format
    % Inputs:
    % image - the CT image data
    % info - the metadata associated with the CT image
    % filename - the name of the file to save
    % imgformat - 'dcm' or 'png'
    switch imgformat
        case 'dcm'
            % Save as DICOM
            dicomwrite(image, filename, info);
            disp(['Image saved as DICOM: ', fileName]);
            
        case 'png'
            % Save as PNG
            % Note: Some metadata may be lost in PNG format
            imwrite(image, [filename, '.png']);
            disp(['Image saved as PNG: ', filename, '.png']);
            
        otherwise
            error('Unsupported file format. Please choose ''dcm'' or ''png''.');
    end
end
    