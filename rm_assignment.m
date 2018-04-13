
% Loading xlsx file and bining it to x variable
x = xlsread('StudentMarks.xlsx');
n = length(x);
% Creating a vector on specified range to be used in histogram plot
xbins	= [0:5:100];
% 1 Plotting the histogram with specified Bin intervals
subplot(3, 1, 1)
histogram(x,xbins)
xlabel('Marks');
ylabel('Frequency');
title('Distribution shape')
% 2 Finding mean, variance and standart deviation
m = sum(x)/n;
v = (x - m)'*(x - m)/n;
s = sqrt((x-m)'*(x - m)/n);

% 3 Random sampling means (1000 samples n=10)
set = 10; % 10 samples per set
samplenumb = 1000;
ms = [];

% Calculating means
for times = 1:samplenumb
    
    y = randsample(x, set, true);
    
    m = mean(y);
    
    ms = [ms m];
end


subplot(3, 1, 2)
histogram(ms, 15);
xlabel('Means');
ylabel('Frequency');


%variance1
mvar = var(ms);
dim = [.2 .3 .3 .3];
str = strcat('Variance', ' = ', num2str(mvar));
annotation('textbox',dim,'String',str,'FitBoxToText','on');

title('sample size 10');

% 4 sample 40

set = 40;
morems = [];

%mean of each
for times = 1:samplenumb
    
     y = randsample(x, set, true);
     
     m = mean(y);
    
     morems = [morems m];
end


  
%plotting sample 40
subplot(3, 1, 3)
histogram(morems, 15);
xlabel('Means');
ylabel('Frequency');

%variance2
mmvar = var(morems);
dim = [.2 .001 .3 .3];
str = strcat('Variance', ' = ', num2str(mmvar));
annotation('textbox',dim,'String',str,'FitBoxToText','on');

title('sample size 40');
    
% 5 Calculating z value

mfor5 = 64;
z = (m-mfor5)/(s/sqrt(81));


    
  



