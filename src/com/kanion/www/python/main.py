__author__ = 'Bigbao'
import sys
import math
def test():
	print('hellow world')

def adder(a, b):
	return a + b

def cal_s2(x):
	mean_x=float(float(sum(x))/len(x))
	s2=list()
	for i in x:
		s2.append((i-mean_x)**2)
	return math.sqrt((float(sum(s2))/len(x)))

def get_cor(X,Y):
	
	mean_X=float(sum(X))/len(X)
	mean_Y=float(sum(Y))/len(Y)
	x_minus_mean=list()
	y_minus_mean=list()
	for i in X:
		x_minus_mean.append(i-mean_X)
	for j in Y:
		y_minus_mean.append(j-mean_Y)
	# print('x_minus_mean')
	#
	# print(x_minus_mean)
	# print(y_minus_mean)
	cov_list=list()
	for i in range(len(X)):
		cov_list.append(x_minus_mean[i]*y_minus_mean[i])
	# print('cov_list')
	# print(cov_list)
	cor_value=float(sum(cov_list))/len(X)/cal_s2(X)/cal_s2(Y)
	return cor_value




# X=[1,2,3]
# Y=[4,5,9]
# print(get_cor(X,Y))
# print('hai')
