function ShowProcessBarFunc()

% hold on;
 % 显示进度条
steps=100;
 hwait=waitbar(0,'请等待...');
 for k=1:steps
     if steps-k<=5
         waitbar(k/steps,hwait,'即将完成');
 %          pause(0.05);
     else
         str=['资源加载中...',num2str(k),'%'];
         waitbar(k/steps,hwait,str);
 %          pause(0.05);
     end
 end
 close(hwait); % 必须添加close函数