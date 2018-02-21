spam= c(0.00062, 0.005, 0.00015	, 0.00001, 0.000015	, 0.002, 0.00025, 0.001, 0.0003)
nospam=c(0.000000035, 0.0001, 0.0007, 0.001, 0.0008, 0.0005, 0.00014, 0.0000003, 0.000004)

pxspam = sum(spam)
pxnotspam = sum(nospam)
pspam = 0.9
pnotspam = 0.1

w_spam_Customers = 	0.005
w_spam_Watches = 	0.0003
w_nonspam_Customers = 	0.0001
w_nonspam_Watches = 	0.000004


test_spam = ((0.00062)*(0.005)*(0.00015)*(0.00001)*(0.000015)*(0.002)*(0.00025)*(0.001)*(0.0003))*pspam
test_nonspam = ((0.000000035)*(0.0001)*(0.0007)*(0.001)*(0.0008)
                *(0.0005)*(0.00014)
                *(0.0000003)*(0.000004))*pnotspam


pw_spam = ((0.00062*pspam)+(0.005*pspam)+(0.00015*pspam)+(0.00001*pspam)+(0.000015*pspam)+(0.002*pspam)+(0.00025*pspam)
           +(0.001*pspam)+(0.0003*pspam))

pw_notspam = ((0.000000035*pnotspam)+(0.0001*pnotspam)+(0.0007*pnotspam)+(0.001*pnotspam)+(0.0008*pnotspam)
              +(0.0005*pnotspam)+(0.00014*pnotspam)
              +(0.0000003*pnotspam)+(0.000004*pnotspam))

#question 1
p_spam_given_x = ((w_spam_Customers)*(w_spam_Watches)*pspam)/(pw_spam+pw_notspam)

p_notspam_given_x = ((w_nonspam_Customers)*(w_nonspam_Watches)*pnotspam)/(pw_spam+pw_notspam)
ratio_q1 = ((w_spam_Customers)*(w_spam_Watches)*pspam)/((w_nonspam_Customers)*(w_nonspam_Watches)*pnotspam)


print(((w_spam_Customers)*(w_spam_Watches)*pspam))
print(((w_nonspam_Customers)*(w_nonspam_Watches)*pnotspam))

print(p_spam_given_x)
print(p_notspam_given_x)
print(ratio_q1)

#question 2
w_spam_fun = 	0.00015
w_spam_vacation = 	0.00025
w_nonspam_fun = 	0.0007
w_nonspam_vacation = 	0.00014


p_spam_given_x_q2 = ((w_spam_fun)*(w_spam_vacation)*pspam)/(pw_spam+pw_notspam)
p_notspam_given_x_q2 = ((w_nonspam_fun)*(w_nonspam_vacation)*pnotspam)/(pw_spam+pw_notspam)
ratio_q2 = ((w_spam_fun)*(w_spam_vacation)*pspam)/((w_nonspam_fun)*(w_nonspam_vacation)*pnotspam)

print(((w_spam_fun)*(w_spam_vacation)*pspam))
print(((w_nonspam_fun)*(w_nonspam_vacation)*pnotspam))
print(p_spam_given_x_q2)
print(p_notspam_given_x_q2)
print(ratio_q2)
