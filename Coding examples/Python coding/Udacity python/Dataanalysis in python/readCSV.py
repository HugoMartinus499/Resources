import unicodecsv

enrollments_filename = 'Data/enrollments.csv'

## Longer version of code (replaced with shorter, equivalent version below)

# enrollments = []
# f = open(enrollments_filename, 'rb')
# reader = unicodecsv.DictReader(f)
# for row in reader:
#     enrollments.append(row)
# f.close()

with open(enrollments_filename, 'rb') as f:
    reader = unicodecsv.DictReader(f)
    enrollments = list(reader)
    
### Write code similar to the above to load the engagement
### and submission data. The data is stored in files with
### the given filenames. Then print the first row of each
### table to make sure that your code works. You can use the
### "Test Run" button to see the output of your code.

engagement_filename = 'Data/daily_engagement.csv'
submissions_filename = 'Data/project_submissions.csv'


with open(engagement_filename, 'rb') as ef:
    reader1 = unicodecsv.DictReader(ef)
    daily_engagement = list(reader1)     

with open(submissions_filename, 'rb') as sf:
    reader2 = unicodecsv.DictReader(sf)
    project_submissions = list(reader2)  
    
print(daily_engagement[1])
print(project_submissions[1])