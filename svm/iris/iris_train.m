% 读取数据，并且处理
[attrib1, attrib2, attrib3, attrib4, class] = textread('./iris.data', '%f%f%f%f%s', 'delimiter', ',');
y= zeros(150, 1); 
y(strcmp(class, 'Iris-setosa')) = 1; 
y(strcmp(class, 'Iris-versicolor')) = 2; 
y(strcmp(class, 'Iris-virginica')) = 3;
% 总共150个数据集　分为150个训练集和120个测试集(平均抽取40个)
x=[attrib1,attrib2,attrib3,attrib4];


% 100个测试集
x_train=x(:,end);
y_train=y(:,end);
options='-t 0 -q';

% 120个训练集
y_test=y([1:40 51:90 101:140],end);
x_test=x([1:40 51:90 101:140],end);


model=svmtrain(y_train, x_train, options);

[y_predict,accuracy,prob_estimates]=svmpredict(y_test, x_test, model);


save result