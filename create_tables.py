import sqlite3

conn = sqlite3.connect('pets.db')
cursor = conn.cursor()

create_person = '''
CREATE TABLE IF NOT EXISTS person (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    age INTEGER
);
'''

create_pet = '''
CREATE TABLE IF NOT EXISTS pet (
    id INTEGER PRIMARY KEY,
    name TEXT,
    breed TEXT,
    age INTEGER,
    dead INTEGER
);
'''

create_person_pet = '''
CREATE TABLE IF NOT EXISTS person_pet (
    person_id INTEGER,
    pet_id INTEGER,
    FOREIGN KEY (person_id) REFERENCES person (id),
    FOREIGN KEY (pet_id) REFERENCES pet (id)
);
'''

cursor.execute(create_person)
cursor.execute(create_pet)
cursor.execute(create_person_pet)

conn.commit()
conn.close()
