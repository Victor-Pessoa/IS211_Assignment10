import sqlite3

conn = sqlite3.connect('music.db')

cursor = conn.cursor()

create_artists = '''
CREATE TABLE artists (
    artist_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);
'''

create_albums = '''
CREATE TABLE albums (
    album_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    artist_id INTEGER NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
);
'''

create_songs = '''
CREATE TABLE songs (
    song_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    album_id INTEGER NOT NULL,
    track_number INTEGER NOT NULL,
    duration_seconds INTEGER NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albums (album_id)
);
'''

cursor.execute(create_artists)
cursor.execute(create_albums)
cursor.execute(create_songs)

conn.commit()
conn.close()

