train_mnist= importdata('mnist_train.csv');
train=train_mnist.data;
x_train=train(1:60,2:end);
y_train=train(1:60,1);



test_mnist= importdata('mnist_test.csv');
test=test_mnist.data;
x_test=test(1:10,2:end);
y_test=test(1:10,1);


options='-t 0 -q';

model=svmtrain(y_train, x_train, options);
[y_predict,accuracy,prob_estimates]=svmpredict(y_test, x_test, model);