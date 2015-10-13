import pyodbc
import csv
import time
# Drop/Create Table
def connectSQL2012(server,database):
    connectionstring = 'DRIVER={SQL Server};SERVER=' + server + ';Database=' + database + ';Trusted_Connection=True'
    conn = pyodbc.connect(connectionstring,autocommit=False,ansi=False,timeout=30)
    return conn

def load_earmark(input_file,connectionstring):
	cursor = conn.cursor()
	print "Import Earmarks"
	print (time.strftime("%H:%M:%S"))
	with open(input_file,'rb') as csvfile:
		reader = csv.DictReader(csvfile, delimiter=',')
		for row in reader:
			em_id = int(row['id'])
			em_import_reference_id = int(row['import_reference_id'])
			em_fiscal_year = int(row['fiscal_year'])
			em_budget_amount = float(row['budget_amount'])
			em_house_amount = float(row['house_amount'])
			em_senate_amount = float(row['senate_amount'])
			em_omni_amount = float(row['omni_amount'])
			em_final_amount = float(row['final_amount'])
			em_bill = str(row['bill'])
			em_bill_section = str(row['bill_section'])
			em_bill_subsection = str(row['bill_subsection'])
			em_description = str(row['description'])
			em_notes = str(row['notes'])
			em_presidential = str(row['presidential'])
			em_undisclosed = str(row['undisclosed'])
			em_house_members = str(row['house_members'])
			em_house_parties = str(row['house_parties'])
			em_house_states = str(row['house_states'])
			em_house_districts = str(row['house_districts'])
			em_senate_members = str(row['senate_members'])
			em_senate_parties = str(row['senate_parties'])
			em_senate_states = str(row['senate_states'])
			insert_str = "insert into [dbo].[earmark](id,import_reference_id,fiscal_year,budget_amount,house_amount,senate_amount,omni_amount,final_amount,bill,bill_section,bill_subsection,description,notes,presidential,undisclosed,house_members,house_parties,house_states,house_districts,senate_members,senate_parties,senate_states) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
			cursor.execute(insert_str,em_id,em_import_reference_id,em_fiscal_year,em_budget_amount,em_house_amount,em_senate_amount,em_omni_amount,em_final_amount,em_bill,em_bill_section,em_bill_subsection,em_description,em_notes,em_presidential,em_undisclosed,em_house_members,em_house_parties,em_house_states,em_house_districts,em_senate_members,em_senate_parties,em_senate_states)
#		print (row['id'], row['import_reference_id'], row['fiscal_year'], row['budget_amount'])
	conn.commit()
	csvfile.close()
	print (time.strftime("%H:%M:%S"))
	return()	

def load_member(input_file,connectionstring):
	cursor = conn.cursor()
	print "Import Members"
	print (time.strftime("%H:%M:%S"))
	with open(input_file,'rb') as csvfile:
		reader = csv.DictReader(csvfile, delimiter=',')
		for row in reader:
			mem_id = int(row['id'])
			mem_earmark_id = int(row['earmark_id'])
			mem_raw_name = str(row['raw_name'])
			mem_crp_id = str(row['crp_id'])
			mem_standardized_name = str(row['standardized_name'])
			mem_chamber = str(row['chamber'])
			mem_party = str(row['party'])
			mem_state = str(row['state'])
			mem_district = str(row['district'])
			insert_str = "insert into [dbo].[earmark_member](id,earmark_id,raw_name,crp_id,standardized_name,chamber,party,state,district) values (?,?,?,?,?,?,?,?,?)"
			cursor.execute(insert_str,mem_id,mem_earmark_id,mem_raw_name,mem_crp_id,mem_standardized_name,mem_chamber,mem_party,mem_state,mem_district)
	conn.commit()
	csvfile.close()
	print (time.strftime("%H:%M:%S"))
	return()	

def load_recipient(input_file,connectionstring):
	cursor = conn.cursor()
	print "Import Recipient"
	print (time.strftime("%H:%M:%S"))
	with open(input_file,'rb') as csvfile:
		reader = csv.DictReader(csvfile, delimiter=',')
		for row in reader:
			rec_id = int(row['id'])
			rec_earmark_id = int(row['earmark_id'])
			rec_raw_recipient = str(row['raw_recipient'])
			rec_standardized_recipient = str(row['standardized_recipient'])
			insert_str = "insert into [dbo].[earmark_recipient](id,earmark_id,raw_recipient,standardized_recipient) values (?,?,?,?)"
			cursor.execute(insert_str,rec_id,rec_earmark_id,rec_raw_recipient,rec_standardized_recipient)
	conn.commit()
	csvfile.close()
	print (time.strftime("%H:%M:%S"))
	return()	

def load_location(input_file,connectionstring):
	cursor = conn.cursor()
	print "Import Location"
	print (time.strftime("%H:%M:%S"))
	with open(input_file,'rb') as csvfile:
		reader = csv.DictReader(csvfile, delimiter=',')
		for row in reader:
			loc_id = int(row['id'])
			loc_earmark_id = int(row['earmark_id'])
			loc_city = str(row['city'])
			loc_state = str(row['state'])
			insert_str = "insert into [dbo].[earmark_location](id,earmark_id,city,state) values (?,?,?,?)"
			cursor.execute(insert_str,loc_id,loc_earmark_id,loc_city,loc_state)
	conn.commit()
	csvfile.close()
	print (time.strftime("%H:%M:%S"))
	return()	

if __name__ == '__main__':
	conn = connectSQL2012('JDeA_8760w','Sunlight')
 	load_earmark('fixtures\earmark.csv',conn)
  	load_member('fixtures\member.csv',conn)
	load_recipient('fixtures\Recipient.csv',conn)
	load_location('fixtures\location.csv',conn)