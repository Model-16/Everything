import csv
import pandas as pd
import numpy as np

keys = []

with open('../ProblemCDATA/dict.csv', 'rb') as inp:
    reader = csv.DictReader(inp)
    for row in reader:
        cate = row['dev-category']
        if cate != "school" and cate != "root" and cate !="":
            keys.append(row['VARIABLE NAME'])

data = []
with open('../ProblemCDATA/data.csv', 'rb') as inp:
    reader = csv.DictReader(inp)
    for row in reader:
        data_row = []
        for k in row.keys():
            if k in keys:
                if row[k] != "NULL" and row[k] != "PrivacySuppressed":
                    data_row.append(row[k])
                else:
                    data_row.append(np.NaN)
        data.append(data_row)


d = np.array(data).astype(float)
df = pd.DataFrame(data = d, columns = keys)
r = df.corr()
np.savetxt("cor.out", r)

