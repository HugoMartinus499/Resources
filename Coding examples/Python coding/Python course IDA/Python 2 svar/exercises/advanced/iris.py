import pandas as pd 
import numpy as np 
from sklearn.linear_model import LogisticRegression
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split

df = pd.read_csv("iris.data")
X = df[['sepal_length','sepal_width','petal_length','petal_width']]
X = np.asarray(X)
y = df['type']
y = np.asarray(y)

#plt.plot(X[:,0], X[:,2], 'ro')
#plt.show()

X_train, X_test, y_train, y_test = train_test_split(X,y, test_size=0.20)

model = LogisticRegression().fit(X_train, y_train)
y_predicted = model.predict(X_test)

accuracy = np.mean(y_predicted == y_test)
print(accuracy)