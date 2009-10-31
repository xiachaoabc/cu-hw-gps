function log=log_receive(device)
global running;

fclose all;
s=serial(device,'baudrate',115200,'timeout',0.2);
fopen(s);

btn=uicontrol('style','pushbutton',...
    'string','Stop!',...
    'callback','global running;running=0;clear running;close');

numValues=6;
data=zeros(1,numValues);

%Disable timeout warning.
warning off MATLAB:serial:fread:unsuccessfulRead;

running=1;
log=[];
state=0;
while(running==1)
    drawnow;
    
    %Start byte 0 (0xDE).
    if(state==0)
        b=fread(s,1,'uint8');
        if(b==hex2dec('DE'))
            state=1;
        end
    %Start byte 1 (0xAD).
    elseif(state==1)
        b=fread(s,1,'uint8');
        if(b==hex2dec('AD'))
            state=2;
        else
            state=0;
        end
        
        i=0;
    %Start byte 2 (0xBE).
    elseif(state==2)
        b=fread(s,1,'uint8');
        if(b==hex2dec('BE'))
            state=3;
        else
            state=0;
        end
        
        i=0;
    %Start byte 3 (0xEF).
    elseif(state==3)
        b=fread(s,1,'uint8');
        if(b==hex2dec('EF'))
            state=4;
        else
            state=0;
        end
        
        i=0;
    else
        data(i+1)=fread(s,1,'int32');
        
        i=i+1;
        if(i==numValues)
            state=0;
            log=[log;data];
        end
    end
end

fclose(s);

%Re-enable timeout warning.
warning on MATLAB:serial:fread:unsuccessfulRead;

return;