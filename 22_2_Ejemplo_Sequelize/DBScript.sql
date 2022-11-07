    #DROP DATABASE test;
    CREATE DATABASE test;
    USE test;
    CREATE TABLE users(
        id INT AUTO_INCREMENT,
        firstname VARCHAR(100),
        lastname VARCHAR(200),
        PRIMARY KEY(id)
    ); 
    
    INSERT INTO users VALUES(NULL, "Davinia", "de la Rosa");