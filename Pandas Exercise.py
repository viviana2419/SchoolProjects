import pandas as pd
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




