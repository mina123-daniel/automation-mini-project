*** Settings ***
Library    DatabaseLibrary
Resource   Variables.resource

*** Keywords ***
Connect To Test Database
    Connect To Database Using Custom Params     sqlite3    database='${DB_PATH}'

Disconnect From Test Database
    Disconnect From Database

Create Database
    execute sql string    CREATE TABLE IF NOT EXISTS users ( id INTEGER PRIMARY KEY AUTOINCREMENT,
    ...                                                     name TEXT NOT NULL, email TEXT NOT NULL);
Insert User Into Db
    [Arguments]    ${name}    ${email}
    Execute Sql String    INSERT INTO users(name, email) VALUES ('${name}', '${email}');

Get Any User From Db
    ${rows}=    Query    SELECT id, name, email FROM users LIMIT 1;
    [Return]    ${rows}

Users Table Should Not Be Empty
    ${rows}=    Query    SELECT * FROM users;
    Length Should Be Greater Than    ${rows}    0
