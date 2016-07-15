clear; clc;


subList = {'h1', 'h2', 'h3', 'h4', 'h5', 'h9','h13', 's1', 's3', 's4'};

numSubjects = length(subList);
numQuestions = 19;
qAnsData = zeros(numSubjects, numQuestions);

loadQData;