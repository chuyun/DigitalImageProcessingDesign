function ShowProcessBarFunc()

% hold on;
 % ��ʾ������
steps=100;
 hwait=waitbar(0,'��ȴ�...');
 for k=1:steps
     if steps-k<=5
         waitbar(k/steps,hwait,'�������');
 %          pause(0.05);
     else
         str=['��Դ������...',num2str(k),'%'];
         waitbar(k/steps,hwait,str);
 %          pause(0.05);
     end
 end
 close(hwait); % �������close����