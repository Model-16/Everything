import csv

uids = []

with open('../ProblemCDATA/schools.csv', 'rb') as inp:
    reader = csv.DictReader(inp)
    for row in reader:
        uids.append(row['UNITID'])


with open('../ProblemCDATA/data.csv', 'rb') as inp, open('data_filtered.csv', 'wb') as out:
    reader = csv.DictReader(inp)
    writer = csv.DictWriter(out, fieldnames = reader.fieldnames)
    writer.writeheader()
    for row in reader:
        uid = row['UNITID']
        if uid in uids and row['CURROPER'] == '1':
            writer.writerow(row)
