
--Ordering by largest total donations

Select *
From BDADataSet
Order by total_amount_donoated DESC

--Ordering by smallest total donations

Select *
From BDADataSet
Order by total_amount_donoated 

--Counting total rows of the data set

Select Count(donor_id)
From BDADataSet

--Cleaning up Data Set

Select *
From BDADataSet
Where total_amount_donoated < most_recent_donoation_amount OR most_recent_donoation_amount Like '-%'

Delete 
From BDADataSet
Where total_amount_donoated < most_recent_donoation_amount OR most_recent_donoation_amount Like '-%'

--Removed 2,187 rows

Select most_recent_donoation_amount, total_number_donations, total_amount_donoated
From BDADataSet
Order by most_recent_donoation_amount

Select most_recent_donoation_amount, total_number_donations, total_amount_donoated
From BDADataSet
Where total_amount_donoated < most_recent_donoation_amount + ((total_number_donations - 1) / 100)

--Remove 1 more line

Delete
From BDADataSet
Where total_amount_donoated < most_recent_donoation_amount + ((total_number_donations - 1) / 100)

-- Fixing degree_year

Select Min(degree_year), Max(degree_year)
From BDADataSet

Select degree_year
From BDADataSet
Where degree_year Like '3%'

Update dbo.BDADataSet
Set degree_year = degree_year - 1000
Where degree_year Like '3%'

--2499 rows updated


--Consolidating states 

Select Distinct(donor_mailing_state) as states
From BDADataSet

Select Count(donor_mailing_state)
From BDADataSet
Where donor_mailing_state = 'CT'

Select Count(donor_mailing_state)
From BDADataSet
Where donor_mailing_state = 'Conneticut'

Update dbo.BDADataSet
Set donor_mailing_state = 'CT'
Where donor_mailing_state = 'Connecticut'

--Strange values for age

Select Min(donor_age), Max(donor_age)
From BDADataSet


--New Tables

--#1
Select donor_id, donor_gender, donor_mailing_state, total_amount_donoated, degree_college, degree_level
From BDADataSet

--#2
Select donor_id, donor_gender, total_amount_donoated
From BDADataSet

--#3
Select donor_id, donor_mailing_state, total_amount_donoated
From BDADataSet

--#4
Select donor_id, total_amount_donoated, degree_college
From BDADataSet

--#5
Select donor_id, total_amount_donoated, degree_level
From BDADataSet