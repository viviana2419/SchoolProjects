import pandas as pd
import seaborn as sns

movies_data=pd.read_csv('movies_data.csv')
print(movies_data.shape)#data shape
print(movies_data.shape[1]) #check # of columns
print(movies_data[0:10])#check row0-10
movies_short =movies_data[['budget','revenue']]
new_data = movies_short[movies_short.budget >= 5000000]
print('#of rows that budget greater than or equal to 5,000,000:',new_data.shape[1])
    
print(movies_data.min())  
print(movies_data['budget'].var()) 
print(movies_data['popularity'].median())     

movies_rank=movies_data[['title', 'popularity']]
a = movies_rank.sort_values(by='popularity', ascending=False) 

p=movies_data.plot.scatter(x='budget', y='popularity')

#titanic 
t=pd.read_csv('titanic.csv')
dummy_embarked=pd.get_dummies(t.Embarked, prefix='em')
t=t.join(dummy_embarked)
t.to_csv('titanic.csv')

sns.catplot(x="Embarked", y="Survived", kind="bar", data=t)
sns.catplot(x="Sex", y="Survived", hue="Embarked", kind="bar", data=t)
#interpretation: female has higher survival rate, C class survival rate is highest among all

t['PassengerId'].groupby([t['Pclass']]).count()
t['Age'].groupby([t['Sex'],t['Pclass']]).mean()
