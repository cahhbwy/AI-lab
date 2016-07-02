function [ypred,accuracy] = lsclassifier(traindata, trainlabel, testdata, testlabel, lambda)
trainsize=size(traindata,1);
datawidth=size(traindata,2);
testsize=size(testdata,1);
x=cat(2,ones(trainsize,1),im2bw(traindata/255,0.5));
y=trainlabel;
w=(x'*x+lambda*eye(datawidth+1))\x'*y;
ypred=cat(2,ones(testsize,1),im2bw(testdata/255,0.5))*w;
ypred=1-im2bw((ypred-min(ypred))/(max(ypred)-min(ypred)),0.5);
accuracy=sum(xor(ypred,testlabel))/testsize;