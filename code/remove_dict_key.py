import csv

keys = []

with open('data.csv') as f:
    header = csv.reader(f)
    keys = next(header)

with open('dict.csv', 'rb') as inp, open('dict_edit.csv', 'wb') as out:
    reader = csv.DictReader(inp)
    writer = csv.DictWriter(out, fieldnames = reader.fieldnames)
    writer.writeheader()
    go = True
    for row in reader:
        varname = row['VARIABLE NAME']
        if varname in keys or (varname is '' and go):
            writer.writerow(row)
            go = True
        else:
            go = False
