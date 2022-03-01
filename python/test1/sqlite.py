import sqlite3 as lite 
import time

# database_file = 'test.db'
database_file = ':memory:'
conn = lite.connect(database_file)
cs = conn.cursor()

#drop table
query = 'drop table if exists t1'
cs.execute(query)

#create table
query = 'create table if not exists t1 (id integer primary_key not null, name varchar(25), at datetime)'
cs.execute(query)

#insert table
chars = 'abcdefghijklmnopqrstuvwxyz'
for i in range(len(chars)):
    query = 'insert into t1 values (?, ?, datetime("now"))'
    cs.execute(query, (i, chars[i]))
conn.commit()

#select table
query = 'select * from t1 where name >"e";'
cs.execute(query)
all_rows = cs.fetchall()
for i in all_rows:
    print(i)
print("\n"*3)



#update table
time.sleep(2)
query = 'update t1 set name = upper(name), at = datetime("now") where name > "r";'
cs.execute(query)
conn.commit()

#check
def check():
    query = 'select * from t1'
    cs.execute(query)
    all_rows = cs.fetchall()
    for i in all_rows:
        print (i)
    print("\n"*3)

#delete
query = 'delete from t1 where name = "f" '
cs.execute(query)
conn.commit

check()

cs.close()
conn.close()
